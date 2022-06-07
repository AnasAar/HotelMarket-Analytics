-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tp2_mysql
-- ------------------------------------------------------
-- Server version	8.0.28

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

--
-- Table structure for table `fact_offers`
--

DROP TABLE IF EXISTS `fact_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_offers` (
  `pricesrange_id` int DEFAULT NULL,
  `hotels_id` int DEFAULT NULL,
  `reviews_id` int DEFAULT NULL,
  `number_of_hotels` int DEFAULT NULL,
  `number_ofrange_prices` varchar(30) DEFAULT NULL,
  `max_hotelclass` int DEFAULT NULL,
  `min_hotelclass` int DEFAULT NULL,
  `max_ofreviews` int DEFAULT NULL,
  `min_ofreviews` int DEFAULT NULL,
  KEY `pricesrange_id` (`pricesrange_id`),
  KEY `hotels_id` (`hotels_id`),
  KEY `reviews_id` (`reviews_id`),
  CONSTRAINT `fact_offers_ibfk_1` FOREIGN KEY (`pricesrange_id`) REFERENCES `prices_rang` (`id`),
  CONSTRAINT `fact_offers_ibfk_2` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `fact_offers_ibfk_3` FOREIGN KEY (`reviews_id`) REFERENCES `hotel_reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_offers`
--

LOCK TABLES `fact_offers` WRITE;
/*!40000 ALTER TABLE `fact_offers` DISABLE KEYS */;
INSERT INTO `fact_offers` VALUES (NULL,NULL,NULL,27500,'27500',5,0,2117,141);
/*!40000 ALTER TABLE `fact_offers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07  4:57:05
