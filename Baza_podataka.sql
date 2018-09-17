/*
SQLyog Community v8.61 
MySQL - 5.5.5-10.1.31-MariaDB : Database - baza_podataka
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`baza_podataka` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `baza_podataka`;

/*Table structure for table `korisnik` */

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `id_korisnik` INT(11) NOT NULL AUTO_INCREMENT ,
  `ime_prezime` VARCHAR(50) DEFAULT NULL,
  `email` CHAR(100) DEFAULT NULL UNIQUE,
  `lozinka` CHAR(10) DEFAULT NULL,
  `licenca_datum_trajanja_pristupa` DATE DEFAULT NULL,
  `vrsta` TINYINT(8) DEFAULT NULL,
  `aktivan` TINYINT(1) DEFAULT NULL,
  `aktiv_link` CHAR(20) DEFAULT NULL,
  `id_poduzece` INT(11) NOT NULL,
  PRIMARY KEY (`id_korisnik`),
  FOREIGN KEY (id_poduzece) REFERENCES poduzece(id_poduzece) ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `korisnik` */

/*Table structure for table `poduzece` */

DROP TABLE IF EXISTS `poduzece`;

CREATE TABLE `poduzece` (
  `id_poduzece` INT(11) NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(50) DEFAULT NULL,
  `adresa` VARCHAR(50) DEFAULT NULL,
  `grad` CHAR(20) DEFAULT NULL,
  `drzava` CHAR(20) DEFAULT NULL,
  `tel` VARCHAR (15) DEFAULT NULL,
  `mob` VARCHAR(15) DEFAULT NULL,
  `email` VARCHAR(100) DEFAULT NULL UNIQUE,
  `OIB` CHAR(11) DEFAULT NULL,
  `odgovorna_osoba` VARCHAR(20) DEFAULT NULL,
  `ziro_racun` VARCHAR(20) DEFAULT NULL,
  `banka` CHAR(30) DEFAULT NULL,
  `pdv` FLOAT DEFAULT NULL,
  `biljeska` TEXT DEFAULT NULL,
  `pecat` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id_poduzece`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `poduzece` */

/*Table structure for table `racun` */

DROP TABLE IF EXISTS `racun`;

CREATE TABLE `racun` (
  `id_racun` INT(11) NOT NULL AUTO_INCREMENT ,
  `datum` DATETIME DEFAULT NULL,
  `id_poduzece` INT(11) DEFAULT NULL,
  `id_korisnik` INT(11) DEFAULT NULL,
  `naslov` VARCHAR(50) DEFAULT NULL,
  `iznos` DECIMAL(10,2) DEFAULT NULL,
  `pdv` FLOAT(10,2) DEFAULT NULL,
  `oznaka` VARCHAR(20) DEFAULT NULL,
  `vrijeme_izdavanja` TIME DEFAULT NULL,
  PRIMARY KEY (`id_racun`),
  KEY `fk_racun_korisnik` (`id_korisnik`),
  KEY `fk_racun` (`id_poduzece`),
  CONSTRAINT `fk_racun` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`),
  CONSTRAINT `fk_racun_korisnik` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`),
  CONSTRAINT `fk_racun_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `racun` */

/*Table structure for table `racun_stavka` */

DROP TABLE IF EXISTS `racun_stavka`;

CREATE TABLE `racun_stavka` (
  `id_racun` INT(11) NOT NULL AUTO_INCREMENT ,
  `id_usluga` INT(11) NOT NULL,
  `kolicina` MEDIUMINT(9) DEFAULT NULL,
  `cijena` FLOAT DEFAULT NULL,
  `rabat` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_racun`,`id_usluga`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `racun_stavka` */

/*Table structure for table `sistem` */

DROP TABLE IF EXISTS `sistem`;

CREATE TABLE `sistem` (
  `id_poduzece` INT(11) DEFAULT NULL,
  `id_zaglavlje` INT(11) NOT NULL,
  `id_podnozje` INT(11) NOT NULL,
  `id_predlorak_rac` INT(11) NOT NULL,
  `id_model_broja` INT(11) NOT NULL,
  `br_zadnjeg_racuna` INT(11) DEFAULT NULL,
  `godina` YEAR(4) DEFAULT NULL,
  PRIMARY KEY (`id_zaglavlje`,`id_podnozje`,`id_predlorak_rac`,`id_model_broja`),
  KEY `fk_sistem` (`id_poduzece`),
  CONSTRAINT `fk_sistem` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`),
  CONSTRAINT `fk_sistem_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `sistem` */

/*Table structure for table `usluge` */

DROP TABLE IF EXISTS `usluge`;

CREATE TABLE `usluge` (
  `id_usluga` INT(11) NOT NULL AUTO_INCREMENT,
   `id_poduzece`INT (11) NOT NULL,
  `naziv` VARCHAR(50) DEFAULT NULL,
  `cijena` FLOAT DEFAULT NULL,
  `mjerna_jedinica` CHAR(10) DEFAULT NULL,
  PRIMARY KEY (`id_usluga`),
  CONSTRAINT `fk_usluga_poduzece` FOREIGN KEY (`id_poduzece`) REFERENCES `poduzece` (`id_poduzece`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `usluge` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
