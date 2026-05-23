-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: final_project_2
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e48d758a-f1ab-11f0-a2a3-c4c6e6a11280:1-253';

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` int NOT NULL,
  `vendorID` int DEFAULT NULL,
  `discountID` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `vendorID` (`vendorID`),
  KEY `discountID` (`discountID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`vendorID`) REFERENCES `vendors` (`vendorID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`discountID`) REFERENCES `discount` (`discountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,2,999.99,'Samsung 65 QLED TV'),(2,2,1,249.99,'Sony WH-1000XM5 Headphones'),(3,4,2,1099.99,'Apple MacBook Air M2'),(4,1,1,599.99,'Samsung Galaxy Tab S9'),(5,2,NULL,399.99,'Sony PlayStation 5'),(6,4,NULL,999.99,'Apple iPhone 15'),(7,1,3,299.99,'Samsung 27in Monitor'),(8,2,NULL,149.99,'Sony Soundbar'),(9,3,4,1299.99,'LG French Door Refrigerator'),(10,3,2,799.99,'LG Washer and Dryer Set'),(11,5,1,499.99,'Dyson V15 Vacuum'),(12,3,NULL,349.99,'LG Dishwasher'),(13,6,NULL,49.99,'LEGO Star Wars Millennium Falcon'),(14,6,3,29.99,'Barbie Dreamhouse'),(15,6,NULL,19.99,'Hot Wheels 20 Car Pack'),(16,6,5,59.99,'LEGO Technic Ferrari'),(17,7,3,799.99,'Herman Miller Aeron Chair'),(18,7,NULL,299.99,'IKEA Standing Desk'),(19,7,2,199.99,'IKEA 3 Shelf Bookcase'),(20,7,NULL,499.99,'IKEA Sectional Sofa');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05 22:05:12
