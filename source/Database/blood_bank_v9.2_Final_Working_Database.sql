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
  KEY `address_email_fk` (`email`),
  CONSTRAINT `address_email_fk` FOREIGN KEY (`email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `address_fk` FOREIGN KEY (`type_id`) REFERENCES `usertypes` (`user_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'tanjulr@gmail.com','Kothrud','Pune',1),(2,'akhileshbhogale@gmail.com','Shaniwarwada','Pune',1),(3,'rishabadvani24@gmail.com','Pimpri','Pune',1),(4,'swatisingh@gmail.com','Chinchwad','Pune',1),(5,'nikita@gmail.com','SB road','Pune',1),(6,'sahyadri@gmail.com','Nall Stop','Pune',2),(7,'sancheti@gmail.com','Akurdi','Pune',2),(8,'sanjeevan@gmail.com','Shivajinagar','Pune',2),(9,'ruby@gmail.com','Vadgaon','Pune',2),(10,'ratna@gmail.com','Katraj','Pune',2),(11,'nobel@gmail.com','Khondwa','Pune',3),(12,'getwell@gmail.com','Warje','Pune',3),(13,'aadhar@gmail.com','Baner','Pune',3),(14,'gholap@gmail.com','Aundh','Pune',3),(15,'janakalyan@gmail.com','Hadapsar','Pune',3),(16,'hospital4@gmail.com','Kranti Chowk','Aurangabad',2);
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
INSERT INTO `bloodbagtypes` VALUES (1,'Single','CPDA-1 anti coagulant solution'),(2,'Double','Separates whole blood into plasma and red blood cells'),(3,'Tripple','Separates whole blood into red blood cells,plasma,buffy');
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
INSERT INTO `bloodbanks` VALUES ('aadhar@gmail.com','Aadhar Blood Bank','9895455632'),('getwell@gmail.com','GetWell BloodBank','9865477123'),('gholap@gmail.com','Gholap BloodBank','98655477123'),('janakalyan@gmail.com','Janakalyan BloodBank','98746562310'),('nobel@gmail.com','Nobel BlooBank','9892155478');
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
  CONSTRAINT `campregistration_campid_fk` FOREIGN KEY (`camp_id`) REFERENCES `donationcamps` (`camp_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `campregistration_email_fk` FOREIGN KEY (`user_email`) REFERENCES `users` (`user_email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campregistrations`
--

LOCK TABLES `campregistrations` WRITE;
/*!40000 ALTER TABLE `campregistrations` DISABLE KEYS */;
INSERT INTO `campregistrations` VALUES (1,'akhileshbhogale@gmail.com'),(1,'tanjulr@gmail.com'),(2,'akhileshbhogale@gmail.com');
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
  `camp_city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`camp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationcamps`
--

LOCK TABLES `donationcamps` WRITE;
/*!40000 ALTER TABLE `donationcamps` DISABLE KEYS */;
INSERT INTO `donationcamps` VALUES (1,'sahyadri@gmail.com','Karve Nagar','2019-02-02','14:00','Pune'),(2,'nobel@gmail.com','Shivajinagar','2019-02-05','10:00','Pune'),(3,'aadhar@gmail.com','Katraj','2019-02-15','14:00','Pune'),(4,'hospital4@gmail.com','Nall Stop','2019-02-16','14:00','Pune'),(5,'hospital4@gmail.com','Nall Stop','2019-02-16','14:00','Pune');
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
INSERT INTO `hospitals` VALUES ('hospital4@gmail.com','Hospital 4','1234567890'),('ratna@gmail.com','Ratna Hospital','9767302548'),('ruby@gmail.com','Ruby Hospital','7895641230'),('sahyadri@gmail.com','Sahyadri Hospital','7382625268'),('sancheti@gmail.com','Sancheti Hospital','7365489854'),('sanjeevan@gmail.com','Sanjeevan Hospital','8754696541');
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
  CONSTRAINT `login_fk` FOREIGN KEY (`user_type_id`) REFERENCES `usertypes` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logindetails`
--

LOCK TABLES `logindetails` WRITE;
/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` VALUES ('aadhar@gmail.com','aadhar@123',3),('admin@gmail.com','admin@123',4),('akhileshbhogale@gmail.com','akhilesh@123',1),('a_admin@gmail.com','a_admin@123',4),('getwell@gmail.com','getwell@123',3),('gholap@gmail.com','gholap@123',3),('hospital4@gmail.com','hospital4@123',2),('janakalyan@gmail.com','janakalyan@123',3),('nikita@gmail.com','nikita@123',1),('nobel@gmail.com','nobel@123',3),('ratna@gmail.com','ratna@123',2),('rishabadvani24@gmail.com','rishab@123',1),('ruby@gmail.com','ruby@123',2),('sahyadri@gmail.com','sahyadri@123',2),('sancheti@gmail.com','sancheti@123',2),('sanjeevan@gmail.com','sanjeevan@123',2),('swatisingh@gmail.com','swati@123',1),('tanjulr@gmail.com','tanjul@123',1),('t_admin@gmail.com','t_admin@123',4);
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderinfo` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_email` varchar(50) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `fk_buyer_email` (`buyer_email`),
  CONSTRAINT `fk_buyer_email` FOREIGN KEY (`buyer_email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfo`
--

LOCK TABLES `orderinfo` WRITE;
/*!40000 ALTER TABLE `orderinfo` DISABLE KEYS */;
INSERT INTO `orderinfo` VALUES (1,'tanjulr@gmail.com','2019-01-31 05:47:10'),(2,'sahyadri@gmail.com','2019-01-31 05:47:38'),(3,'nobel@gmail.com','2019-01-31 05:47:52'),(4,'aadhar@gmail.com','2019-02-01 04:59:51'),(5,'aadhar@gmail.com','2019-02-01 05:03:44'),(6,'akhileshbhogale@gmail.com','2019-02-01 09:53:54');
/*!40000 ALTER TABLE `orderinfo` ENABLE KEYS */;
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
  CONSTRAINT `order_email_fk` FOREIGN KEY (`buyer_email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'tanjulr@gmail.com',3,1,100,'2019-01-31 06:07:33','PICKUP',-1),(2,'sahyadri@gmail.com',41,10,100,'2019-01-31 06:07:33','DELIVERY',6),(3,'nobel@gmail.com',57,2,500,'2019-01-31 06:07:33','PICKUP',-1),(5,'aadhar@gmail.com',125,2,600,'2019-02-01 05:03:44','PICKUP',NULL),(5,'aadhar@gmail.com',197,3,300,'2019-02-01 05:03:44','PICKUP',NULL),(5,'aadhar@gmail.com',222,3,900,'2019-02-01 05:03:44','PICKUP',NULL),(6,'akhileshbhogale@gmail.com',127,1,200,'2019-02-01 09:53:54','PICKUP',NULL),(6,'akhileshbhogale@gmail.com',175,2,600,'2019-02-01 09:53:54','PICKUP',NULL);
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
  CONSTRAINT `stock_bloodbagtype_fk` FOREIGN KEY (`blood_bag_type_id`) REFERENCES `bloodbagtypes` (`blood_bag_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_bloodgroup_fk` FOREIGN KEY (`blood_group_id`) REFERENCES `bloodgroups` (`blood_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_email_fk` FOREIGN KEY (`owner_email`) REFERENCES `logindetails` (`login_email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (3,'sahyadri@gmail.com',1,1,4,100),(4,'sahyadri@gmail.com',2,1,5,150),(5,'sahyadri@gmail.com',3,1,4,450),(6,'sahyadri@gmail.com',4,1,5,200),(7,'sahyadri@gmail.com',5,1,7,300),(8,'sahyadri@gmail.com',6,1,10,145),(9,'sahyadri@gmail.com',7,1,8,102),(10,'sahyadri@gmail.com',8,1,1,200),(11,'sahyadri@gmail.com',1,2,2,400),(12,'sahyadri@gmail.com',2,2,4,300),(13,'sahyadri@gmail.com',3,2,5,200),(14,'sahyadri@gmail.com',4,2,5,100),(15,'sahyadri@gmail.com',5,2,4,400),(16,'sahyadri@gmail.com',6,2,8,500),(17,'sahyadri@gmail.com',7,2,4,300),(18,'sahyadri@gmail.com',8,2,10,200),(19,'sahyadri@gmail.com',1,3,5,250),(20,'sahyadri@gmail.com',2,3,5,145),(21,'sahyadri@gmail.com',3,3,8,240),(22,'sahyadri@gmail.com',4,3,7,250),(23,'sahyadri@gmail.com',5,3,4,100),(24,'sahyadri@gmail.com',6,3,1,100),(25,'sahyadri@gmail.com',7,3,1,200),(26,'sahyadri@gmail.com',8,3,2,300),(27,'ratna@gmail.com',1,1,8,350),(28,'ratna@gmail.com',2,1,6,450),(29,'ratna@gmail.com',3,1,8,420),(30,'ratna@gmail.com',4,1,0,0),(31,'ratna@gmail.com',5,1,2,200),(32,'ratna@gmail.com',6,1,5,200),(33,'ratna@gmail.com',7,1,0,300),(34,'ratna@gmail.com',8,1,4,350),(35,'ratna@gmail.com',1,2,4,250),(36,'ratna@gmail.com',2,2,2,240),(37,'ratna@gmail.com',3,2,5,650),(38,'ratna@gmail.com',4,2,8,600),(39,'ratna@gmail.com',5,2,5,300),(40,'ratna@gmail.com',6,2,10,200),(41,'ratna@gmail.com',7,2,10,100),(42,'ratna@gmail.com',8,2,5,500),(43,'ratna@gmail.com',1,3,6,400),(44,'ratna@gmail.com',2,3,7,100),(45,'ratna@gmail.com',3,3,8,200),(46,'ratna@gmail.com',4,3,7,300),(47,'ratna@gmail.com',5,3,4,400),(48,'ratna@gmail.com',6,3,5,500),(49,'ratna@gmail.com',7,3,4,600),(50,'ratna@gmail.com',8,3,6,410),(51,'sancheti@gmail.com',1,1,7,200),(52,'sancheti@gmail.com',2,1,2,360),(53,'sancheti@gmail.com',3,1,1,100),(54,'sancheti@gmail.com',4,1,4,200),(55,'sancheti@gmail.com',5,1,10,300),(56,'sancheti@gmail.com',6,1,20,400),(57,'sancheti@gmail.com',7,1,2,500),(58,'sancheti@gmail.com',8,1,5,300),(59,'sancheti@gmail.com',1,2,8,20),(60,'sancheti@gmail.com',2,2,40,150),(61,'sancheti@gmail.com',3,2,10,250),(62,'sancheti@gmail.com',4,2,3,350),(63,'sancheti@gmail.com',5,2,5,450),(64,'sancheti@gmail.com',6,2,4,460),(65,'sancheti@gmail.com',7,2,8,100),(66,'sancheti@gmail.com',8,2,7,200),(67,'sancheti@gmail.com',1,3,4,300),(68,'sancheti@gmail.com',2,3,5,400),(69,'sancheti@gmail.com',3,3,7,500),(70,'sancheti@gmail.com',4,3,9,600),(71,'sancheti@gmail.com',5,3,10,700),(72,'sancheti@gmail.com',6,3,7,450),(73,'sancheti@gmail.com',7,3,1,120),(74,'sancheti@gmail.com',8,3,5,350),(75,'ruby@gmail.com',1,1,8,650),(76,'ruby@gmail.com',2,1,5,150),(77,'ruby@gmail.com',3,1,2,360),(78,'ruby@gmail.com',4,1,11,300),(79,'ruby@gmail.com',5,1,14,100),(80,'ruby@gmail.com',6,1,55,400),(81,'ruby@gmail.com',7,1,7,500),(82,'ruby@gmail.com',8,1,9,300),(83,'ruby@gmail.com',1,2,9,200),(84,'ruby@gmail.com',2,2,8,100),(85,'ruby@gmail.com',3,2,8,200),(86,'ruby@gmail.com',4,2,2,300),(87,'ruby@gmail.com',5,2,14,100),(88,'ruby@gmail.com',6,2,2,200),(89,'ruby@gmail.com',7,2,35,300),(90,'ruby@gmail.com',8,2,20,100),(91,'ruby@gmail.com',1,3,4,250),(92,'ruby@gmail.com',2,3,6,200),(93,'ruby@gmail.com',3,3,8,100),(94,'ruby@gmail.com',4,3,5,300),(95,'ruby@gmail.com',5,3,5,100),(96,'ruby@gmail.com',6,3,5,500),(97,'ruby@gmail.com',7,3,5,300),(98,'ruby@gmail.com',8,3,8,200),(99,'sanjeevan@gmail.com',1,1,4,100),(100,'sanjeevan@gmail.com',2,1,8,300),(101,'sanjeevan@gmail.com',3,1,6,100),(102,'sanjeevan@gmail.com',4,1,8,200),(103,'sanjeevan@gmail.com',5,1,4,300),(104,'sanjeevan@gmail.com',6,1,6,210),(105,'sanjeevan@gmail.com',7,1,4,120),(106,'sanjeevan@gmail.com',8,1,4,300),(107,'sanjeevan@gmail.com',1,2,8,100),(108,'sanjeevan@gmail.com',2,2,5,200),(109,'sanjeevan@gmail.com',3,2,4,300),(110,'sanjeevan@gmail.com',4,2,4,100),(111,'sanjeevan@gmail.com',5,2,4,100),(112,'sanjeevan@gmail.com',6,2,5,400),(113,'sanjeevan@gmail.com',7,2,4,500),(114,'sanjeevan@gmail.com',8,2,3,300),(115,'sanjeevan@gmail.com',1,3,1,100),(116,'sanjeevan@gmail.com',2,3,8,200),(117,'sanjeevan@gmail.com',3,3,9,300),(118,'sanjeevan@gmail.com',4,3,5,400),(119,'sanjeevan@gmail.com',5,3,21,500),(120,'sanjeevan@gmail.com',6,3,10,600),(121,'sanjeevan@gmail.com',7,3,8,100),(122,'sanjeevan@gmail.com',8,3,8,200),(125,'nobel@gmail.com',1,1,2,300),(126,'nobel@gmail.com',2,1,5,100),(127,'nobel@gmail.com',3,1,1,200),(128,'nobel@gmail.com',4,1,2,300),(129,'nobel@gmail.com',5,1,8,100),(130,'nobel@gmail.com',6,1,9,200),(131,'nobel@gmail.com',7,1,9,300),(132,'nobel@gmail.com',8,1,7,100),(133,'nobel@gmail.com',1,2,4,250),(134,'nobel@gmail.com',2,2,5,300),(135,'nobel@gmail.com',3,2,6,100),(136,'nobel@gmail.com',4,2,4,200),(137,'nobel@gmail.com',5,2,8,300),(138,'nobel@gmail.com',6,2,8,100),(139,'nobel@gmail.com',7,2,7,200),(140,'nobel@gmail.com',8,2,8,300),(141,'nobel@gmail.com',1,3,10,100),(142,'nobel@gmail.com',2,3,20,200),(143,'nobel@gmail.com',3,3,20,300),(144,'nobel@gmail.com',4,3,5,100),(145,'nobel@gmail.com',5,3,8,200),(146,'nobel@gmail.com',6,3,9,300),(147,'nobel@gmail.com',7,3,7,100),(148,'nobel@gmail.com',8,3,6,200),(149,'aadhar@gmail.com',1,1,5,300),(150,'aadhar@gmail.com',2,1,7,100),(151,'aadhar@gmail.com',3,1,4,250),(152,'aadhar@gmail.com',4,1,4,300),(153,'aadhar@gmail.com',5,1,7,100),(154,'aadhar@gmail.com',6,1,8,150),(155,'aadhar@gmail.com',7,1,9,200),(156,'aadhar@gmail.com',8,1,4,300),(157,'aadhar@gmail.com',1,2,10,200),(158,'aadhar@gmail.com',2,2,5,100),(159,'aadhar@gmail.com',3,2,8,200),(160,'aadhar@gmail.com',4,2,4,300),(161,'aadhar@gmail.com',5,2,6,100),(162,'aadhar@gmail.com',6,2,7,200),(163,'aadhar@gmail.com',7,2,4,300),(164,'aadhar@gmail.com',8,2,3,200),(165,'aadhar@gmail.com',1,3,8,100),(166,'aadhar@gmail.com',2,3,5,300),(167,'aadhar@gmail.com',3,3,4,200),(168,'aadhar@gmail.com',4,3,6,300),(169,'aadhar@gmail.com',5,3,7,200),(170,'aadhar@gmail.com',6,3,5,100),(171,'aadhar@gmail.com',7,3,4,200),(172,'aadhar@gmail.com',8,3,2,300),(173,'getwell@gmail.com',1,1,0,100),(174,'getwell@gmail.com',2,1,8,200),(175,'getwell@gmail.com',3,1,4,300),(176,'getwell@gmail.com',4,1,5,100),(177,'getwell@gmail.com',5,1,0,200),(178,'getwell@gmail.com',6,1,7,300),(179,'getwell@gmail.com',7,1,4,100),(180,'getwell@gmail.com',8,1,0,200),(181,'getwell@gmail.com',1,2,0,300),(182,'getwell@gmail.com',2,2,4,100),(183,'getwell@gmail.com',3,2,8,200),(184,'getwell@gmail.com',4,2,8,300),(185,'getwell@gmail.com',5,2,8,100),(186,'getwell@gmail.com',6,2,5,200),(187,'getwell@gmail.com',7,2,7,300),(188,'getwell@gmail.com',8,2,10,100),(189,'getwell@gmail.com',1,3,5,200),(190,'getwell@gmail.com',2,3,5,300),(191,'getwell@gmail.com',3,3,6,100),(192,'getwell@gmail.com',4,3,6,200),(193,'getwell@gmail.com',5,3,7,300),(194,'getwell@gmail.com',6,3,9,100),(195,'getwell@gmail.com',7,3,6,200),(196,'getwell@gmail.com',8,3,5,300),(197,'gholap@gmail.com',1,1,3,100),(198,'gholap@gmail.com',2,1,7,200),(199,'gholap@gmail.com',3,1,7,300),(200,'gholap@gmail.com',4,1,7,100),(201,'gholap@gmail.com',5,1,4,200),(202,'gholap@gmail.com',6,1,5,300),(203,'gholap@gmail.com',7,1,5,100),(204,'gholap@gmail.com',8,1,7,200),(205,'gholap@gmail.com',1,2,4,300),(206,'gholap@gmail.com',2,2,5,100),(207,'gholap@gmail.com',3,2,9,210),(208,'gholap@gmail.com',4,2,8,300),(209,'gholap@gmail.com',5,2,6,100),(210,'gholap@gmail.com',6,2,7,200),(211,'gholap@gmail.com',7,2,6,300),(212,'gholap@gmail.com',8,2,0,100),(213,'gholap@gmail.com',1,3,5,200),(214,'gholap@gmail.com',2,3,0,300),(215,'gholap@gmail.com',3,3,0,100),(216,'gholap@gmail.com',4,3,5,200),(217,'gholap@gmail.com',5,3,4,300),(218,'gholap@gmail.com',6,3,4,100),(219,'gholap@gmail.com',7,3,4,100),(220,'gholap@gmail.com',8,3,8,200),(222,'janakalyan@gmail.com',1,1,1,300),(223,'janakalyan@gmail.com',2,1,5,100),(224,'janakalyan@gmail.com',3,1,6,200),(225,'janakalyan@gmail.com',4,1,7,220),(226,'janakalyan@gmail.com',5,1,4,100),(227,'janakalyan@gmail.com',6,1,5,200),(228,'janakalyan@gmail.com',7,1,8,300),(229,'janakalyan@gmail.com',8,1,5,100),(230,'janakalyan@gmail.com',1,2,6,200),(231,'janakalyan@gmail.com',2,2,4,300),(232,'janakalyan@gmail.com',3,2,5,100),(233,'janakalyan@gmail.com',4,2,4,200),(234,'janakalyan@gmail.com',5,2,5,300),(235,'janakalyan@gmail.com',6,2,1,100),(236,'janakalyan@gmail.com',7,2,2,100),(237,'janakalyan@gmail.com',8,2,1,200),(238,'janakalyan@gmail.com',1,3,4,300),(239,'janakalyan@gmail.com',2,3,6,100),(240,'janakalyan@gmail.com',3,3,7,200),(241,'janakalyan@gmail.com',4,3,8,300),(242,'janakalyan@gmail.com',5,3,9,100),(243,'janakalyan@gmail.com',6,3,5,200),(244,'janakalyan@gmail.com',7,3,1,300),(245,'janakalyan@gmail.com',8,3,10,100),(246,NULL,NULL,NULL,NULL,0),(247,NULL,NULL,NULL,NULL,0),(248,NULL,NULL,NULL,NULL,0),(249,'hospital4@gmail.com',1,1,10,250),(250,'hospital4@gmail.com',2,1,0,0),(251,'hospital4@gmail.com',3,1,0,0),(252,'hospital4@gmail.com',4,1,0,0),(253,'hospital4@gmail.com',5,1,0,0),(254,'hospital4@gmail.com',6,1,0,0),(255,'hospital4@gmail.com',7,1,0,0),(256,'hospital4@gmail.com',8,1,0,0),(257,'hospital4@gmail.com',1,2,0,0),(258,'hospital4@gmail.com',2,2,0,0),(259,'hospital4@gmail.com',3,2,0,0),(260,'hospital4@gmail.com',4,2,0,0),(261,'hospital4@gmail.com',5,2,0,0),(262,'hospital4@gmail.com',6,2,0,0),(263,'hospital4@gmail.com',7,2,0,0),(264,'hospital4@gmail.com',8,2,0,0),(265,'hospital4@gmail.com',1,3,0,0),(266,'hospital4@gmail.com',2,3,0,0),(267,'hospital4@gmail.com',3,3,0,0),(268,'hospital4@gmail.com',4,3,0,0),(269,'hospital4@gmail.com',5,3,0,0),(270,'hospital4@gmail.com',6,3,0,0),(271,'hospital4@gmail.com',7,3,0,0),(272,'hospital4@gmail.com',8,3,0,0);
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
INSERT INTO `users` VALUES ('akhileshbhogale@gmail.com','Akhilesh Bhogale','7385625260'),('nikita@gmail.com','Nikita','8329286831'),('rishabadvani24@gmail.com','Rishab','9637006081'),('swatisingh@gmail.com','Swati','9637006031'),('tanjulr@gmail.com','Tanjul','8329286821');
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
INSERT INTO `usertypes` VALUES (1,'User'),(2,'Hospital'),(3,'Blood Bank'),(4,'Admin');
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blood_bank'
--
/*!50003 DROP FUNCTION IF EXISTS `f_GetTypeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_GetTypeId`(mail varchar(50)) RETURNS int(11)
BEGIN
declare typeid INT;
set typeid=(select user_type_id from logindetails where login_email=mail);

RETURN typeid;

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
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddLoginDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddLoginDetails`(IN u_typeid INT,IN u_email varchar(50),IN u_password varchar(50))
BEGIN
INSERT INTO logindetails(login_email,login_password,user_type_id)
VALUES(u_email,u_password,u_typeid);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddOrderInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddOrderInfo`(IN mail varchar(50))
BEGIN
INSERT INTO orderinfo(buyer_email)
values(mail);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddOrders`(IN orderid INT,IN email varchar(50),IN stockid INT,IN u_quantity INT,IN order_date timestamp,IN u_price INT,IN u_order_type varchar(50),IN addressid INT)
BEGIN
if addressid>0
then
	INSERT into orders
	VALUES(orderid,email,stockid,u_quantity,u_price,order_date,u_order_type,addressid);
else
	INSERT into orders
	VALUES(orderid,email,stockid,u_quantity,u_price,order_date,u_order_type,null);
end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteBloodBank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteBloodBank`(IN mail varchar(50))
BEGIN


delete from bloodbanks where bb_email=mail;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteFromLoginDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteFromLoginDetails`(IN mail varchar(50))
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


delete from hospitals where hospital_email=mail;
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
where s.blood_group_id=bloodgroupid AND s.quantity>0 AND  s.blood_bag_type_id=bloodbagid AND  bb.bb_email = ANY (select email from addresses
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
Select s.stock_id,h.hospital_name,bg.blood_group,bt.blood_bag_type,s.quantity,s.price 
FROM stocks s
join hospitals h
ON s.owner_email=h.hospital_email
join bloodgroups bg
ON bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id
where s.blood_group_id=bloodgroupid AND s.blood_bag_type_id=bloodbagid AND s.quantity>0 AND   h.hospital_email= ANY (select email from addresses
where city=u_city and type_id='2');



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchOrderHistoryFromBloodBank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchOrderHistoryFromBloodBank`(IN mail varchar(50))
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

where mail=o.buyer_email
order by o.order_date desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchOrderHistoryFromHospital` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchOrderHistoryFromHospital`(IN mail varchar(50))
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
where mail=o.buyer_email
order by o.order_date desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchOrderId`()
BEGIN
select max(order_id),max(order_date)
from orderinfo ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchStockDetailsUsingStockId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchStockDetailsUsingStockId`(IN stockid INT)
BEGIN
DECLARE typeid INT;
DECLARE mail varchar(50);
SET mail=(select owner_email from stocks where stock_id=stockid);
SET typeid=f_GetTypeId(mail);
if(typeid='2') then
select h.hospital_name,bg.blood_group,bt.blood_bag_type,s.quantity,s.price
from hospitals h join
stocks s on s.owner_email=h.hospital_email
join bloodgroups bg on 
bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt on bt.blood_bag_type_id=s.blood_bag_type_id
where s.stock_id=stockid;

elseif(typeid='3') then 
select bb.bb_name,bg.blood_group,bt.blood_bag_type,s.quantity,s.price
from bloodbanks bb join
stocks s on s.owner_email=bb.bb_email
join bloodgroups bg on 
bg.blood_group_id=s.blood_group_id
join bloodbagtypes bt on bt.blood_bag_type_id=s.blood_bag_type_id
where s.stock_id=stockid;
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchStocksUsingEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchStocksUsingEmail`(IN mail varchar(50))
BEGIN
select s.stock_id,bg.blood_group,bt.blood_bag_type,s.quantity,s.price
from stocks s 
join bloodgroups bg
on s.blood_group_id=bg.blood_group_id
join bloodbagtypes bt
on bt.blood_bag_type_id=s.blood_bag_type_id
where s.owner_email=mail;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchUpcomingCamps`(IN mail varchar(50))
BEGIN
Select camp_venue,camp_timing,camp_date,camp_id
from donationcamps
where camp_date > curdate() AND camp_id not in(select distinct camp_id from campregistrations where user_email=mail);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FetchUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FetchUserDetails`(IN mail varchar(50),IN typeid INT)
BEGIN
if(typeid='1') then 
select * from users where user_email=mail;
elseif(typeid='2') then 
select * from hospitals where hospital_email=mail;
elseif(typeid='3') then
select * from bloodbanks where bb_email=mail;
end if;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_OrganizeCamp`(IN email varchar(50),IN venue varchar(50),IN u_date varchar(50),IN u_time varchar(50),IN city varchar(50))
BEGIN
INSERT INTO donationcamps(organizer_email,camp_venue,camp_date,camp_timing,camp_city)
VALUES (email,venue,str_to_date(u_date,"%Y-%m-%d"),u_time,city);
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

-- Dump completed on 2019-02-01 16:50:45
