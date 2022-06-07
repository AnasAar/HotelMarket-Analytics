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
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `awards` int DEFAULT NULL,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (331,'Riad Dar Najat',10,5),(332,'Zamzam Riad',7,5),(333,'Riad Tzarra',5,5),(334,'Villa des Orangers',11,5),(335,'Palais Khum',7,5),(336,'Club Med Marrakech le Riad',10,4.5),(337,'Riad Miski',10,5),(338,'Villa Makassar',10,5),(339,'Ksar Char-Bagh Small Luxury hotel',7,5),(340,'Riad La Terrasse des Oliviers',8,5),(341,'Riad 58 Blu',11,5),(342,'Riad Bab Tilila',5,5),(343,'Art Place Hotel & Ryad',6,4.5),(344,'Riad Charlott\'',3,5),(345,'Riad les Orangers d\'Alilia Marrakech',11,5),(346,'Le Farnatchi',10,5),(347,'Lodge K Hotel & Spa',7,5),(348,'RIad Al Loune',7,5),(349,'Riad Akka',9,5),(350,'Dar Charkia',8,5),(351,'MonRiad',9,4.5),(352,'Riad Dar Karma',8,5),(353,'Riad Alma',8,5),(354,'Riad Adore',10,5),(355,'Riad Haraka',5,5),(356,'Riad Chafia',8,5),(357,'Riad Tizwa',8,5),(358,'AnaYela',6,5),(359,'Riad Maison Belbaraka',6,5),(360,'Selman Marrakech',7,5),(361,'Dar Ilham',1,5),(362,'Riad Adika',2,5),(363,'Riad Palais Blanc',2,5),(364,'Sirayane Boutique Hotel & Spa',10,5),(365,'Riad Karmela',11,4.5),(366,'Riad Bindoo & SPA',6,5),(367,'Riad de la Belle Epoque',8,5),(368,'Riyad Al Moussika',4,5),(369,'Riad Malika',10,5),(370,'Riad Tamarrakecht',9,5),(371,'Riad & Spa Al Jazira',10,4.5),(372,'Riad Elizabeth',6,5),(373,'Riad Ilayka',8,5),(374,'Riad Tahili & Spa',6,5),(375,'Riad Djemanna',6,4.5),(376,'Hivernage Secret Suites & Garden',3,5),(377,'Riad Dar Zaya',5,5),(378,'Riad Marhbabikoum',7,5),(379,'Le Rihani',9,5),(380,'Riyad El Cadi',9,5),(381,'Barometre Marrakech',4,5),(382,'Dameh',1,5),(383,'Gm Cafe Gourmet',0,5),(384,'L\'O A LA BOUCHE - Marrakech',1,5),(385,'Taj Moroccan Food',0,5),(386,'Pointbar',6,4.5),(387,'Patisserie Gato',5,5),(388,'Casa Lalla Restaurant',3,5),(389,'Bazaar Cafe',4,4.5),(390,'Corner Cafe',3,4.5),(391,'Gastro MK at Maison MK',8,4.5),(392,'Kafe Merstan',4,4.5),(393,'Le Petit Cornichon',3,4.5),(394,'Limoni Cafe and Restaurant',7,4.5),(395,'Kech Burger',5,4.5),(396,'Fine Mama?',1,4.5),(397,'Dar Chef',2,4.5),(398,'Le Tire Bouchon Marrakech',1,5),(399,'Restaurant Le LOFT',7,4.5),(400,'Ma Maison',1,5),(401,'Cuisine De Terroir',2,4.5),(402,'Restaurant Angsana Si Said',2,5),(403,'Azar',11,4.5),(404,'Manzil la Tortue',6,5),(405,'La Table Du Riad at 72 Riad Living',6,4.5),(406,'La Palette Restaurant Marrakech',2,5),(407,'Votre Table',0,5),(408,'Patisserie Amandine Marrakech',8,4.5),(409,'L\'Mida Marrakech',1,4.5),(410,'Chez Brahim',8,4.5),(411,'Riad Kniza Restaurant',10,4.5),(412,'Kui-Zin Medina',4,4.5),(413,'La Cuisine de Mona',9,4.5),(414,'Ksar Es Saoussan',9,4.5),(415,'A.Montana',4,5),(416,'Zeitoun Gueliz',1,4.5),(417,'La Villa Des Orangers - Restaurant',7,4.5),(418,'So Lounge Marrakech',2,4.5),(419,'Cafe Chez ZaZa',5,4.5),(420,'Mazel مزال Cafe',0,5),(421,'Zeitoun Cafe Jemaa El Fnaa',3,4.5),(422,'L\'Auberge Espagnole',5,4.5),(423,'Le Tanjia',2,4.5),(424,'Snack Grand Atlas',4,4.5),(425,'Katsura',9,4.5),(426,'Fox Art Food',3,4.5),(427,'Terrasse de la fontaine',0,4.5),(428,'Le 6',6,4.5),(429,'Beats Burger',4,4.5),(430,'Bagatelle',9,4.5),(431,'Chez Mado',0,4.5),(432,'La Cantine Des Gazelles',4,4.5),(433,'Cafe Restaurant Dar L\'hssir',1,4.5),(434,'Zeitoun Cafe Kasbah',2,4.5),(435,'Las Terrazas De Andalucia',1,4.5),(436,'Exotic Bali',3,4.5),(437,'Cafe Mama Afrika',7,4.5),(438,'Entrepotes',7,4.5),(439,'Le Trou au Mur',2,4.5),(440,'Jemaa ElFna Restaurant',1,4.5);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
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
