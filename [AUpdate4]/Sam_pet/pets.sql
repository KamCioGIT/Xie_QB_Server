-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.28-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- tablo yapısı dökülüyor es_extended.frkn_pet
CREATE TABLE IF NOT EXISTS `frkn_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netID` int(11) DEFAULT NULL,
  `petHash` varchar(50) DEFAULT NULL,
  `petTexureID` int(11) DEFAULT NULL,
  `petLeash` varchar(50) DEFAULT NULL,
  `petLeashID` int(11) DEFAULT NULL,
  `frknHat` varchar(50) DEFAULT NULL,
  `frknLeash` varchar(50) DEFAULT NULL,
  `frknGlasses` varchar(50) DEFAULT NULL,
  `petOwner` varchar(50) DEFAULT NULL,
  `petGender` varchar(50) DEFAULT NULL,
  `petName` varchar(50) DEFAULT NULL,
  `petLabel` longtext DEFAULT NULL,
  `hungryDecrase` int(11) DEFAULT NULL,
  `petHungryLevel` int(11) DEFAULT NULL,
  `thirstDecrase` int(11) DEFAULT NULL,
  `isOutSide` tinyint(4) DEFAULT 0,
  `petThirstLevel` int(11) DEFAULT NULL,
  `petEnergyLevel` int(11) DEFAULT NULL,
  `petHealthLevel` int(11) DEFAULT NULL,
  `petXP` int(11) DEFAULT NULL,
  `lastXP` int(11) DEFAULT NULL,
  `petLevel` int(11) DEFAULT NULL,
  `petAge` int(11) DEFAULT NULL,
  `petPosition` text DEFAULT NULL,
  `petIMG` longtext DEFAULT 'https://cdn.discordapp.com/attachments/942150634554163250/1091896194818658304/unkownpet.png',
  `listOf` varchar(50) DEFAULT NULL,
  `isSelling` tinyint(4) DEFAULT 0,
  `petSellingPrice` int(11) DEFAULT NULL,
  `petFace` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `netID` (`netID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

