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
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`orderID`,`productID`),
  KEY `productID` (`productID`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,89),(1,2,120),(2,3,195),(2,6,822),(3,5,84),(3,8,43),(4,9,25),(5,10,29),(5,11,37),(6,3,769),(6,6,1054),(7,5,34),(7,13,58),(8,1,32),(8,7,44),(9,4,68),(9,16,27),(10,6,678),(10,15,49),(11,3,400),(11,17,147),(12,1,512),(12,18,88),(13,6,730),(13,14,95),(14,5,210),(14,13,143),(15,4,175),(15,19,62),(16,9,18),(16,12,22),(17,11,91),(17,18,74),(18,6,889),(18,15,317),(18,16,204),(19,1,67),(19,20,11),(20,2,278),(20,3,340),(21,5,156),(21,15,88),(22,6,543),(22,11,64),(23,17,39),(23,18,55),(24,1,423),(24,2,391),(24,13,267),(25,5,98),(25,14,134),(26,6,612),(26,7,83),(27,13,189),(27,16,112),(28,9,31),(28,20,8),(29,3,287),(29,11,76),(30,4,388),(30,6,947),(30,19,145),(31,6,1),(32,9,1),(33,1,2),(33,10,1),(34,4,1),(35,11,3),(36,6,11),(37,2,1),(38,5,13),(39,8,1),(39,14,1),(40,8,1),(41,1,20),(42,1,52),(43,3,2),(43,11,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
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
