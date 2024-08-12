const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const { Sequelize, DataTypes } = require("sequelize");
const axios = require("axios");
const multer = require("multer");
const path = require("path");
const fs = require("fs");
const { body, validationResult } = require("express-validator");
require("dotenv").config();

const sslCaPath = path.join(__dirname, "certs", "rds-combined-ca-bundle.pem");

const sequelize = new Sequelize(process.env.JAWSDB_URL, {
  dialect: "mysql",
  dialectOptions: {
    ssl: {
      ca: fs.readFileSync(sslCaPath),
    },
  },
});

sequelize.authenticate();

const app = express();

app.use(
  cors({
    origin: "*",
    methods: "GET,POST,PUT,DELETE",
    allowedHeaders: "Content-Type,Authorization",
  })
);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, "public"));
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`);
  },
});
const upload = multer({ storage });

const User = sequelize.define("User", {
  firstName: { type: DataTypes.STRING, allowNull: false },
  lastName: { type: DataTypes.STRING, allowNull: false },
  email: { type: DataTypes.STRING, allowNull: false, unique: true },
  imageUrl: { type: DataTypes.STRING, allowNull: true },
  phone: { type: DataTypes.STRING, allowNull: true },
  positionId: { type: DataTypes.INTEGER, allowNull: true },
  position: { type: DataTypes.STRING, allowNull: true },
});

app.get("/users", async (req, res) => {
  try {
    const users = await User.findAll();
    res.json(users);
  } catch (error) {
    console.error("Error fetching users:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.get("/positions", (req, res) => {
  try {
    res.json(
      Object.keys(positionMap).map((position) => ({
        position,
        positionId: positionMap[position],
      }))
    );
  } catch (error) {
    console.error("Error fetching positions:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

const positionMap = {
  Lawyer: 1,
  "Content manager": 2,
  Security: 3,
  Designer: 4,
};

app.post(
  "/users",
  upload.single("image"),
  [
    body("firstName")
      .isString()
      .isLength({ min: 2, max: 60 })
      .withMessage("First name should contain 2-60 characters."),

    body("lastName")
      .isString()
      .isLength({ min: 2, max: 60 })
      .withMessage("Last name should contain 2-60 characters."),

    body("email")
      .isEmail()
      .withMessage("Invalid email format.")
      .matches(
        /^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/
      )
      .withMessage("Email does not match the required pattern.")
      .isLength({ min: 6, max: 100 })
      .withMessage("Email length should be between 6 and 100 characters.")
      .custom(async (value) => {
        const user = await User.findOne({ where: { email: value } });
        if (user) {
          throw new Error("Email already in use.");
        }
      }),

    body("phone")
      .optional()
      .matches(/^(?:\+380)?[0-9]{9}$/, "i")
      .withMessage("User phone number must start with code of Ukraine +380."),

    body("position").custom((value) => {
      if (!positionMap[value]) {
        throw new Error("Invalid position.");
      }
      return true;
    }),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { firstName, lastName, email, phone, position } = req.body;
    const imagePath = req.file
      ? path.join(__dirname, "public", req.file.filename)
      : null;

    if (!req.file) {
      return res.status(400).json({ error: "No file received" });
    }

    try {
      let imageUrl = null;
      if (imagePath) {
        const imageData = fs.readFileSync(imagePath);
        console.log("Image data length:", imageData.length);

        const response = await axios.post(
          "https://api.tinify.com/shrink",
          imageData,
          {
            auth: {
              username: "api",
              password: "ZzvyLc1fQWCFSzy9G25DJjKZy5CYZ479",
            },
          }
        );

        const optimizedImage = await axios.get(response.data.output.url, {
          responseType: "arraybuffer",
        });

        const optimizedImagePath = path.join(
          __dirname,
          "public",
          `optimized-${req.file.filename}`
        );
        fs.writeFileSync(optimizedImagePath, optimizedImage.data);

        imageUrl = `optimized-${req.file.filename}`;
      }

      const positionId = positionMap[position];

      const user = await User.create({
        firstName,
        lastName,
        email,
        imageUrl,
        phone,
        positionId,
        position,
      });

      res.status(201).json(user);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  }
);

app.use("/public", express.static(path.join(__dirname, "public")));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
