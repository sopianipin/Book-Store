/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.6.16 : Database - book_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`book_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `book_db`;

/*Table structure for table `book_tbl` */

DROP TABLE IF EXISTS `book_tbl`;

CREATE TABLE `book_tbl` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `book_tbl` */

insert  into `book_tbl`(`id`,`title`,`price`,`status`) values (1,'Data dan Fakta',10000,'aktif'),(2,'Data Inventaris',20000,'aktif'),(3,'Data Manifestasi',3400,'aktif'),(4,'Data Kualitatif',34000,'aktif'),(5,'Data Kuantitatif',2000,'aktif');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
