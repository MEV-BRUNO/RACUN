/*
SQLyog Community v8.61 
MySQL - 5.5.5-10.1.31-MariaDB : Database - baza podataka
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`baza podataka` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_mysql561_ci */;

USE `baza podataka`;

/*Table structure for table `korisnik` */

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `id_korisnik` int(11) NOT NULL AUTO_INCREMENT ,
  `ime+prezime` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `email` char(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `lozinka` char(10) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `licenca_datum_trajanja_pristupa` date DEFAULT NULL,
  `vrsta` tinyint(8) DEFAULT NULL,
  `id_poduzece` int(20) DEFAULT NULL,
  `aktivan(DA/NE)` char(5) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `aktiv_link` char(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  PRIMARY KEY (`id_korisnik`),
  KEY `fk_korisnik` (`id_poduzece`),
  CONSTRAINT `fk_korisnik` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`),
  CONSTRAINT `fk_korisnik_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `korisnik` */

/*Table structure for table `kupac` */

DROP TABLE IF EXISTS `kupac`;

CREATE TABLE `kupac` (
  `id_kupac` int(11) NOT NULL AUTO_INCREMENT ,
  `naziv` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `adresa` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `grad` varchar(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `drzava` varchar(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `OIB` char(11) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  PRIMARY KEY (`id_kupac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `kupac` */

/*Table structure for table `poduzece` */

DROP TABLE IF EXISTS `poduzece`;

CREATE TABLE `poduzece` (
  `id_poduzece` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `adresa` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `grad` char(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `drzava` char(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `tel` varchar (15) DEFAULT NULL,
  `mob` varchar(15) DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `OIB` char(11) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `odgovorna_osoba` varchar(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `ziro_racun` varchar(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `banka` char(30) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `pdv` float DEFAULT NULL,
  `biljeska` text COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `pecat` link,
  PRIMARY KEY (`id_poduzece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `poduzece` */

/*Table structure for table `racun` */

DROP TABLE IF EXISTS `racun`;

CREATE TABLE `racun` (
  `id_racun` int(11) NOT NULL AUTO_INCREMENT ,
  `datum` datetime DEFAULT NULL,
  `id_poduzece` int(11) DEFAULT NULL,
  `id_korisnik` int(11) DEFAULT NULL,
  `naslov` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `iznos` decimal(10,2) DEFAULT NULL,
  `pdv` float(10,2) DEFAULT NULL,
  `oznaka` varchar(20) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `vrijeme_izdavanja` time DEFAULT NULL,
  PRIMARY KEY (`id_racun`),
  KEY `fk_racun_korisnik` (`id_korisnik`),
  KEY `fk_racun` (`id_poduzece`),
  CONSTRAINT `fk_racun` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`),
  CONSTRAINT `fk_racun_korisnik` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`),
  CONSTRAINT `fk_racun_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `racun` */

/*Table structure for table `racun_stavka` */

DROP TABLE IF EXISTS `racun_stavka`;

CREATE TABLE `racun_stavka` (
  `id_racun` int(11) NOT NULL AUTO_INCREMENT ,
  `id_usluga` int(11) NOT NULL,
  `kolicina` mediumint(9) DEFAULT NULL,
  `cijena` float DEFAULT NULL,
  `rabat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_racun`,`id_usluga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `racun_stavka` */

/*Table structure for table `sistem` */

DROP TABLE IF EXISTS `sistem`;

CREATE TABLE `sistem` (
  `id_poduzece` int(11) DEFAULT NULL,
  `id_zaglavlje` int(11) NOT NULL,
  `id_podnozje` int(11) NOT NULL,
  `id_predlorak_rac` int(11) NOT NULL,
  `id_model_broja` int(11) NOT NULL,
  `br_zadnjeg_racuna` int(11) DEFAULT NULL,
  `godina` year(4) DEFAULT NULL,
  PRIMARY KEY (`id_zaglavlje`,`id_podnozje`,`id_predlorak_rac`,`id_model_broja`),
  KEY `fk_sistem` (`id_poduzece`),
  CONSTRAINT `fk_sistem` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`),
  CONSTRAINT `fk_sistem_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `sistem` */

/*Table structure for table `usluge` */

DROP TABLE IF EXISTS `usluge`;

CREATE TABLE `usluge` (
  `id_usluga` int(11) NOT NULL AUTO_INCREMENT,
   `id_poduzece`int (11) NOT NULL
  `naziv` varchar(50) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `cijena` float DEFAULT NULL,
  `mj(mjerna jedinica)` char(10) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  PRIMARY KEY (`id_usluga`)
  CONSTRAINT `fk_sistem_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

/*Data for the table `usluge` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
