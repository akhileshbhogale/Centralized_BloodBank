CREATE DATABASE  IF NOT EXISTS `blood_bank` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blood_bank`;
-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: blood_bank
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_fk` (`type_id`),
  CONSTRAINT `address_fk` FOREIGN KEY (`type_id`) REFERENCES `usertypes` (`user_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'hospital1@gmail.com','ABC chowk','Pune',2),(2,'bloodbank1@gmail.com','XYZ colony','Pune',3),(3,'akhileshbhogale@gmail.com','Shaniwar Wada','Pune',1),(4,'tanjulr@gmail.com','SB road','Pune',1),(5,'bloodbank3@gmail.com','akurdi','Pune',3),(6,'hospital1@gmail.com','fc road','Nanded',2),(7,'hospital2@gmail.com','Kothrud','Pune',2);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbagtypes`
--

DROP TABLE IF EXISTS `bloodbagtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodbagtypes` (
  `blood_bag_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_bag_type` varchar(50) DEFAULT NULL,
  `blood_bag_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`blood_bag_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbagtypes`
--

LOCK TABLES `bloodbagtypes` WRITE;
/*!40000 ALTER TABLE `bloodbagtypes` DISABLE KEYS */;
INSERT INTO `bloodbagtypes` VALUES (1,'Single','Consists Whole Blood(CPDA- Citrate Phosphate Dextrose Adinine)'),(2,'Double','Red Bolld cells + Plasma'),(3,'Triple','Red Blood cells + Plasma+ Platelets');
/*!40000 ALTER TABLE `bloodbagtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbanks`
--

DROP TABLE IF EXISTS `bloodbanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodbanks` (
  `bb_email` varchar(50) NOT NULL,
  `bb_name` varchar(50) DEFAULT NULL,
  `bb_contact` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bb_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbanks`
--

LOCK TABLES `bloodbanks` WRITE;
/*!40000 ALTER TABLE `bloodbanks` DISABLE KEYS */;
INSERT INTO `bloodbanks` VALUES ('bloodbank1@gmail.com','Blood Bank 1','123125521'),('bloodbank2@gmail.com','Blood Bank 2','312312343'),('bloodbank3@gmail.com','bloodbank3','777777777');
/*!40000 ALTER TABLE `bloodbanks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `blood_bank`.`bloodbanks_AFTER_INSERT` AFTER INSERT ON `bloodbanks` FOR EACH ROW
BEGIN
	INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,1,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,2,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,3,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,4,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,5,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,6,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,7,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,8,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,1,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,2,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,3,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,4,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,5,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,6,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,7,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,8,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,1,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,2,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,3,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,4,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,5,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,6,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,7,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.bb_email,8,3,0,0);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bloodgroups`
--

DROP TABLE IF EXISTS `bloodgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodgroups` (
  `blood_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`blood_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodgroups`
--

LOCK TABLES `bloodgroups` WRITE;
/*!40000 ALTER TABLE `bloodgroups` DISABLE KEYS */;
INSERT INTO `bloodgroups` VALUES (1,'A+'),(2,'A-'),(3,'B+'),(4,'B-'),(5,'AB+'),(6,'AB-'),(7,'O+'),(8,'O-');
/*!40000 ALTER TABLE `bloodgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campregistrations`
--

DROP TABLE IF EXISTS `campregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campregistrations` (
  `camp_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  PRIMARY KEY (`camp_id`,`user_email`),
  KEY `campregistration_email_fk` (`user_email`),
  CONSTRAINT `campregistration_campid_fk` FOREIGN KEY (`camp_id`) REFERENCES `donationcamps` (`camp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `campregistration_email_fk` FOREIGN KEY (`user_email`) REFERENCES `users` (`user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campregistrations`
--

LOCK TABLES `campregistrations` WRITE;
/*!40000 ALTER TABLE `campregistrations` DISABLE KEYS */;
INSERT INTO `campregistrations` VALUES (1,'akhileshbhogale@gmail.com'),(1,'tanjulr@gmail.com');
/*!40000 ALTER TABLE `campregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationcamps`
--

DROP TABLE IF EXISTS `donationcamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donationcamps` (
  `camp_id` int(11) NOT NULL AUTO_INCREMENT,
  `organizer_email` varchar(50) DEFAULT NULL,
  `camp_venue` varchar(50) DEFAULT NULL,
  `camp_date` date DEFAULT NULL,
  `camp_timing` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`camp_id`),
  KEY `donationcamp_email_fk` (`organizer_email`),
  CONSTRAINT `donationcamp_email_fk` FOREIGN KEY (`organizer_email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationcamps`
--

LOCK TABLES `donationcamps` WRITE;
/*!40000 ALTER TABLE `donationcamps` DISABLE KEYS */;
INSERT INTO `donationcamps` VALUES (1,'hospital1@gmail.com','Akurdi','2019-02-05','10 AM'),(3,'bloodbank2@gmail.com','mumbai','2019-01-26','5:00'),(4,'hospital2@gmail.com','Swargate','2019-02-02','12');
/*!40000 ALTER TABLE `donationcamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitals` (
  `hospital_email` varchar(50) NOT NULL,
  `hospital_name` varchar(50) DEFAULT NULL,
  `hospital_contact` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hospital_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES ('hospital1@gmail.com','Hospital1','232456723');
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `blood_bank`.`hospitals_AFTER_INSERT` AFTER INSERT ON `hospitals` FOR EACH ROW
BEGIN
	INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,1,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,2,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,3,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,4,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,5,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,6,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,7,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,8,1,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,1,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,2,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,3,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,4,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,5,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,6,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,7,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,8,2,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,1,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,2,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,3,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,4,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,5,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,6,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,7,3,0,0);
    INSERT INTO `blood_bank`.`stocks` (`owner_email`,`blood_group_id`,`blood_bag_type_id`,`quantity`,`price`) VALUES (NEW.hospital_email,8,3,0,0);
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logindetails`
--

DROP TABLE IF EXISTS `logindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logindetails` (
  `login_email` varchar(50) NOT NULL,
  `login_password` varchar(50) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`login_email`),
  KEY `login_fk` (`user_type_id`),
  CONSTRAINT `login_fk` FOREIGN KEY (`user_type_id`) REFERENCES `usertypes` (`user_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logindetails`
--

LOCK TABLES `logindetails` WRITE;
/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` VALUES ('akhileshbhogale@gmail.com','akhilesh@123',1),('bloodbank1@gmail.com','bloodbank1@123',3),('bloodbank2@gmail.com','bloodbank2@123',3),('bloodbank3@gmail.com','bloodbank3@123',3),('hospital1@gmail.com','hospital1@123',2),('hospital2@gmail.com','hospital2@123',2),('hospital3@gmail.com','hospital3@123',2),('tanjulr@gmail.com','tanu@123',1);
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `buyer_email` varchar(50) DEFAULT NULL,
  `stock_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_type` varchar(50) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`stock_id`),
  KEY `order_email_fk` (`buyer_email`),
  KEY `order_stockid_fk` (`stock_id`),
  KEY `order_addressid_fk` (`address_id`),
  CONSTRAINT `order_addressid_fk` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_email_fk` FOREIGN KEY (`buyer_email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_stockid_fk` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'akhileshbhogale@gmail.com',2,3,750,'2019-01-23 18:30:00','PICKUP',NULL),(4,'tanjulr@gmail.com',26,1,250,'2019-01-26 14:02:04','pickup',NULL),(5,'tanjulr@gmail.com',2,1,250,'2019-01-24 14:39:59','pickup',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `blood_bank`.`orders_AFTER_INSERT` AFTER INSERT ON `orders` FOR EACH ROW
BEGIN
	DECLARE old_quantity INT;
	SET old_quantity=(SELECT quantity 
    FROM `blood_bank`.`stocks` 
    WHERE `stock_id`=NEW.stock_id);
	
    UPDATE `blood_bank`.`stocks` 
    SET `quantity` = old_quantity-NEW.quantity 
    WHERE (`stock_id` = NEW.stock_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_email` varchar(50) DEFAULT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `blood_bag_type_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `stock_email_fk` (`owner_email`),
  KEY `stock_bloodgroup_fk` (`blood_group_id`),
  KEY `stock_bloodbagtype_fk` (`blood_bag_type_id`),
  CONSTRAINT `stock_bloodbagtype_fk` FOREIGN KEY (`blood_bag_type_id`) REFERENCES `bloodbagtypes` (`blood_bag_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stock_bloodgroup_fk` FOREIGN KEY (`blood_group_id`) REFERENCES `bloodgroups` (`blood_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stock_email_fk` FOREIGN KEY (`owner_email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (2,'hospital2@gmail.com',1,1,9,250),(3,'hospital2@gmail.com',2,1,1,300),(4,'hospital2@gmail.com',3,1,0,0),(5,'hospital2@gmail.com',4,1,0,0),(6,'hospital2@gmail.com',5,1,0,0),(7,'hospital2@gmail.com',6,1,0,0),(8,'hospital2@gmail.com',7,1,0,0),(9,'hospital2@gmail.com',8,1,0,0),(10,'hospital2@gmail.com',1,2,0,0),(11,'hospital2@gmail.com',2,2,0,0),(12,'hospital2@gmail.com',3,2,0,0),(13,'hospital2@gmail.com',4,2,0,0),(14,'hospital2@gmail.com',5,2,0,0),(15,'hospital2@gmail.com',6,2,0,0),(16,'hospital2@gmail.com',7,2,0,0),(17,'hospital2@gmail.com',8,2,0,0),(18,'hospital2@gmail.com',1,3,0,0),(19,'hospital2@gmail.com',2,3,0,0),(20,'hospital2@gmail.com',3,3,0,0),(21,'hospital2@gmail.com',4,3,0,0),(22,'hospital2@gmail.com',5,3,0,0),(23,'hospital2@gmail.com',6,3,0,0),(24,'hospital2@gmail.com',7,3,0,0),(25,'hospital2@gmail.com',8,3,0,0),(26,'bloodbank2@gmail.com',1,1,8,0),(27,'bloodbank2@gmail.com',2,1,0,0),(28,'bloodbank2@gmail.com',3,1,0,0),(29,'bloodbank2@gmail.com',4,1,0,0),(30,'bloodbank2@gmail.com',5,1,0,0),(31,'bloodbank2@gmail.com',6,1,0,0),(32,'bloodbank2@gmail.com',7,1,0,0),(33,'bloodbank2@gmail.com',8,1,0,0),(34,'bloodbank2@gmail.com',1,2,0,0),(35,'bloodbank2@gmail.com',2,2,0,0),(36,'bloodbank2@gmail.com',3,2,0,0),(37,'bloodbank2@gmail.com',4,2,0,0),(38,'bloodbank2@gmail.com',5,2,0,0),(39,'bloodbank2@gmail.com',6,2,0,0),(40,'bloodbank2@gmail.com',7,2,0,0),(41,'bloodbank2@gmail.com',8,2,0,0),(42,'bloodbank2@gmail.com',1,3,0,0),(43,'bloodbank2@gmail.com',2,3,0,0),(44,'bloodbank2@gmail.com',3,3,0,0),(45,'bloodbank2@gmail.com',4,3,0,0),(46,'bloodbank2@gmail.com',5,3,0,0),(47,'bloodbank2@gmail.com',6,3,0,0),(48,'bloodbank2@gmail.com',7,3,0,0),(49,'bloodbank2@gmail.com',8,3,0,0),(51,'hospital3@gmail.com',1,1,0,0),(52,'hospital3@gmail.com',2,1,0,0),(53,'hospital3@gmail.com',3,1,0,0),(54,'hospital3@gmail.com',4,1,0,0),(55,'hospital3@gmail.com',5,1,0,0),(56,'hospital3@gmail.com',6,1,0,0),(57,'hospital3@gmail.com',7,1,0,0),(58,'hospital3@gmail.com',8,1,0,0),(59,'hospital3@gmail.com',1,2,0,0),(60,'hospital3@gmail.com',2,2,0,0),(61,'hospital3@gmail.com',3,2,0,0),(62,'hospital3@gmail.com',4,2,0,0),(63,'hospital3@gmail.com',5,2,0,0),(64,'hospital3@gmail.com',6,2,0,0),(65,'hospital3@gmail.com',7,2,0,0),(66,'hospital3@gmail.com',8,2,0,0),(67,'hospital3@gmail.com',1,3,0,0),(68,'hospital3@gmail.com',2,3,0,0),(69,'hospital3@gmail.com',3,3,0,0),(70,'hospital3@gmail.com',4,3,0,0),(71,'hospital3@gmail.com',5,3,0,0),(72,'hospital3@gmail.com',6,3,0,0),(73,'hospital3@gmail.com',7,3,0,0),(74,'hospital3@gmail.com',8,3,0,0),(75,'bloodbank3@gmail.com',1,1,0,0),(76,'bloodbank3@gmail.com',2,1,0,0),(77,'bloodbank3@gmail.com',3,1,0,0),(78,'bloodbank3@gmail.com',4,1,0,0),(79,'bloodbank3@gmail.com',5,1,0,0),(80,'bloodbank3@gmail.com',6,1,0,0),(81,'bloodbank3@gmail.com',7,1,0,0),(82,'bloodbank3@gmail.com',8,1,0,0),(83,'bloodbank3@gmail.com',1,2,0,0),(84,'bloodbank3@gmail.com',2,2,0,0),(85,'bloodbank3@gmail.com',3,2,0,0),(86,'bloodbank3@gmail.com',4,2,0,0),(87,'bloodbank3@gmail.com',5,2,0,0),(88,'bloodbank3@gmail.com',6,2,0,0),(89,'bloodbank3@gmail.com',7,2,0,0),(90,'bloodbank3@gmail.com',8,2,0,0),(91,'bloodbank3@gmail.com',1,3,0,0),(92,'bloodbank3@gmail.com',2,3,0,0),(93,'bloodbank3@gmail.com',3,3,0,0),(94,'bloodbank3@gmail.com',4,3,0,0),(95,'bloodbank3@gmail.com',5,3,0,0),(96,'bloodbank3@gmail.com',6,3,0,0),(97,'bloodbank3@gmail.com',7,3,0,0),(98,'bloodbank3@gmail.com',8,3,0,0);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_email` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_contact` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('akhileshbhogale@gmail.com','Akhilesh','123456789'),('tanjulr@gmail.com','tanu','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertypes`
--

DROP TABLE IF EXISTS `usertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertypes` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertypes`
--

LOCK TABLES `usertypes` WRITE;
/*!40000 ALTER TABLE `usertypes` DISABLE KEYS */;
INSERT INTO `usertypes` VALUES (1,'User'),(2,'Hospital'),(3,'Blood Bank'),(4,'System Administrator');
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blood_bank'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddLoginDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLoginDetails`(IN u_typeid INT,IN u_email varchar(50),IN u_password varchar(50))
BEGIN
INSERT INTO logindetails(login_email,login_password,user_type_id)
VALUES(u_email,u_password,u_typeid);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddAddress`(IN typeid INT,IN u_email varchar(50),IN u_address varchar(50),IN u_city varchar(50))
BEGIN
INSERT INTO addresses(email,address,city,type_id)
VALUES(u_email,u_address,u_city,typeid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddOrders`(IN orderid INT,IN email varchar(50),IN stockid INT,IN u_quantity INT,IN u_price INT,IN u_order_type varchar(50),IN addressid INT)
BEGIN
INSERT into orders(order_id,buyer_email,stock_id,quantity,price,order_type,address_id)
VALUES(orderid,email,stockid,u_quantity,u_price,u_order_type,addressid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddUser`(IN typeid INT, IN u_name VARCHAR(50),IN email varchar(50),IN contact varchar(50))
BEGIN
if (typeid=1) then
INSERT into users (user_email,user_name,user_contact)
Values (email,u_name,contact);
elseif(typeid=2)then
INSERT into hospitals (hospital_email,hospital_name,hospital_contact)
VALUES(email,u_name,contact);
ELSE 
INSERT into bloodbanks(bb_email,bb_name,bb_contact)
VALUES(email,u_name,contact);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ChangePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ChangePassword`(IN pwd varchar(50),IN mail varchar(50))
BEGIN
update logindetails 
SET login_password=pwd where login_email=mail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CheckEmailExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CheckEmailExists`(IN mail varchar(50),OUT res boolean)
BEGIN
DECLARE
var1 int;
SET var1:=(select  count(login_email) from logindetails
	where login_email=mail);
    if (var1=0)
    then
    SET res:=false;
    else 
    SET res:=true;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CheckUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CheckUserDetails`(IN u_email varchar(50),IN u_password varchar(50),INOUT typeid int)
BEGIN

SET typeid:=(select distinct user_type_id from logindetails 
where login_email=u_email and login_password = u_password);

if(typeid IS NULL)
then SET typeid:=-1;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteAdmin`(IN mail varchar(50))
BEGIN
Delete from logindetails where login_email=mail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteHospital` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteHospital`(IN mail varchar(50))
BEGIN


delete from logindetails where login_email=mail;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchBloodBagTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchBloodBagTypes`()
BEGIN
Select * from bloodbagtypes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchBloodBankOrderHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchBloodBankOrderHistory`(IN mail varchar(50))
BEGIN
select bb.bb_name,bg.blood_group,bt.blood_bag_type,o.quantity,o.price,o.order_date
from orders o
join stocks s
on o.stock_id=s.stock_id
join logindetails ld
on  s.owner_email=ld.login_email
join bloodbanks bb
on bb.bb_email=ld.login_email
join bloodgroups bg
on bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id

where mail=o.buyer_email;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchBloodBankStocks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchBloodBankStocks`(IN u_city varchar(50),IN bloodgroupid INT,IN bloodbagid INT)
BEGIN
Select s.stock_id,bb.bb_name,bg.blood_group,bt.blood_bag_type,s.quantity,s.price 
FROM stocks s
join bloodbanks bb
ON s.owner_email=bb.bb_email
join bloodgroups bg
ON bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id
where s.blood_group_id=bloodgroupid AND s.blood_bag_type_id=bloodbagid AND  bb.bb_email = ANY (select email from addresses
where city=u_city and type_id='3');



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchBloodGroupTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchBloodGroupTypes`()
BEGIN
Select * from bloodgroups;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchCities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchCities`()
BEGIN
Select distinct city from addresses 
where type_id='2' OR '3';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchDonationHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchDonationHistory`(IN mail varchar(50))
BEGIN
select dc.camp_venue,dc.camp_date,dc.camp_timing
from donationcamps dc
join campregistrations cr
on dc.camp_id=cr.camp_id
where cr.user_email=mail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchHospitalOrderHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchHospitalOrderHistory`(IN mail varchar(50))
BEGIN
select h.hospital_name,bg.blood_group,bt.blood_bag_type,o.quantity,o.price,o.order_date
from orders o
join stocks s
on o.stock_id=s.stock_id
join logindetails ld
on  s.owner_email=ld.login_email
join hospitals h
on h.hospital_email=ld.login_email
join bloodgroups bg
on bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id
where mail=o.buyer_email;
select bb.bb_name,bg.blood_group,bt.blood_bag_type,o.quantity,o.price,order_date,order_type,a.address
from orders o
join stocks s
on o.stock_id=s.stock_id
join logindetails ld
on  s.owner_email=ld.login_email
join bloodbanks bb
on bb.bb_email=ld.login_email
join bloodgroups bg
on bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id
join adresses a
on a.email=o.buyer_email
where mail=o.buyer_email;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchHospitalStocks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchHospitalStocks`(IN u_city varchar(50),IN bloodgroupid INT,IN bloodbagid INT)
BEGIN
Select s.stock_id,h.hospital_name,blood_group,blood_bag_type,s.quantity,s.price 
FROM stocks s
join hospitals h
ON s.owner_email=h.hospital_email
join bloodgroups bg
ON bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id
where s.blood_group_id=bloodgroupid AND s.blood_bag_type_id=bloodbagid AND  h.hospital_email = ANY (select email from addresses
where city=u_city and type_id='2');



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchProfileDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchProfileDetails`(IN typeid INT,in mail varchar(50))
BEGIN
if(typeid='1') then 
select * from users where user_email=mail;
elseif(typeid='2')
then
select *from hospitals where hospital_email=mail;
elseif(typeid='3') then 
select * from bloodbanks where bb_email=mail;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchUpcomingCamps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchUpcomingCamps`()
BEGIN
Select camp_venue,camp_timing,camp_date
from donationcamps
where camp_date > curdate();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAddresses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAddresses`(IN mail varchar(50))
BEGIN
Select address_id,address from addresses
where email=mail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_OrganizeCamp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_OrganizeCamp`(IN email varchar(50),IN venue varchar(50),IN u_date varchar(50),IN u_time varchar(50))
BEGIN
INSERT INTO donationcamps(organizer_email,camp_venue,camp_date,camp_timing)
VALUES (email,venue,str_to_date(u_date,"%d-%m-%Y"),u_time);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterForCamp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegisterForCamp`(IN campid INT,IN email varchar(50))
BEGIN
INSERT into campregistrations(camp_id,user_email)
VALUES(campid,email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateProfile`(IN typeid INT,IN mail varchar(50),IN u_name varchar(50),IN u_contact varchar(50))
BEGIN
if (typeid='1') then 
update users 
SET user_name=u_name,
user_contact=u_contact
where user_email=mail;
elseif(typeid='2')
then 
update hospitals
SET hospital_name=u_name,
hospital_contact=u_contact
where hospital_email=mail;
elseif(typeid='3')
then
update bloodbanks
SET bb_name=u_name,
bb_contact=u_contact
where bb_email=mail;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateStocks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateStocks`(IN stockid INT,IN u_quantity INT,IN u_price INT)
BEGIN
update stocks
SET quantity=u_quantity,
price=u_price
where stock_id=stockid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-27  9:53:13
