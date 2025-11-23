-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28. Sep, 2025 11:28 AM
-- Tjener-versjon: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ihlendb`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `abonmedlem`
--

CREATE TABLE `abonmedlem` (
  `AbID` int(11) NOT NULL,
  `AbNavn` varchar(255) DEFAULT NULL,
  `AbFirma` varchar(255) DEFAULT NULL,
  `AbType` varchar(255) DEFAULT NULL,
  `AbTittel` varchar(255) DEFAULT NULL,
  `AbAdresse` varchar(255) DEFAULT NULL,
  `AbTelf` varchar(255) DEFAULT NULL,
  `AbMobil` varchar(255) DEFAULT NULL,
  `AbEpost` varchar(255) DEFAULT NULL,
  `AbWeb` varchar(255) DEFAULT NULL,
  `AbPassord` varchar(255) DEFAULT NULL,
  `AbUser` varchar(255) DEFAULT NULL,
  `AbBelop` float DEFAULT NULL,
  `AbValuta` varchar(255) DEFAULT NULL,
  `AbPeriode` varchar(255) DEFAULT NULL,
  `AbFornyDato` varchar(255) DEFAULT NULL,
  `AbSistBetalt` datetime DEFAULT NULL,
  `AbAuto` bit(1) DEFAULT NULL,
  `AbFastTrekk` bit(1) DEFAULT NULL,
  `AbMerknader` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bokauthor`
--

CREATE TABLE `bokauthor` (
  `AutID` int(11) NOT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `NatID` int(11) DEFAULT NULL,
  `OldNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bokauthorbook`
--

CREATE TABLE `bokauthorbook` (
  `AutBookID` int(11) NOT NULL,
  `BookID` int(11) DEFAULT NULL,
  `AutID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `bokbook`
--

CREATE TABLE `bokbook` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(255) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `Abstract` mediumtext DEFAULT NULL,
  `PubYear` varchar(50) DEFAULT NULL,
  `EditionNo` smallint(6) DEFAULT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `DateRec` varchar(50) DEFAULT NULL,
  `RecFrom` varchar(50) DEFAULT NULL,
  `ReadAnne` varchar(255) DEFAULT NULL,
  `ReadGerhard` varchar(255) DEFAULT NULL,
  `DateLoan` varchar(50) DEFAULT NULL,
  `LoanTo` varchar(50) DEFAULT NULL,
  `NatID` int(11) DEFAULT NULL,
  `PubID` int(11) DEFAULT NULL,
  `CatID` int(11) DEFAULT NULL,
  `RackID` int(11) DEFAULT NULL,
  `ShelfNo` varchar(5) DEFAULT NULL,
  `PaperBack` bit(1) DEFAULT NULL,
  `Flyttet` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `contacts`
--

CREATE TABLE `contacts` (
  `ContactID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `POBox` varchar(50) DEFAULT NULL,
  `AreaCode` varchar(20) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateOrProvince` varchar(20) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `EmailName` varchar(50) DEFAULT NULL,
  `Birthdate` varchar(11) DEFAULT NULL,
  `Engelsk` tinyint(4) DEFAULT NULL,
  `MottattBrev` tinyint(4) DEFAULT NULL,
  `MottattMail` tinyint(4) DEFAULT NULL,
  `MottattKort` tinyint(4) DEFAULT NULL,
  `MottattSMS` tinyint(4) DEFAULT NULL,
  `Julebrev` tinyint(4) DEFAULT NULL,
  `Julekort` tinyint(4) DEFAULT NULL,
  `JuleMail` tinyint(4) DEFAULT NULL,
  `JuleSMS` tinyint(4) DEFAULT NULL,
  `Sent` tinyint(4) DEFAULT NULL,
  `Plural` tinyint(4) DEFAULT NULL,
  `DinDere` varchar(4) DEFAULT NULL,
  `IkkeAktuell` tinyint(4) DEFAULT NULL,
  `GaveKandidat` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `dokumenter`
--

CREATE TABLE `dokumenter` (
  `DokID` int(11) NOT NULL,
  `DokFork` varchar(255) DEFAULT NULL,
  `DokTittel` varchar(255) DEFAULT NULL,
  `Utgitt` varchar(255) DEFAULT NULL,
  `Media` varchar(255) DEFAULT NULL,
  `Tegning` bit(1) DEFAULT NULL,
  `PlassID` int(11) DEFAULT NULL,
  `ElektronFil` bit(1) DEFAULT NULL,
  `DokFil` mediumtext DEFAULT NULL,
  `Merknad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `fryseinnhold`
--

CREATE TABLE `fryseinnhold` (
  `ID` int(11) NOT NULL,
  `Navn` varchar(255) DEFAULT NULL,
  `FryMID` int(11) DEFAULT NULL,
  `FEmbID` int(11) DEFAULT NULL,
  `Antall` float DEFAULT NULL,
  `FMID` int(11) DEFAULT NULL,
  `Mengde` float DEFAULT NULL,
  `DatoInn` date DEFAULT NULL,
  `HoldDato` date DEFAULT NULL,
  `Sted` varchar(255) DEFAULT NULL,
  `Merket` varchar(255) DEFAULT NULL,
  `Drikk` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `husrom`
--

CREATE TABLE `husrom` (
  `HusRomID` int(11) NOT NULL,
  `HusID` int(11) DEFAULT NULL,
  `RomID` int(11) DEFAULT NULL,
  `Ute` bit(1) DEFAULT NULL,
  `Sorter` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `husromsted`
--

CREATE TABLE `husromsted` (
  `HusRomStedID` int(11) NOT NULL,
  `HusRomID` int(11) DEFAULT NULL,
  `StedID` int(11) DEFAULT NULL,
  `Ute` bit(1) DEFAULT NULL,
  `Sorter` smallint(6) DEFAULT NULL,
  `Anlagt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `inventar`
--

CREATE TABLE `inventar` (
  `InvID` int(11) NOT NULL,
  `InventarNavn` varchar(255) DEFAULT NULL,
  `Fabrikat` varchar(255) DEFAULT NULL,
  `InvTypeID` int(11) DEFAULT NULL,
  `StatusBeholdning` float DEFAULT NULL,
  `StatusDato` date DEFAULT NULL,
  `AnskaffMetode` varchar(255) DEFAULT NULL,
  `AnskaffPris` int(11) DEFAULT NULL,
  `AnskaffYear` varchar(255) DEFAULT NULL,
  `Merknader` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `inventarplass`
--

CREATE TABLE `inventarplass` (
  `InvPlID` int(11) NOT NULL,
  `InvID` int(11) DEFAULT NULL,
  `PlassID` int(11) DEFAULT NULL,
  `Beholdning` float DEFAULT NULL,
  `Utlaant` bit(1) DEFAULT NULL,
  `Merknader` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `jobb`
--

CREATE TABLE `jobb` (
  `JobbID` int(11) NOT NULL,
  `KompID` int(11) DEFAULT NULL,
  `JobbNavn` varchar(255) DEFAULT NULL,
  `JobbBeskrivelse` mediumtext DEFAULT NULL,
  `Male` bit(1) DEFAULT NULL,
  `HusID` int(11) DEFAULT NULL,
  `RomID` int(11) DEFAULT NULL,
  `StedID` int(11) DEFAULT NULL,
  `StedElement` varchar(255) DEFAULT NULL,
  `HusRomID` int(11) DEFAULT NULL,
  `HusRomStedID` int(11) DEFAULT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `MalID` int(11) DEFAULT NULL,
  `SekvNr` smallint(6) DEFAULT NULL,
  `Ute` bit(1) DEFAULT NULL,
  `Intervall` smallint(6) DEFAULT NULL,
  `Frist` date DEFAULT NULL,
  `Startet` bit(1) DEFAULT NULL,
  `Ferdig` bit(1) DEFAULT NULL,
  `FerdigDato` date DEFAULT NULL,
  `Merknad` mediumtext DEFAULT NULL,
  `JobbIDPrev` int(11) DEFAULT NULL,
  `Flag` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `jobboppd`
--

CREATE TABLE `jobboppd` (
  `JobbID` int(11) NOT NULL,
  `KompID` int(11) DEFAULT NULL,
  `JobbNavn` varchar(255) DEFAULT NULL,
  `JobbBeskrivelse` mediumtext DEFAULT NULL,
  `Male` bit(1) DEFAULT NULL,
  `HusID` int(11) DEFAULT NULL,
  `RomID` int(11) DEFAULT NULL,
  `StedID` int(11) DEFAULT NULL,
  `StedElement` varchar(255) DEFAULT NULL,
  `HusRomID` int(11) DEFAULT NULL,
  `HusRomStedID` int(11) DEFAULT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `MalID` int(11) DEFAULT NULL,
  `SekvNr` smallint(6) DEFAULT NULL,
  `Ute` bit(1) DEFAULT NULL,
  `Intervall` smallint(6) DEFAULT NULL,
  `Frist` date DEFAULT NULL,
  `Startet` bit(1) DEFAULT NULL,
  `Ferdig` bit(1) DEFAULT NULL,
  `FerdigDato` date DEFAULT NULL,
  `Merknad` mediumtext DEFAULT NULL,
  `JobbIDPrev` int(11) DEFAULT NULL,
  `Flag` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `komponent`
--

CREATE TABLE `komponent` (
  `KompID` int(11) NOT NULL,
  `Trinn` int(11) DEFAULT NULL,
  `Komponent` varchar(200) DEFAULT NULL,
  `KompNr` varchar(255) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `Merknad` mediumtext DEFAULT NULL,
  `Benyttes` bit(1) DEFAULT NULL,
  `Lavest` bit(1) DEFAULT NULL,
  `SerNr` int(11) DEFAULT NULL,
  `Flag` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `malingbrukssted`
--

CREATE TABLE `malingbrukssted` (
  `MBSID` int(11) NOT NULL,
  `Male` bit(1) DEFAULT NULL,
  `HusID` int(11) DEFAULT NULL,
  `RomID` int(11) DEFAULT NULL,
  `StedID` int(11) DEFAULT NULL,
  `StedElement` varchar(255) DEFAULT NULL,
  `HusRomID` int(11) DEFAULT NULL,
  `HusRomStedID` int(11) DEFAULT NULL,
  `MalID` int(11) DEFAULT NULL,
  `FerdigDato` date DEFAULT NULL,
  `Merknad` mediumtext DEFAULT NULL,
  `Flag` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `malingplass`
--

CREATE TABLE `malingplass` (
  `MSID` int(11) NOT NULL,
  `MalID` int(11) DEFAULT NULL,
  `EnhID` int(11) DEFAULT NULL,
  `PlassID` int(11) DEFAULT NULL,
  `Beholdning` float DEFAULT NULL,
  `Merknad` varchar(255) DEFAULT NULL,
  `AnskaffDato` date DEFAULT NULL,
  `EmbID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `malingslag`
--

CREATE TABLE `malingslag` (
  `MalID` int(11) NOT NULL,
  `MalBasisID` int(11) DEFAULT NULL,
  `MalingFabrikat` varchar(255) DEFAULT NULL,
  `Farge` varchar(255) DEFAULT NULL,
  `Blankhet` varchar(255) DEFAULT NULL,
  `Fargekode` varchar(255) DEFAULT NULL,
  `Ute` bit(1) DEFAULT NULL,
  `StatusBeholdning` float DEFAULT NULL,
  `StatusDato` date DEFAULT NULL,
  `FraDato` date DEFAULT NULL,
  `Intervall` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `middel`
--

CREATE TABLE `middel` (
  `MiddelID` int(11) NOT NULL,
  `MiddelNavn` varchar(255) DEFAULT NULL,
  `Fabrikat` varchar(255) DEFAULT NULL,
  `MiddelTypeID` int(11) DEFAULT NULL,
  `EnhetVolum` varchar(255) DEFAULT NULL,
  `EnhID` int(11) DEFAULT NULL,
  `StatusBeholdning` float DEFAULT NULL,
  `StatusDato` date DEFAULT NULL,
  `Merknader` varchar(255) DEFAULT NULL,
  `FrostFritt` bit(1) DEFAULT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `Forbruks` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `middelplass`
--

CREATE TABLE `middelplass` (
  `MidDetID` int(11) NOT NULL,
  `MiddelID` int(11) DEFAULT NULL,
  `PlassID` int(11) DEFAULT NULL,
  `Beholdning` float DEFAULT NULL,
  `Utlaant` bit(1) DEFAULT NULL,
  `Merknader` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `oppskrifter`
--

CREATE TABLE `oppskrifter` (
  `OppskriftID` int(11) NOT NULL,
  `OppskriftNavn` varchar(50) DEFAULT NULL,
  `TypeMat` varchar(50) DEFAULT NULL,
  `Ingrediens` mediumtext DEFAULT NULL,
  `ArbInstruks` mediumtext DEFAULT NULL,
  `GraderOvn` smallint(6) DEFAULT NULL,
  `TidIOvn` varchar(3) DEFAULT NULL,
  `OppskriftLenke` mediumtext DEFAULT NULL,
  `Porsjoner` varchar(255) DEFAULT NULL,
  `OppskriftKilde` varchar(255) DEFAULT NULL,
  `OppskriftVedlegg` varchar(255) DEFAULT NULL,
  `HarVedlegg` bit(1) DEFAULT NULL,
  `Nam` smallint(6) DEFAULT NULL,
  `SistLaget` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `passanne`
--

CREATE TABLE `passanne` (
  `SerID` int(11) NOT NULL,
  `Product` varchar(50) DEFAULT NULL,
  `WebAddr` mediumtext DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `SerialNo` varchar(255) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `OwnEmail` varchar(50) DEFAULT NULL,
  `LoginName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PIN` varchar(50) DEFAULT NULL,
  `Special` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `passgerhard`
--

CREATE TABLE `passgerhard` (
  `SerID` int(11) NOT NULL,
  `Product` varchar(50) DEFAULT NULL,
  `WebAddr` mediumtext DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `SerialNo` varchar(255) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `OwnEmail` varchar(50) DEFAULT NULL,
  `LoginName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PIN` varchar(50) DEFAULT NULL,
  `Special` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `persutstyr`
--

CREATE TABLE `persutstyr` (
  `PUID` int(11) NOT NULL,
  `PUType` varchar(255) DEFAULT NULL,
  `PUEier` varchar(25) DEFAULT NULL,
  `PUSted` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `reservedel`
--

CREATE TABLE `reservedel` (
  `DelID` int(11) NOT NULL,
  `DelNavn` varchar(255) DEFAULT NULL,
  `Fabrikat` varchar(255) DEFAULT NULL,
  `DelNummer` varchar(255) DEFAULT NULL,
  `Spesifikasjon` varchar(255) DEFAULT NULL,
  `EnhetVolum` float DEFAULT NULL,
  `Emballasje` varchar(15) DEFAULT NULL,
  `StatusDato` date DEFAULT NULL,
  `StatusBeholdning` int(11) DEFAULT NULL,
  `Merknad` mediumtext DEFAULT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `Tilbeh` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `reservedelplass`
--

CREATE TABLE `reservedelplass` (
  `ResPlID` int(11) NOT NULL,
  `DelID` int(11) DEFAULT NULL,
  `PlassID` int(11) DEFAULT NULL,
  `Beholdning` float DEFAULT NULL,
  `Utlaant` bit(1) DEFAULT NULL,
  `Merknader` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `service`
--

CREATE TABLE `service` (
  `SID` int(11) NOT NULL,
  `Firma` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Telefon` varchar(255) DEFAULT NULL,
  `Epost` varchar(255) DEFAULT NULL,
  `Webadr` mediumtext DEFAULT NULL,
  `Kontakt` varchar(255) DEFAULT NULL,
  `Mobil` varchar(255) DEFAULT NULL,
  `Kepost` varchar(255) DEFAULT NULL,
  `Merknader` mediumtext DEFAULT NULL,
  `Kundenr` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `utstyr`
--

CREATE TABLE `utstyr` (
  `UtstyrID` int(11) NOT NULL,
  `KompID` int(11) DEFAULT NULL,
  `Utstyr` varchar(255) DEFAULT NULL,
  `Fabrikat` varchar(255) DEFAULT NULL,
  `Modell` mediumtext DEFAULT NULL,
  `Serienr` mediumtext DEFAULT NULL,
  `Kapasitet` varchar(255) DEFAULT NULL,
  `KravSertifikat` bit(1) DEFAULT NULL,
  `Reserve` bit(1) DEFAULT NULL,
  `Merknad` mediumtext DEFAULT NULL,
  `Antall` int(11) DEFAULT NULL,
  `Flag` bit(1) DEFAULT NULL,
  `StatusDato` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `utstyrdok`
--

CREATE TABLE `utstyrdok` (
  `SerID` int(11) NOT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `DokID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `utstyrplass`
--

CREATE TABLE `utstyrplass` (
  `UtstyrPlassID` int(11) NOT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `PlassID` int(11) DEFAULT NULL,
  `Beholdning` int(11) DEFAULT NULL,
  `Utlaant` bit(1) DEFAULT NULL,
  `Merknader` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `utstyrreserve`
--

CREATE TABLE `utstyrreserve` (
  `SerID` int(11) NOT NULL,
  `DelID` int(11) DEFAULT NULL,
  `UtstyrID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `utstyrservice`
--

CREATE TABLE `utstyrservice` (
  `UtstyrSvcID` int(11) NOT NULL,
  `UtstyrID` int(11) DEFAULT NULL,
  `SID` int(11) DEFAULT NULL,
  `Dato` date DEFAULT NULL,
  `SvcInnhold` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `vin`
--

CREATE TABLE `vin` (
  `VinID` int(11) NOT NULL,
  `VinType` varchar(255) DEFAULT NULL,
  `VinNavn` varchar(255) DEFAULT NULL,
  `VinYard` varchar(255) DEFAULT NULL,
  `Distrikt` varchar(255) DEFAULT NULL,
  `Land` varchar(255) DEFAULT NULL,
  `Drue` varchar(255) DEFAULT NULL,
  `Vintage` varchar(4) DEFAULT NULL,
  `Kommentar` mediumtext DEFAULT NULL,
  `PasserTil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `vwboker`
--

CREATE TABLE `vwboker` (
  `BookID` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(255) DEFAULT NULL,
  `Series` int(11) DEFAULT NULL,
  `Abstract` mediumtext DEFAULT NULL,
  `PaperBack` bit(1) DEFAULT NULL,
  `RackID` int(11) DEFAULT NULL,
  `PubYear` varchar(50) DEFAULT NULL,
  `EditionNo` smallint(6) DEFAULT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `NatID` int(11) DEFAULT NULL,
  `DateRec` varchar(50) DEFAULT NULL,
  `RecFrom` varchar(50) DEFAULT NULL,
  `LoanTo` varchar(50) DEFAULT NULL,
  `ReadAnne` varchar(255) DEFAULT NULL,
  `ReadGerhard` varchar(255) DEFAULT NULL,
  `DateLoan` varchar(50) DEFAULT NULL,
  `PubID` int(11) DEFAULT NULL,
  `RackNo` varchar(5) DEFAULT NULL,
  `CatID` int(11) DEFAULT NULL,
  `ShelfName` varchar(255) DEFAULT NULL,
  `AutID` int(11) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `wishgift`
--

CREATE TABLE `wishgift` (
  `ID` int(11) NOT NULL,
  `ContactID` int(11) DEFAULT NULL,
  `ValYear` smallint(6) DEFAULT NULL,
  `Wish` varchar(50) DEFAULT NULL,
  `Gift` varchar(255) DEFAULT NULL,
  `Anne` varchar(255) DEFAULT NULL,
  `Gerhard` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xbokcategory`
--

CREATE TABLE `xbokcategory` (
  `CatID` int(11) NOT NULL,
  `Category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xboknation`
--

CREATE TABLE `xboknation` (
  `NatID` int(11) NOT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Citizen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xbokpublish`
--

CREATE TABLE `xbokpublish` (
  `PubID` int(11) NOT NULL,
  `PublishName` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `NatID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xbokshelf`
--

CREATE TABLE `xbokshelf` (
  `RackID` int(11) NOT NULL,
  `RackName` varchar(255) DEFAULT NULL,
  `NoShelves` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xemballasje`
--

CREATE TABLE `xemballasje` (
  `EmbID` int(11) NOT NULL,
  `EmbBenevn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xenhet`
--

CREATE TABLE `xenhet` (
  `EnhID` int(11) NOT NULL,
  `Enhet` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xfryseembal`
--

CREATE TABLE `xfryseembal` (
  `FEmbID` int(11) NOT NULL,
  `EmbFork` varchar(2) DEFAULT NULL,
  `Emballasje` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xfrysemat`
--

CREATE TABLE `xfrysemat` (
  `FryMID` int(11) NOT NULL,
  `MatFork` varchar(2) DEFAULT NULL,
  `MatKat` varchar(255) DEFAULT NULL,
  `MatTypeID` int(11) DEFAULT NULL,
  `Drikk` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xfrysemea`
--

CREATE TABLE `xfrysemea` (
  `FMID` int(11) NOT NULL,
  `MeaFork` varchar(2) DEFAULT NULL,
  `MeaNavn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xfrysetyper`
--

CREATE TABLE `xfrysetyper` (
  `FryTyID` int(11) NOT NULL,
  `MatTypeID` int(11) DEFAULT NULL,
  `MatType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xhus`
--

CREATE TABLE `xhus` (
  `HusID` int(11) NOT NULL,
  `HusBenevn` varchar(255) DEFAULT NULL,
  `Sorter` int(11) DEFAULT NULL,
  `Bygd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xinventar`
--

CREATE TABLE `xinventar` (
  `InvTypeID` int(11) NOT NULL,
  `InvType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xlager`
--

CREATE TABLE `xlager` (
  `LagerID` int(11) NOT NULL,
  `lagerBenevn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xmalbasis`
--

CREATE TABLE `xmalbasis` (
  `MalBasisID` int(11) NOT NULL,
  `MalBasisBenevn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xmattyper`
--

CREATE TABLE `xmattyper` (
  `MatTypeID` int(11) NOT NULL,
  `MatType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xmiddeltype`
--

CREATE TABLE `xmiddeltype` (
  `MiddelTypeID` int(11) NOT NULL,
  `MiddelType` varchar(1) DEFAULT NULL,
  `MiddelBeskrivelse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xplassering`
--

CREATE TABLE `xplassering` (
  `PlassID` int(11) NOT NULL,
  `Plassering` varchar(255) DEFAULT NULL,
  `Reserve` bit(1) DEFAULT NULL,
  `Middel` bit(1) DEFAULT NULL,
  `Utstyr` bit(1) DEFAULT NULL,
  `Dok` bit(1) DEFAULT NULL,
  `Redsk` bit(1) DEFAULT NULL,
  `Inv` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xrom`
--

CREATE TABLE `xrom` (
  `RomID` int(11) NOT NULL,
  `RomBenevn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xsted`
--

CREATE TABLE `xsted` (
  `StedID` int(11) NOT NULL,
  `StedBenevn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xtypeoppskrift`
--

CREATE TABLE `xtypeoppskrift` (
  `TypRID` int(11) NOT NULL,
  `TypeRett` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `xuser`
--

CREATE TABLE `xuser` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','super','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `IsActive` tinyint(1) NOT NULL DEFAULT 1,
  `LastUsed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `yearlist`
--

CREATE TABLE `yearlist` (
  `ID` int(11) NOT NULL,
  `ValYear` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `zrapporter`
--

CREATE TABLE `zrapporter` (
  `ID` int(11) NOT NULL,
  `Rapport` varchar(255) DEFAULT NULL,
  `RepNr` smallint(6) DEFAULT NULL,
  `TabNr` smallint(6) DEFAULT NULL,
  `Ibruk` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_danish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonmedlem`
--
ALTER TABLE `abonmedlem`
  ADD PRIMARY KEY (`AbID`);

--
-- Indexes for table `bokauthor`
--
ALTER TABLE `bokauthor`
  ADD PRIMARY KEY (`AutID`),
  ADD KEY `NatID` (`NatID`);

--
-- Indexes for table `bokauthorbook`
--
ALTER TABLE `bokauthorbook`
  ADD PRIMARY KEY (`AutBookID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `AutID` (`AutID`);

--
-- Indexes for table `bokbook`
--
ALTER TABLE `bokbook`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `NatID` (`NatID`),
  ADD KEY `PubID` (`PubID`),
  ADD KEY `CatID` (`CatID`),
  ADD KEY `RackID` (`RackID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`ContactID`);

--
-- Indexes for table `dokumenter`
--
ALTER TABLE `dokumenter`
  ADD PRIMARY KEY (`DokID`),
  ADD KEY `PlassID` (`PlassID`);

--
-- Indexes for table `fryseinnhold`
--
ALTER TABLE `fryseinnhold`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FryMID` (`FryMID`),
  ADD KEY `FEmbID` (`FEmbID`),
  ADD KEY `FMID` (`FMID`);

--
-- Indexes for table `husrom`
--
ALTER TABLE `husrom`
  ADD PRIMARY KEY (`HusRomID`),
  ADD KEY `HusID` (`HusID`),
  ADD KEY `RomID` (`RomID`);

--
-- Indexes for table `husromsted`
--
ALTER TABLE `husromsted`
  ADD PRIMARY KEY (`HusRomStedID`),
  ADD KEY `HusRomID` (`HusRomID`),
  ADD KEY `StedID` (`StedID`);

--
-- Indexes for table `inventar`
--
ALTER TABLE `inventar`
  ADD PRIMARY KEY (`InvID`),
  ADD KEY `InvTypeID` (`InvTypeID`);

--
-- Indexes for table `inventarplass`
--
ALTER TABLE `inventarplass`
  ADD PRIMARY KEY (`InvPlID`),
  ADD KEY `Index 2` (`InvID`),
  ADD KEY `Index 3` (`PlassID`);

--
-- Indexes for table `jobb`
--
ALTER TABLE `jobb`
  ADD PRIMARY KEY (`JobbID`),
  ADD KEY `HusRomID` (`HusRomID`),
  ADD KEY `HusRomStedID` (`HusRomStedID`),
  ADD KEY `RomID` (`RomID`);

--
-- Indexes for table `jobboppd`
--
ALTER TABLE `jobboppd`
  ADD PRIMARY KEY (`JobbID`),
  ADD KEY `HusID` (`HusID`),
  ADD KEY `HusRomID` (`HusRomID`),
  ADD KEY `HusRomStedID` (`HusRomStedID`),
  ADD KEY `RomID` (`RomID`);

--
-- Indexes for table `komponent`
--
ALTER TABLE `komponent`
  ADD PRIMARY KEY (`KompID`),
  ADD KEY `Index 2` (`ParentID`);

--
-- Indexes for table `malingbrukssted`
--
ALTER TABLE `malingbrukssted`
  ADD PRIMARY KEY (`MBSID`),
  ADD KEY `Index 2` (`HusID`),
  ADD KEY `Index 3` (`RomID`),
  ADD KEY `Index 4` (`StedID`),
  ADD KEY `Index 5` (`HusRomID`),
  ADD KEY `Index 6` (`HusRomStedID`),
  ADD KEY `Index 7` (`MalID`);

--
-- Indexes for table `malingplass`
--
ALTER TABLE `malingplass`
  ADD PRIMARY KEY (`MSID`),
  ADD KEY `Index 2` (`MalID`),
  ADD KEY `Index 3` (`PlassID`),
  ADD KEY `Index 4` (`EnhID`),
  ADD KEY `Index 5` (`EmbID`);

--
-- Indexes for table `malingslag`
--
ALTER TABLE `malingslag`
  ADD PRIMARY KEY (`MalID`),
  ADD KEY `MalBasisID` (`MalBasisID`);

--
-- Indexes for table `middel`
--
ALTER TABLE `middel`
  ADD PRIMARY KEY (`MiddelID`),
  ADD KEY `MiddelTypeID` (`MiddelTypeID`),
  ADD KEY `EnhID` (`EnhID`),
  ADD KEY `UtstyrID` (`UtstyrID`);

--
-- Indexes for table `middelplass`
--
ALTER TABLE `middelplass`
  ADD PRIMARY KEY (`MidDetID`),
  ADD KEY `Index 2` (`MiddelID`),
  ADD KEY `Index 3` (`PlassID`);

--
-- Indexes for table `oppskrifter`
--
ALTER TABLE `oppskrifter`
  ADD PRIMARY KEY (`OppskriftID`);

--
-- Indexes for table `passanne`
--
ALTER TABLE `passanne`
  ADD PRIMARY KEY (`SerID`);

--
-- Indexes for table `passgerhard`
--
ALTER TABLE `passgerhard`
  ADD PRIMARY KEY (`SerID`);

--
-- Indexes for table `persutstyr`
--
ALTER TABLE `persutstyr`
  ADD PRIMARY KEY (`PUID`);

--
-- Indexes for table `reservedel`
--
ALTER TABLE `reservedel`
  ADD PRIMARY KEY (`DelID`),
  ADD KEY `Index 2` (`UtstyrID`);

--
-- Indexes for table `reservedelplass`
--
ALTER TABLE `reservedelplass`
  ADD PRIMARY KEY (`ResPlID`),
  ADD KEY `Index 2` (`DelID`),
  ADD KEY `Index 3` (`PlassID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `utstyr`
--
ALTER TABLE `utstyr`
  ADD PRIMARY KEY (`UtstyrID`),
  ADD KEY `Index 2` (`KompID`);

--
-- Indexes for table `utstyrdok`
--
ALTER TABLE `utstyrdok`
  ADD PRIMARY KEY (`SerID`),
  ADD KEY `Index 2` (`UtstyrID`),
  ADD KEY `Index 3` (`DokID`);

--
-- Indexes for table `utstyrplass`
--
ALTER TABLE `utstyrplass`
  ADD PRIMARY KEY (`UtstyrPlassID`),
  ADD KEY `Index 2` (`UtstyrID`),
  ADD KEY `Index 3` (`PlassID`);

--
-- Indexes for table `utstyrreserve`
--
ALTER TABLE `utstyrreserve`
  ADD PRIMARY KEY (`SerID`),
  ADD KEY `Index 2` (`DelID`),
  ADD KEY `Index 3` (`UtstyrID`);

--
-- Indexes for table `utstyrservice`
--
ALTER TABLE `utstyrservice`
  ADD PRIMARY KEY (`UtstyrSvcID`),
  ADD KEY `UtstyrID` (`UtstyrID`,`SID`),
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `vin`
--
ALTER TABLE `vin`
  ADD PRIMARY KEY (`VinID`);

--
-- Indexes for table `wishgift`
--
ALTER TABLE `wishgift`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ContactID` (`ContactID`);

--
-- Indexes for table `xbokcategory`
--
ALTER TABLE `xbokcategory`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `xboknation`
--
ALTER TABLE `xboknation`
  ADD PRIMARY KEY (`NatID`);

--
-- Indexes for table `xbokpublish`
--
ALTER TABLE `xbokpublish`
  ADD PRIMARY KEY (`PubID`),
  ADD KEY `xbokpub_xboknat` (`NatID`);

--
-- Indexes for table `xbokshelf`
--
ALTER TABLE `xbokshelf`
  ADD PRIMARY KEY (`RackID`);

--
-- Indexes for table `xemballasje`
--
ALTER TABLE `xemballasje`
  ADD PRIMARY KEY (`EmbID`);

--
-- Indexes for table `xenhet`
--
ALTER TABLE `xenhet`
  ADD PRIMARY KEY (`EnhID`);

--
-- Indexes for table `xfryseembal`
--
ALTER TABLE `xfryseembal`
  ADD PRIMARY KEY (`FEmbID`),
  ADD KEY `EmbID` (`EmbFork`) USING BTREE;

--
-- Indexes for table `xfrysemat`
--
ALTER TABLE `xfrysemat`
  ADD PRIMARY KEY (`FryMID`),
  ADD UNIQUE KEY `MatID` (`MatFork`),
  ADD KEY `MatTypeID` (`MatTypeID`);

--
-- Indexes for table `xfrysemea`
--
ALTER TABLE `xfrysemea`
  ADD PRIMARY KEY (`FMID`),
  ADD KEY `MeaID` (`MeaFork`);

--
-- Indexes for table `xfrysetyper`
--
ALTER TABLE `xfrysetyper`
  ADD PRIMARY KEY (`FryTyID`),
  ADD KEY `Index 2` (`MatTypeID`);

--
-- Indexes for table `xhus`
--
ALTER TABLE `xhus`
  ADD PRIMARY KEY (`HusID`);

--
-- Indexes for table `xinventar`
--
ALTER TABLE `xinventar`
  ADD PRIMARY KEY (`InvTypeID`);

--
-- Indexes for table `xlager`
--
ALTER TABLE `xlager`
  ADD PRIMARY KEY (`LagerID`);

--
-- Indexes for table `xmalbasis`
--
ALTER TABLE `xmalbasis`
  ADD PRIMARY KEY (`MalBasisID`);

--
-- Indexes for table `xmattyper`
--
ALTER TABLE `xmattyper`
  ADD PRIMARY KEY (`MatTypeID`) USING BTREE;

--
-- Indexes for table `xmiddeltype`
--
ALTER TABLE `xmiddeltype`
  ADD PRIMARY KEY (`MiddelTypeID`);

--
-- Indexes for table `xplassering`
--
ALTER TABLE `xplassering`
  ADD PRIMARY KEY (`PlassID`);

--
-- Indexes for table `xrom`
--
ALTER TABLE `xrom`
  ADD PRIMARY KEY (`RomID`);

--
-- Indexes for table `xsted`
--
ALTER TABLE `xsted`
  ADD UNIQUE KEY `Index 1` (`StedID`);

--
-- Indexes for table `xtypeoppskrift`
--
ALTER TABLE `xtypeoppskrift`
  ADD PRIMARY KEY (`TypRID`);

--
-- Indexes for table `xuser`
--
ALTER TABLE `xuser`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `yearlist`
--
ALTER TABLE `yearlist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ValYear`) USING BTREE;

--
-- Indexes for table `zrapporter`
--
ALTER TABLE `zrapporter`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonmedlem`
--
ALTER TABLE `abonmedlem`
  MODIFY `AbID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bokauthor`
--
ALTER TABLE `bokauthor`
  MODIFY `AutID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bokauthorbook`
--
ALTER TABLE `bokauthorbook`
  MODIFY `AutBookID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bokbook`
--
ALTER TABLE `bokbook`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `ContactID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokumenter`
--
ALTER TABLE `dokumenter`
  MODIFY `DokID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fryseinnhold`
--
ALTER TABLE `fryseinnhold`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `husrom`
--
ALTER TABLE `husrom`
  MODIFY `HusRomID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `husromsted`
--
ALTER TABLE `husromsted`
  MODIFY `HusRomStedID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventar`
--
ALTER TABLE `inventar`
  MODIFY `InvID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventarplass`
--
ALTER TABLE `inventarplass`
  MODIFY `InvPlID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobb`
--
ALTER TABLE `jobb`
  MODIFY `JobbID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobboppd`
--
ALTER TABLE `jobboppd`
  MODIFY `JobbID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komponent`
--
ALTER TABLE `komponent`
  MODIFY `KompID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malingbrukssted`
--
ALTER TABLE `malingbrukssted`
  MODIFY `MBSID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malingplass`
--
ALTER TABLE `malingplass`
  MODIFY `MSID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malingslag`
--
ALTER TABLE `malingslag`
  MODIFY `MalID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `middel`
--
ALTER TABLE `middel`
  MODIFY `MiddelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `middelplass`
--
ALTER TABLE `middelplass`
  MODIFY `MidDetID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oppskrifter`
--
ALTER TABLE `oppskrifter`
  MODIFY `OppskriftID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passanne`
--
ALTER TABLE `passanne`
  MODIFY `SerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passgerhard`
--
ALTER TABLE `passgerhard`
  MODIFY `SerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persutstyr`
--
ALTER TABLE `persutstyr`
  MODIFY `PUID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservedel`
--
ALTER TABLE `reservedel`
  MODIFY `DelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservedelplass`
--
ALTER TABLE `reservedelplass`
  MODIFY `ResPlID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utstyr`
--
ALTER TABLE `utstyr`
  MODIFY `UtstyrID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utstyrdok`
--
ALTER TABLE `utstyrdok`
  MODIFY `SerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utstyrplass`
--
ALTER TABLE `utstyrplass`
  MODIFY `UtstyrPlassID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utstyrreserve`
--
ALTER TABLE `utstyrreserve`
  MODIFY `SerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utstyrservice`
--
ALTER TABLE `utstyrservice`
  MODIFY `UtstyrSvcID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vin`
--
ALTER TABLE `vin`
  MODIFY `VinID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishgift`
--
ALTER TABLE `wishgift`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xbokcategory`
--
ALTER TABLE `xbokcategory`
  MODIFY `CatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xboknation`
--
ALTER TABLE `xboknation`
  MODIFY `NatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xbokpublish`
--
ALTER TABLE `xbokpublish`
  MODIFY `PubID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xbokshelf`
--
ALTER TABLE `xbokshelf`
  MODIFY `RackID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xemballasje`
--
ALTER TABLE `xemballasje`
  MODIFY `EmbID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xenhet`
--
ALTER TABLE `xenhet`
  MODIFY `EnhID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xfryseembal`
--
ALTER TABLE `xfryseembal`
  MODIFY `FEmbID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xfrysemat`
--
ALTER TABLE `xfrysemat`
  MODIFY `FryMID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xfrysemea`
--
ALTER TABLE `xfrysemea`
  MODIFY `FMID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xfrysetyper`
--
ALTER TABLE `xfrysetyper`
  MODIFY `FryTyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xhus`
--
ALTER TABLE `xhus`
  MODIFY `HusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xinventar`
--
ALTER TABLE `xinventar`
  MODIFY `InvTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xlager`
--
ALTER TABLE `xlager`
  MODIFY `LagerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xmalbasis`
--
ALTER TABLE `xmalbasis`
  MODIFY `MalBasisID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xmattyper`
--
ALTER TABLE `xmattyper`
  MODIFY `MatTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xmiddeltype`
--
ALTER TABLE `xmiddeltype`
  MODIFY `MiddelTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xplassering`
--
ALTER TABLE `xplassering`
  MODIFY `PlassID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xrom`
--
ALTER TABLE `xrom`
  MODIFY `RomID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xsted`
--
ALTER TABLE `xsted`
  MODIFY `StedID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xtypeoppskrift`
--
ALTER TABLE `xtypeoppskrift`
  MODIFY `TypRID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xuser`
--
ALTER TABLE `xuser`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yearlist`
--
ALTER TABLE `yearlist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zrapporter`
--
ALTER TABLE `zrapporter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Begrensninger for dumpede tabeller
--

--
-- Begrensninger for tabell `bokauthor`
--
ALTER TABLE `bokauthor`
  ADD CONSTRAINT `bokauthor_ibfk_1` FOREIGN KEY (`NatID`) REFERENCES `xboknation` (`NatID`);

--
-- Begrensninger for tabell `bokauthorbook`
--
ALTER TABLE `bokauthorbook`
  ADD CONSTRAINT `bokauthorbook_ibfk_1` FOREIGN KEY (`AutID`) REFERENCES `bokauthor` (`AutID`),
  ADD CONSTRAINT `bokauthorbook_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `bokbook` (`BookID`);

--
-- Begrensninger for tabell `bokbook`
--
ALTER TABLE `bokbook`
  ADD CONSTRAINT `bokbook_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `xbokcategory` (`CatID`),
  ADD CONSTRAINT `bokbook_ibfk_2` FOREIGN KEY (`NatID`) REFERENCES `xboknation` (`NatID`),
  ADD CONSTRAINT `bokbook_ibfk_3` FOREIGN KEY (`PubID`) REFERENCES `xbokpublish` (`PubID`),
  ADD CONSTRAINT `bokbook_ibfk_4` FOREIGN KEY (`RackID`) REFERENCES `xbokshelf` (`RackID`);

--
-- Begrensninger for tabell `dokumenter`
--
ALTER TABLE `dokumenter`
  ADD CONSTRAINT `dokumenter_ibfk_1` FOREIGN KEY (`PlassID`) REFERENCES `xplassering` (`PlassID`);

--
-- Begrensninger for tabell `fryseinnhold`
--
ALTER TABLE `fryseinnhold`
  ADD CONSTRAINT `fryseinnhold_ibfk_1` FOREIGN KEY (`FEmbID`) REFERENCES `xfryseembal` (`FEmbID`),
  ADD CONSTRAINT `fryseinnhold_ibfk_3` FOREIGN KEY (`FryMID`) REFERENCES `xfrysemat` (`FryMID`),
  ADD CONSTRAINT `fryseinnhold_ibfk_4` FOREIGN KEY (`FMID`) REFERENCES `xfrysemea` (`FMID`);

--
-- Begrensninger for tabell `husrom`
--
ALTER TABLE `husrom`
  ADD CONSTRAINT `husrom_ibfk_1` FOREIGN KEY (`RomID`) REFERENCES `xrom` (`RomID`),
  ADD CONSTRAINT `husrom_ibfk_2` FOREIGN KEY (`HusID`) REFERENCES `xhus` (`HusID`);

--
-- Begrensninger for tabell `husromsted`
--
ALTER TABLE `husromsted`
  ADD CONSTRAINT `husromsted_ibfk_1` FOREIGN KEY (`StedID`) REFERENCES `xsted` (`StedID`);

--
-- Begrensninger for tabell `inventar`
--
ALTER TABLE `inventar`
  ADD CONSTRAINT `inventar_ibfk_1` FOREIGN KEY (`InvTypeID`) REFERENCES `xinventar` (`InvTypeID`);

--
-- Begrensninger for tabell `inventarplass`
--
ALTER TABLE `inventarplass`
  ADD CONSTRAINT `inventarplass_ibfk_1` FOREIGN KEY (`InvID`) REFERENCES `inventar` (`InvID`),
  ADD CONSTRAINT `inventarplass_ibfk_2` FOREIGN KEY (`PlassID`) REFERENCES `xplassering` (`PlassID`);

--
-- Begrensninger for tabell `jobb`
--
ALTER TABLE `jobb`
  ADD CONSTRAINT `jobb_ibfk_1` FOREIGN KEY (`HusRomID`) REFERENCES `husrom` (`HusRomID`),
  ADD CONSTRAINT `jobb_ibfk_2` FOREIGN KEY (`HusRomStedID`) REFERENCES `husromsted` (`HusRomStedID`),
  ADD CONSTRAINT `jobb_ibfk_3` FOREIGN KEY (`RomID`) REFERENCES `xrom` (`RomID`);

--
-- Begrensninger for tabell `jobboppd`
--
ALTER TABLE `jobboppd`
  ADD CONSTRAINT `jobboppd_ibfk_1` FOREIGN KEY (`HusID`) REFERENCES `xhus` (`HusID`),
  ADD CONSTRAINT `jobboppd_ibfk_2` FOREIGN KEY (`HusRomID`) REFERENCES `husrom` (`HusRomID`),
  ADD CONSTRAINT `jobboppd_ibfk_3` FOREIGN KEY (`HusRomStedID`) REFERENCES `husromsted` (`HusRomStedID`),
  ADD CONSTRAINT `jobboppd_ibfk_4` FOREIGN KEY (`JobbID`) REFERENCES `jobb` (`JobbID`),
  ADD CONSTRAINT `jobboppd_ibfk_5` FOREIGN KEY (`RomID`) REFERENCES `xrom` (`RomID`);

--
-- Begrensninger for tabell `malingbrukssted`
--
ALTER TABLE `malingbrukssted`
  ADD CONSTRAINT `malingbrukssted_ibfk_1` FOREIGN KEY (`HusID`) REFERENCES `xhus` (`HusID`),
  ADD CONSTRAINT `malingbrukssted_ibfk_2` FOREIGN KEY (`HusRomID`) REFERENCES `husrom` (`HusRomID`),
  ADD CONSTRAINT `malingbrukssted_ibfk_3` FOREIGN KEY (`HusRomStedID`) REFERENCES `husromsted` (`HusRomStedID`),
  ADD CONSTRAINT `malingbrukssted_ibfk_4` FOREIGN KEY (`MalID`) REFERENCES `malingslag` (`MalID`),
  ADD CONSTRAINT `malingbrukssted_ibfk_5` FOREIGN KEY (`RomID`) REFERENCES `xrom` (`RomID`),
  ADD CONSTRAINT `malingbrukssted_ibfk_6` FOREIGN KEY (`StedID`) REFERENCES `xsted` (`StedID`);

--
-- Begrensninger for tabell `malingplass`
--
ALTER TABLE `malingplass`
  ADD CONSTRAINT `malingplass_ibfk_1` FOREIGN KEY (`EmbID`) REFERENCES `xemballasje` (`EmbID`),
  ADD CONSTRAINT `malingplass_ibfk_2` FOREIGN KEY (`EnhID`) REFERENCES `xenhet` (`EnhID`),
  ADD CONSTRAINT `malingplass_ibfk_3` FOREIGN KEY (`PlassID`) REFERENCES `xplassering` (`PlassID`),
  ADD CONSTRAINT `malingplass_ibfk_4` FOREIGN KEY (`MalID`) REFERENCES `malingslag` (`MalID`);

--
-- Begrensninger for tabell `malingslag`
--
ALTER TABLE `malingslag`
  ADD CONSTRAINT `malingslag_ibfk_1` FOREIGN KEY (`MalBasisID`) REFERENCES `xmalbasis` (`MalBasisID`);

--
-- Begrensninger for tabell `middel`
--
ALTER TABLE `middel`
  ADD CONSTRAINT `middel_ibfk_1` FOREIGN KEY (`MiddelTypeID`) REFERENCES `xmiddeltype` (`MiddelTypeID`),
  ADD CONSTRAINT `middel_ibfk_2` FOREIGN KEY (`EnhID`) REFERENCES `xenhet` (`EnhID`),
  ADD CONSTRAINT `middel_ibfk_3` FOREIGN KEY (`UtstyrID`) REFERENCES `utstyr` (`UtstyrID`);

--
-- Begrensninger for tabell `middelplass`
--
ALTER TABLE `middelplass`
  ADD CONSTRAINT `middelplass_ibfk_1` FOREIGN KEY (`PlassID`) REFERENCES `xplassering` (`PlassID`),
  ADD CONSTRAINT `middelplass_ibfk_2` FOREIGN KEY (`MiddelID`) REFERENCES `middel` (`MiddelID`);

--
-- Begrensninger for tabell `reservedel`
--
ALTER TABLE `reservedel`
  ADD CONSTRAINT `reservedel_ibfk_1` FOREIGN KEY (`UtstyrID`) REFERENCES `utstyr` (`UtstyrID`);

--
-- Begrensninger for tabell `reservedelplass`
--
ALTER TABLE `reservedelplass`
  ADD CONSTRAINT `reservedelplass_ibfk_1` FOREIGN KEY (`PlassID`) REFERENCES `xplassering` (`PlassID`),
  ADD CONSTRAINT `reservedelplass_ibfk_2` FOREIGN KEY (`DelID`) REFERENCES `reservedel` (`DelID`);

--
-- Begrensninger for tabell `utstyrplass`
--
ALTER TABLE `utstyrplass`
  ADD CONSTRAINT `utstyrplass_ibfk_1` FOREIGN KEY (`UtstyrID`) REFERENCES `utstyr` (`UtstyrID`);

--
-- Begrensninger for tabell `utstyrreserve`
--
ALTER TABLE `utstyrreserve`
  ADD CONSTRAINT `utstyrreserve_ibfk_1` FOREIGN KEY (`DelID`) REFERENCES `reservedel` (`DelID`),
  ADD CONSTRAINT `utstyrreserve_ibfk_2` FOREIGN KEY (`UtstyrID`) REFERENCES `utstyr` (`UtstyrID`);

--
-- Begrensninger for tabell `utstyrservice`
--
ALTER TABLE `utstyrservice`
  ADD CONSTRAINT `utstyrservice_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `service` (`SID`),
  ADD CONSTRAINT `utstyrservice_ibfk_2` FOREIGN KEY (`UtstyrID`) REFERENCES `utstyr` (`UtstyrID`);

--
-- Begrensninger for tabell `wishgift`
--
ALTER TABLE `wishgift`
  ADD CONSTRAINT `wishgift_ibfk_1` FOREIGN KEY (`ContactID`) REFERENCES `contacts` (`ContactID`);

--
-- Begrensninger for tabell `xbokpublish`
--
ALTER TABLE `xbokpublish`
  ADD CONSTRAINT `xbokpub_xboknat` FOREIGN KEY (`NatID`) REFERENCES `xboknation` (`NatID`);

--
-- Begrensninger for tabell `xfrysemat`
--
ALTER TABLE `xfrysemat`
  ADD CONSTRAINT `xfrysemat_ibfk_1` FOREIGN KEY (`MatTypeID`) REFERENCES `xmattyper` (`MatTypeID`);

--
-- Begrensninger for tabell `xfrysetyper`
--
ALTER TABLE `xfrysetyper`
  ADD CONSTRAINT `xfrysetyper_ibfk_1` FOREIGN KEY (`MatTypeID`) REFERENCES `xmattyper` (`MatTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
