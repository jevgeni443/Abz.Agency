/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: database_development
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES
('20240801114040-create-user.js'),
('20240805082901-add-image-url-to-users.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES
(1,'User0','LastName0','user0@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(2,'User1','LastName1','user1@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(3,'User2','LastName2','user2@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(4,'User3','LastName3','user3@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(5,'User4','LastName4','user4@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(6,'User5','LastName5','user5@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(7,'User6','LastName6','user6@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(8,'User7','LastName7','user7@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(9,'User8','LastName8','user8@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(10,'User9','LastName9','user9@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(11,'User10','LastName10','user10@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(12,'User11','LastName11','user11@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(13,'User12','LastName12','user12@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(14,'User13','LastName13','user13@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(15,'User14','LastName14','user14@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(16,'User15','LastName15','user15@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(17,'User16','LastName16','user16@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(18,'User17','LastName17','user17@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(19,'User18','LastName18','user18@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(20,'User19','LastName19','user19@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(21,'User20','LastName20','user20@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(22,'User21','LastName21','user21@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(23,'User22','LastName22','user22@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(24,'User23','LastName23','user23@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(25,'User24','LastName24','user24@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(26,'User25','LastName25','user25@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(27,'User26','LastName26','user26@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(28,'User27','LastName27','user27@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(29,'User28','LastName28','user28@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(30,'User29','LastName29','user29@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(31,'User30','LastName30','user30@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(32,'User31','LastName31','user31@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(33,'User32','LastName32','user32@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(34,'User33','LastName33','user33@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(35,'User34','LastName34','user34@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(36,'User35','LastName35','user35@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(37,'User36','LastName36','user36@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(38,'User37','LastName37','user37@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(39,'User38','LastName38','user38@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(40,'User39','LastName39','user39@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(41,'User40','LastName40','user40@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(42,'User41','LastName41','user41@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(43,'User42','LastName42','user42@example.com','2024-08-01 12:07:16','2024-08-01 12:07:16',NULL),
(110,'Dmitri','Gubin','gubin443@gmail.com','2024-08-05 15:49:44','2024-08-05 15:49:44','optimized-1722872983711-pngtree-user-icon-isolated-on-abstract-background-png-image_5192004.jpg');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-08-06 10:41:47
