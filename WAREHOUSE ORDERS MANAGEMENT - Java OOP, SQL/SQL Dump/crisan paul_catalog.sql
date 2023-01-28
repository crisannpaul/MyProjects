-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crisan paul
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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id_f` int NOT NULL,
  `id_p` int NOT NULL,
  `pret` int NOT NULL,
  `moneda` varchar(10) DEFAULT 'RON',
  KEY `id_f` (`id_f`),
  KEY `id_p` (`id_p`),
  CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`id_f`) REFERENCES `furnizori` (`id_f`),
  CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`id_p`) REFERENCES `piese` (`id_p`),
  CONSTRAINT `chk_moneda` CHECK ((`moneda` in (_utf8mb3'RON',_utf8mb3'USD',_utf8mb3'EUR')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,2,1408,'RON'),(1,5,1055,'RON'),(4,1,1500,'RON'),(5,4,2500,'RON'),(3,3,500,'RON'),(2,5,300,'RON'),(2,3,200,'RON'),(4,5,1500,'RON'),(5,2,1200,'RON'),(5,6,1,'RON'),(3,7,15,'RON'),(5,2,1000,'RON'),(1,2,1050,'RON'),(1,5,788,'RON'),(4,1,1500,'RON'),(5,4,2500,'RON'),(3,3,500,'RON'),(2,5,300,'RON'),(2,3,200,'RON'),(4,5,1500,'RON'),(5,2,1200,'RON'),(5,6,1,'RON'),(3,7,15,'RON');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-23 12:19:23
