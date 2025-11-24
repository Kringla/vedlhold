/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `bygg` (
  `ByggID` int(11) NOT NULL AUTO_INCREMENT,
  `EiendomID` int(11) NOT NULL,
  `Navn` varchar(200) NOT NULL,
  `ByggTypeID` int(11) DEFAULT NULL,
  `Beskrivelse` text DEFAULT NULL,
  PRIMARY KEY (`ByggID`),
  KEY `EiendomID` (`EiendomID`),
  KEY `ByggTypeID` (`ByggTypeID`),
  CONSTRAINT `bygg_ibfk_1` FOREIGN KEY (`EiendomID`) REFERENCES `eiendom` (`EiendomID`),
  CONSTRAINT `bygg_ibfk_2` FOREIGN KEY (`ByggTypeID`) REFERENCES `zbyggtype` (`ByggTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `eiendom` (
  `EiendomID` int(11) NOT NULL AUTO_INCREMENT,
  `Navn` varchar(200) NOT NULL,
  `Adresse` varchar(200) DEFAULT NULL,
  `Beskrivelse` text DEFAULT NULL,
  PRIMARY KEY (`EiendomID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `jobbprodukt` (
  `JobbProduktID` int(11) NOT NULL AUTO_INCREMENT,
  `JobbID` int(11) NOT NULL,
  `ProduktID` int(11) NOT NULL,
  `MengdeBrukt` decimal(10,2) DEFAULT NULL,
  `Kommentar` text DEFAULT NULL,
  PRIMARY KEY (`JobbProduktID`),
  KEY `ProduktID` (`ProduktID`),
  KEY `JobbID` (`JobbID`) USING BTREE,
  CONSTRAINT `jobbprodukt_ibfk_1` FOREIGN KEY (`JobbID`) REFERENCES `vedlikeholdjobb` (`JobbID`),
  CONSTRAINT `jobbprodukt_ibfk_2` FOREIGN KEY (`ProduktID`) REFERENCES `produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `jobbressurs` (
  `RessursID` int(11) NOT NULL AUTO_INCREMENT,
  `JobbID` int(11) NOT NULL,
  `Navn` varchar(200) DEFAULT NULL,
  `Mengde` decimal(10,2) DEFAULT NULL,
  `EnhetID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RessursID`),
  KEY `JobbID` (`JobbID`),
  KEY `EnhetID` (`EnhetID`),
  CONSTRAINT `jobbressurs_ibfk_1` FOREIGN KEY (`JobbID`) REFERENCES `vedlikeholdjobb` (`JobbID`),
  CONSTRAINT `jobbressurs_ibfk_2` FOREIGN KEY (`EnhetID`) REFERENCES `zenhet` (`EnhetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `lager` (
  `LagerID` int(11) NOT NULL AUTO_INCREMENT,
  `LagerNavn` varchar(50) NOT NULL,
  `Sted` varchar(50) NOT NULL,
  `Beskrivelse` varchar(255) NOT NULL,
  PRIMARY KEY (`LagerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `objekt` (
  `ObjektID` int(11) NOT NULL AUTO_INCREMENT,
  `ByggID` int(11) NOT NULL,
  `ObjektTypeID` int(11) NOT NULL,
  `ObjektKategoriID` int(11) NOT NULL,
  `Innvendig` tinyint(2) DEFAULT 0,
  `ArealM2` decimal(10,2) DEFAULT NULL,
  `Beskrivelse` text DEFAULT NULL,
  PRIMARY KEY (`ObjektID`),
  KEY `ByggID` (`ByggID`),
  KEY `FlateKategoriID` (`ObjektKategoriID`),
  KEY `FlateTypeID` (`ObjektTypeID`),
  CONSTRAINT `objekt_ibfk_1` FOREIGN KEY (`ByggID`) REFERENCES `bygg` (`ByggID`),
  CONSTRAINT `objekt_ibfk_2` FOREIGN KEY (`ObjektKategoriID`) REFERENCES `zobjektkategori` (`ObjektKategoriID`),
  CONSTRAINT `objekt_ibfk_3` FOREIGN KEY (`ObjektTypeID`) REFERENCES `zobjekttype` (`ObjektTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `produkt` (
  `ProduktID` int(11) NOT NULL AUTO_INCREMENT,
  `Navn` varchar(200) NOT NULL,
  `Produsent` varchar(200) DEFAULT NULL,
  `ProduktTypeID` int(11) DEFAULT NULL,
  `EnhetID` int(11) DEFAULT NULL,
  `Fargekode` varchar(100) DEFAULT NULL,
  `Beskrivelse` text DEFAULT NULL,
  PRIMARY KEY (`ProduktID`),
  KEY `idx_Produkt_ProduktTypeID` (`ProduktTypeID`),
  KEY `idx_Produkt_EnhetID` (`EnhetID`),
  CONSTRAINT `fk_Produkt_Enhet` FOREIGN KEY (`EnhetID`) REFERENCES `zenhet` (`EnhetID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Produkt_ProduktType` FOREIGN KEY (`ProduktTypeID`) REFERENCES `zprodukttype` (`ProduktTypeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `produktkjop` (
  `KjopID` int(11) NOT NULL,
  `ProduktID` int(11) DEFAULT NULL,
  `LagerID` int(11) NOT NULL,
  `Datokjopt` datetime DEFAULT NULL,
  `Antall` decimal(10,2) DEFAULT NULL,
  `EnhetID` int(11) DEFAULT NULL,
  `PrisTotal` varchar(255) DEFAULT NULL,
  `Leverandor` varchar(255) DEFAULT NULL,
  `FakturaNr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KjopID`),
  KEY `LagerID` (`LagerID`),
  KEY `ProduktID` (`ProduktID`),
  KEY `EnhetID` (`EnhetID`),
  CONSTRAINT `produktkjop_ibfk_1` FOREIGN KEY (`LagerID`) REFERENCES `lager` (`LagerID`),
  CONSTRAINT `produktkjop_ibfk_2` FOREIGN KEY (`ProduktID`) REFERENCES `produkt` (`ProduktID`),
  CONSTRAINT `produktkjop_ibfk_3` FOREIGN KEY (`EnhetID`) REFERENCES `zenhet` (`EnhetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `produktlager` (
  `ProduktLagerID` int(11) NOT NULL AUTO_INCREMENT,
  `ProduktID` int(11) DEFAULT NULL,
  `LagerID` int(11) NOT NULL,
  `Navn` varchar(200) NOT NULL,
  `Mengde` decimal(10,2) DEFAULT NULL,
  `SistOppdatert` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ProduktLagerID`),
  KEY `ProduktID` (`ProduktID`),
  KEY `LagerID` (`LagerID`),
  CONSTRAINT `produktlager_ibfk_1` FOREIGN KEY (`LagerID`) REFERENCES `lager` (`LagerID`),
  CONSTRAINT `produktlager_ibfk_2` FOREIGN KEY (`ProduktID`) REFERENCES `produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vedlikeholdjobb` (
  `JobbID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjektID` int(11) NOT NULL,
  `DatoStart` date DEFAULT NULL,
  `DatoFerdig` date DEFAULT NULL,
  `JobbTypeID` int(11) DEFAULT NULL,
  `Status` enum('Planlagt','Pågår','Fullført') NOT NULL,
  `Beskrivelse` text DEFAULT NULL,
  PRIMARY KEY (`JobbID`),
  KEY `FlateID` (`ObjektID`),
  KEY `JobbTypeID` (`JobbTypeID`),
  CONSTRAINT `vedlikeholdjobb_ibfk_1` FOREIGN KEY (`ObjektID`) REFERENCES `objekt` (`ObjektID`),
  CONSTRAINT `vedlikeholdjobb_ibfk_2` FOREIGN KEY (`JobbTypeID`) REFERENCES `zjobbtype` (`JobbTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vedlikeholdplan` (
  `PlanID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjektID` int(11) NOT NULL,
  `IntervallAar` int(11) DEFAULT NULL,
  `SistUtført` date DEFAULT NULL,
  `NesteForfall` date DEFAULT NULL,
  `Beskrivelse` text DEFAULT NULL,
  PRIMARY KEY (`PlanID`),
  KEY `FlateID` (`ObjektID`),
  CONSTRAINT `vedlikeholdplan_ibfk_1` FOREIGN KEY (`ObjektID`) REFERENCES `objekt` (`ObjektID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `zbyggtype` (
  `ByggTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ByggTypeNavn` varchar(50) NOT NULL,
  PRIMARY KEY (`ByggTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `zenhet` (
  `EnhetID` int(11) NOT NULL AUTO_INCREMENT,
  `EnhetNavn` varchar(15) NOT NULL,
  PRIMARY KEY (`EnhetID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `zjobbtype` (
  `JobbTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `JobbType` varchar(50) NOT NULL,
  PRIMARY KEY (`JobbTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `zobjektkategori` (
  `ObjektKategoriID` int(11) NOT NULL AUTO_INCREMENT,
  `KategoriNavn` varchar(50) NOT NULL,
  PRIMARY KEY (`ObjektKategoriID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `zobjekttype` (
  `ObjektTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjektNavn` varchar(50) NOT NULL,
  PRIMARY KEY (`ObjektTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `zprodukttype` (
  `ProduktTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ProduktTypeNavn` varchar(50) NOT NULL,
  PRIMARY KEY (`ProduktTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
