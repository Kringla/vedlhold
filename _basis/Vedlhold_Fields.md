
## TABLE `abonmedlem`
  `AbID` width=6 ch,
  `AbNavn` width=255 ch,
  `AbFirma` width=255 ch,
  `AbType` width=255 ch,
  `AbTittel` width=255 ch,
  `AbAdresse` width=255 ch,
  `AbTelf` width=255 ch,
  `AbMobil` width=255 ch,
  `AbEpost` width=255 ch,
  `AbWeb` width=255 ch,
  `AbPassord` width=255 ch,
  `AbUser` width=255 ch,
  `AbBelop` width=24 ch,
  `AbValuta` width=255 ch,
  `AbPeriode` width=255 ch,
  `AbFornyDato` width=255 ch,
  `AbSistBetalt` width=18 ch,
  `AbAuto` checkbox,
  `AbFastTrekk` checkbox,
  `AbMerknader` width=255 ch

## TABLE `bokauthor`
  `AutID` width=6 ch,
  `LName` width=50 ch,
  `FName` width=50 ch,
  `NatID` width=6 ch,
  `OldNo` width=6 ch

## TABLE `bokauthorbook`
  `AutBookID` width=6 ch,
  `BookID` width=6 ch,
  `AutID` width=6 ch

## TABLE `bokbook`
  `BookID` width=6 ch,
  `Title` width=255 ch,
  `SubTitle` width=255 ch,
  `Series` width=6 ch,
  `Abstract` width=255 ch,
  `PubYear` width=50 ch,
  `EditionNo` width=6 ch,
  `ISBN` width=50 ch,
  `DateRec` width=50 ch,
  `RecFrom` width=50 ch,
  `ReadAnne` width=255 ch,
  `ReadGerhard` width=255 ch,
  `DateLoan` width=50 ch,
  `LoanTo` width=50 ch,
  `NatID` width=6 ch,
  `PubID` width=6 ch,
  `CatID` width=6 ch,
  `RackID` width=6 ch,
  `ShelfNo` width=6 ch,
  `PaperBack` checkbox,
  `Flyttet` checkbox

## TABLE `contacts`
  `ContactID` width=6 ch,
  `FirstName` width=50 ch,
  `LastName` width=50 ch,
  `Address` width=255 ch,
  `POBox` width=50 ch,
  `AreaCode` width=20 ch,
  `City` width=50 ch,
  `StateOrProvince` width=20 ch,
  `PostalCode` width=20 ch,
  `Country` width=50 ch,
  `EmailName` width=50 ch,
  `Birthdate` width=15 ch,
  `Engelsk` checkbox,
  `MottattBrev` checkbox,
  `MottattMail` checkbox,
  `MottattKort` checkbox,
  `MottattSMS` checkbox,
  `Julebrev` checkbox,
  `Julekort` checkbox,
  `JuleMail` checkbox,
  `JuleSMS` checkbox,
  `Sent` checkbox,
  `Plural` checkbox,
  `DinDere` width=6 ch,
  `IkkeAktuell` checkbox,
  `GaveKandidat` checkbox

## TABLE `dokumenter`
  `DokID` width=6 ch,
  `DokFork` width=255 ch,
  `DokTittel` width=255 ch,
  `Utgitt` width=255 ch,
  `Media` width=255 ch,
  `Tegning` checkbox,
  `PlassID` width=6 ch,
  `ElektronFil` checkbox,
  `DokFil` width=255 ch,
  `Merknad` width=255 ch

## TABLE `fryseinnhold`
  `ID` width=6 ch,
  `Navn` width=255 ch,
  `FryMID` width=6 ch,
  `FEmbID` width=6 ch,
  `Antall` width=24 ch,
  `FMID` width=6 ch,
  `Mengde` width=24 ch,
  `DatoInn` width=18 ch,
  `HoldDato` width=18 ch,
  `Sted` width=255 ch,
  `Merket` width=255 ch,
  `Drikk` checkbox

## TABLE `husrom`
  `HusRomID` width=6 ch,
  `HusID` width=6 ch,
  `RomID` width=6 ch,
  `Ute` checkbox,
  `Sorter` width=6 ch

## TABLE `husromsted`
  `HusRomStedID` width=6 ch,
  `HusRomID` width=6 ch,
  `StedID` width=6 ch,
  `Ute` checkbox,
  `Sorter` width=6 ch,
  `Anlagt` width=255 ch

## TABLE `inventar`
  `InvID` width=6 ch,
  `InventarNavn` width=255 ch,
  `Fabrikat` width=255 ch,
  `InvTypeID` width=6 ch,
  `StatusBeholdning` width=24 ch,
  `StatusDato` width=18 ch,
  `AnskaffMetode` width=255 ch,
  `AnskaffPris` width=6 ch,
  `AnskaffYear` width=255 ch,
  `Merknader` width=255 ch

## TABLE `inventarplass`
  `InvPlID` width=6 ch,
  `InvID` width=6 ch,
  `PlassID` width=6 ch,
  `Beholdning` width=24 ch,
  `Utlaant` checkbox,
  `Merknader` width=255 ch

## TABLE `jobb`
  `JobbID` width=6 ch,
  `KompID` width=6 ch,
  `JobbNavn` width=255 ch,
  `JobbBeskrivelse` width=255 ch,
  `Male` checkbox,
  `HusID` width=6 ch,
  `RomID` width=6 ch,
  `StedID` width=6 ch,
  `StedElement` width=255 ch,
  `HusRomID` width=6 ch,
  `HusRomStedID` width=6 ch,
  `UtstyrID` width=6 ch,
  `MalID` width=6 ch,
  `SekvNr` width=6 ch,
  `Ute` checkbox,
  `Intervall` width=6 ch,
  `Frist` width=18 ch,
  `Startet` checkbox,
  `Ferdig` checkbox,
  `FerdigDato` width=18 ch,
  `Merknad` width=255 ch,
  `JobbIDPrev` width=6 ch,
  `Flag` checkbox

## TABLE `jobboppd`
  `JobbID` width=6 ch,
  `KompID` width=6 ch,
  `JobbNavn` width=255 ch,
  `JobbBeskrivelse` width=255 ch,
  `Male` checkbox,
  `HusID` width=6 ch,
  `RomID` width=6 ch,
  `StedID` width=6 ch,
  `StedElement` width=255 ch,
  `HusRomID` width=6 ch,
  `HusRomStedID` width=6 ch,
  `UtstyrID` width=6 ch,
  `MalID` width=6 ch,
  `SekvNr` width=6 ch,
  `Ute` checkbox,
  `Intervall` width=6 ch,
  `Frist` width=18 ch,
  `Startet` checkbox,
  `Ferdig` checkbox,
  `FerdigDato` width=18 ch,
  `Merknad` width=255 ch,
  `JobbIDPrev` width=6 ch,
  `Flag` checkbox

## TABLE `komponent`
  `KompID` width=6 ch,
  `Trinn` width=6 ch,
  `Komponent` width=150 ch,
  `KompNr` width=255 ch,
  `ParentID` width=6 ch,
  `Merknad` width=255 ch,
  `Benyttes` checkbox,
  `Lavest` checkbox,
  `SerNr` width=6 ch,
  `Flag` checkbox

## TABLE `malingbrukssted`
  `MBSID` width=6 ch,
  `Male` checkbox,
  `HusID` width=6 ch,
  `RomID` width=6 ch,
  `StedID` width=6 ch,
  `StedElement` width=255 ch,
  `HusRomID` width=6 ch,
  `HusRomStedID` width=6 ch,
  `MalID` width=6 ch,
  `FerdigDato` width=18 ch,
  `Merknad` width=255 ch,
  `Flag` checkbox

## TABLE `malingplass`
  `MSID` width=6 ch,
  `MalID` width=6 ch,
  `EnhID` width=6 ch,
  `PlassID` width=6 ch,
  `Beholdning` width=24 ch,
  `Merknad` width=255 ch,
  `AnskaffDato` width=18 ch,
  `EmbID` width=6 ch

## TABLE `malingslag`
  `MalID` width=6 ch,
  `MalBasisID` width=6 ch,
  `MalingFabrikat` width=255 ch,
  `Farge` width=255 ch,
  `Blankhet` width=255 ch,
  `Fargekode` width=255 ch,
  `Ute` checkbox,
  `StatusBeholdning` width=24 ch,
  `StatusDato` width=18 ch,
  `FraDato` width=18 ch,
  `Intervall` width=6 ch

## TABLE `middel`
  `MiddelID` width=6 ch,
  `MiddelNavn` width=255 ch,
  `Fabrikat` width=255 ch,
  `MiddelTypeID` width=6 ch,
  `EnhetVolum` width=255 ch,
  `EnhID` width=6 ch,
  `StatusBeholdning` width=24 ch,
  `StatusDato` width=18 ch,
  `Merknader` width=255 ch,
  `FrostFritt` checkbox,
  `UtstyrID` width=6 ch,
  `Forbruks` checkbox

## TABLE `middelplass`
  `MidDetID` width=6 ch,
  `MiddelID` width=6 ch,
  `PlassID` width=6 ch,
  `Beholdning` width=24 ch,
  `Utlaant` checkbox,
  `Merknader` width=255 ch

## TABLE `oppskrifter`
  `OppskriftID` width=6 ch,
  `OppskriftNavn` width=50 ch,
  `TypeMat` width=50 ch,
  `Ingrediens` width=255 ch,
  `ArbInstruks` width=255 ch,
  `GraderOvn` width=6 ch,
  `TidIOvn` width=6 ch,
  `OppskriftLenke` width=255 ch,
  `Porsjoner` width=255 ch,
  `OppskriftKilde` width=255 ch,
  `OppskriftVedlegg` width=255 ch,
  `HarVedlegg` checkbox,
  `Nam` width=6 ch,
  `SistLaget` width=18 ch

## TABLE `passanne`
  `SerID` width=6 ch,
  `Product` width=50 ch,
  `WebAddr` width=255 ch,
  `UserName` width=50 ch,
  `CustomerID` width=50 ch,
  `SerialNo` width=255 ch,
  `Code` width=50 ch,
  `OwnEmail` width=50 ch,
  `LoginName` width=50 ch,
  `Password` width=255 ch,
  `PIN` width=50 ch,
  `Special` width=255 ch

## TABLE `passgerhard`
  `SerID` width=6 ch,
  `Product` width=50 ch,
  `WebAddr` width=255 ch,
  `UserName` width=50 ch,
  `CustomerID` width=50 ch,
  `SerialNo` width=255 ch,
  `Code` width=50 ch,
  `OwnEmail` width=50 ch,
  `LoginName` width=50 ch,
  `Password` width=255 ch,
  `PIN` width=50 ch,
  `Special` width=255 ch

## TABLE `persutstyr`
  `PUID` width=6 ch,
  `PUType` width=255 ch,
  `PUEier` width=24 ch,
  `PUSted` width=255 ch

## TABLE `reservedel`
  `DelID` width=6 ch,
  `DelNavn` width=255 ch,
  `Fabrikat` width=255 ch,
  `DelNummer` width=255 ch,
  `Spesifikasjon` width=255 ch,
  `EnhetVolum` width=24 ch,
  `Emballasje` width=15 ch,
  `StatusDato` width=18 ch,
  `StatusBeholdning` width=6 ch,
  `Merknad` width=255 ch,
  `UtstyrID` width=6 ch,
  `Tilbeh` checkbox

## TABLE `reservedelplass`
  `ResPlID` width=6 ch,
  `DelID` width=6 ch,
  `PlassID` width=6 ch,
  `Beholdning` width=24 ch,
  `Utlaant` checkbox,
  `Merknader` width=255 ch

## TABLE `service`
  `SID` width=6 ch,
  `Firma` width=255 ch,
  `Adresse` width=255 ch,
  `Telefon` width=255 ch,
  `Epost` width=255 ch,
  `Webadr` width=255 ch,
  `Kontakt` width=255 ch,
  `Mobil` width=255 ch,
  `Kepost` width=255 ch,
  `Merknader` width=255 ch,
  `Kundenr` width=255 ch

## TABLE `utstyr`
  `UtstyrID` width=6 ch,
  `KompID` width=6 ch,
  `Utstyr` width=255 ch,
  `Fabrikat` width=255 ch,
  `Modell` width=255 ch,
  `Serienr` width=255 ch,
  `Kapasitet` width=255 ch,
  `KravSertifikat` checkbox,
  `Reserve` checkbox,
  `Merknad` width=255 ch,
  `Antall` width=6 ch,
  `Flag` checkbox,
  `StatusDato` width=18 ch

## TABLE `utstyrdok`
  `SerID` width=6 ch,
  `UtstyrID` width=6 ch,
  `DokID` width=6 ch

## TABLE `utstyrplass`
  `UtstyrPlassID` width=6 ch,
  `UtstyrID` width=6 ch,
  `PlassID` width=6 ch,
  `Beholdning` width=6 ch,
  `Utlaant` checkbox,
  `Merknader` width=255 ch

## TABLE `utstyrreserve`
  `SerID` width=6 ch,
  `DelID` width=6 ch,
  `UtstyrID` width=6 ch

## TABLE `utstyrservice`
  `UtstyrSvcID` width=6 ch,
  `UtstyrID` width=6 ch,
  `SID` width=6 ch,
  `Dato` width=18 ch,
  `SvcInnhold` width=255 ch

## TABLE `vin`
  `VinID` width=6 ch,
  `VinType` width=255 ch,
  `VinNavn` width=255 ch,
  `VinYard` width=255 ch,
  `Distrikt` width=255 ch,
  `Land` width=255 ch,
  `Drue` width=255 ch,
  `Vintage` width=6 ch,
  `Kommentar` width=255 ch,
  `PasserTil` width=255 ch

## TABLE `vwboker`
  `BookID` width=6 ch,
  `Title` width=255 ch,
  `SubTitle` width=255 ch,
  `Series` width=6 ch,
  `Abstract` width=255 ch,
  `PaperBack` checkbox,
  `ShelfID` width=6 ch,
  `PubYear` width=50 ch,
  `EditionNo` width=6 ch,
  `ISBN` width=50 ch,
  `NatID` width=6 ch,
  `DateRec` width=50 ch,
  `RecFrom` width=50 ch,
  `LoanTo` width=50 ch,
  `ReadAnne` width=255 ch,
  `ReadGerhard` width=255 ch,
  `DateLoan` width=50 ch,
  `PubID` width=6 ch,
  `RackNo` width=6 ch,
  `CatID` width=6 ch,
  `ShelfName` width=255 ch,
  `AutID` width=6 ch,
  `LName` width=50 ch,
  `FName` width=50 ch

## TABLE `wishgift`
  `ID` width=6 ch,
  `ContactID` width=6 ch,
  `ValYear` width=6 ch,
  `Wish` width=50 ch,
  `Gift` width=255 ch,
  `Anne` width=255 ch,
  `Gerhard` width=255 ch

## TABLE `xbokcategory`
  `CatID` width=6 ch,
  `Category` width=255 ch

## TABLE `xboknation`
  `NatID` width=6 ch,
  `Country` width=50 ch,
  `Citizen` width=50 ch

## TABLE `xbokpublish`
  `PubID` width=6 ch,
  `PublishName` width=50 ch,
  `City` width=50 ch,
  `NatID` width=6 ch

## TABLE `xbokshelf`
  `RackID` width=6 ch,
  `RackName` width=255 ch,
  `NoShelves` width=6 ch

## TABLE `xemballasje`
  `EmbID` width=6 ch,
  `EmbBenevn` width=255 ch

## TABLE `xenhet`
  `EnhID` width=6 ch,
  `Enhet` width=255 ch

## TABLE `xfryseembal`
  `FEmbID` width=6 ch,
  `EmbFork` width=3 ch,
  `Emballasje` width=255 ch

## TABLE `xfrysemat`
  `FryMID` width=6 ch,
  `MatFork` width=3 ch,
  `MatKat` width=255 ch,
  `MatTypeID` width=6 ch,
  `Drikk` checkbox

## TABLE `xfrysemea`
  `FMID` width=6 ch,
  `MeaFork` width=3 ch,
  `MeaNavn` width=255 ch

## TABLE `xfrysetyper`
  `FryTyID` width=6 ch,
  `MatTypeID` width=6 ch,
  `MatType` width=90 ch

## TABLE `xhus`
  `HusID` width=6 ch,
  `HusBenevn` width=255 ch,
  `Sorter` width=6 ch,
  `Bygd` width=255 ch

## TABLE `xinventar`
  `InvTypeID` width=6 ch,
  `InvType` width=255 ch

## TABLE `xlager`
  `LagerID` width=6 ch,
  `lagerBenevn` width=255 ch

## TABLE `xmalbasis`
  `MalBasisID` width=6 ch,
  `MalBasisBenevn` width=255 ch

## TABLE `xmattyper`
  `MatTypeID` width=6 ch,
  `MatType` width=90 ch

## TABLE `xmiddeltype`
  `MiddelTypeID` width=6 ch,
  `MiddelType` width=2 ch,
  `MiddelBeskrivelse` width=255 ch

## TABLE `xplassering`
  `PlassID` width=6 ch,
  `Plassering` width=255 ch,
  `Reserve` checkbox,
  `Middel` checkbox,
  `Utstyr` checkbox,
  `Dok` checkbox,
  `Redsk` checkbox,
  `Inv` checkbox

## TABLE `xrom`
  `RomID` width=6 ch,
  `RomBenevn` width=255 ch

## TABLE `xsted`
  `StedID` width=6 ch,
  `StedBenevn` width=255 ch

## TABLE `xtypeoppskrift`
  `TypRID` width=6 ch,
  `TypeRett` width=50 ch

## TABLE `xuser`
  `user_id` width=6 ch,
  `email` width=90 ch,
  `password` width=90 ch,
  `role` width = 8 ch,
  `created_at` width = 24 ch,
  `IsActive` checkbox,
  `LastUsed`  width = 24 ch

## TABLE `yearlist`
  `ID` width=6 ch,
  `ValYear` width=6 ch
  
## TABLE `zrapporter`
  `ID` width=6 ch,
  `Rapport` width=255 ch,
  `RepNr` width=6 ch,
  `TabNr` width=6 ch,
  `Ibruk` checkbox
