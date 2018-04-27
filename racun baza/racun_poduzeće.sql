CREATE DATABASE  IF NOT EXISTS `racun` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `racun`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: racun
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `poduzeće`
--

DROP TABLE IF EXISTS `poduzeće`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poduzeće` (
  `id_poduzeće` int(11) NOT NULL,
  `naziv` varchar(30) NOT NULL,
  `adresa` tinytext NOT NULL,
  `grad` varchar(20) DEFAULT NULL,
  `drzava` varchar(45) NOT NULL,
  `tel` int(10) NOT NULL,
  `mob` int(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `OIB` int(11) NOT NULL,
  `odgovorna_osoba` varchar(30) DEFAULT NULL,
  `ziro_racun` int(20) NOT NULL,
  `banka` varchar(25) DEFAULT NULL,
  `pdv` binary(2) NOT NULL,
  `biljeska` varchar(50) DEFAULT NULL,
  `pecat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_poduzeće`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poduzeće`
--

LOCK TABLES `poduzeće` WRITE;
/*!40000 ALTER TABLE `poduzeće` DISABLE KEYS */;
/*!40000 ALTER TABLE `poduzeće` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-27 17:43:27
