"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const users = await queryInterface.sequelize.query(`SELECT id FROM Users`, {
      type: queryInterface.sequelize.QueryTypes.SELECT,
    });

    for (const user of users) {
      const imageUrl = ``;
      await queryInterface.bulkUpdate("Users", { imageUrl }, { id: user.id });
    }
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkUpdate("Users", { imageUrl: null }, {});
  },
};
