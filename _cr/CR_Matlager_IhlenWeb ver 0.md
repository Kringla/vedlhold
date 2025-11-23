# CR_Matlager_IhlenWeb ver 0.md

## Mål
Målet er å utvide innholdt av nettstedet **IhlenWeb** med data om innhold av matlager.

## Rammer
- Følg reglene i `AGENTS.md`.
- Relevante prosjekt-dokumenter:
  - `AGENTS.md`
  - alle andre dokumenter i repoet.

- Endringene gjelder eksisterende filer, og kan medføre at nye lages.

## Nåværende oppførsel
Systemet eksisterer kun i form av et repo med kopier fra andre repoer.

## Ønsket oppførsel
Ønsker å få filer som gjør at:
- En side som viser data fra hovedtabellen `fryseinnhold` med følgende felt/feltbredde/tabeller linked til:
  `ID` int(11)/6 ch/-
  `Navn` varchar(255)/36 ch/-
  `FryMID` int(11)/24 ch(mirror)/xfrysemat
  `FEmbID` int(11)/18 ch(mirror)/xfryseembal
  `Antall` float/6 ch/-
  `FMID` int(11)/12 ch(mirror)/xfrysemea
  `Mengde` float/6 ch/-
  `DatoInn` date/12 ch/-
  `HoldDato` date/12 ch/-
  `Sted` varchar(255)/12 ch/-
  `Merket` varchar(255)/36 ch/-
  `Drikk` bit(1)/checkbox/-
 - Utforming skal være mest mulig lik vedlagte bildefil Matlager0.png, men med opptil 25 rader, med forklaring på felt- og fargebruk som angitt i vedlagte bildefil Matlager1.png (i redusert størrelse).
- Skriv-knappen skal ha samme funksjonalitet som i `user/oppskrifter.php`.
- en har en mulighet i meny under `admin/` som gir CRUD-mulighet.

## Gjennomføring
- Les denne CR'en, og still spørsmål om uklarheter, eller mulige logiske tilleggskrav.
- Be om svar, eller, hvis ingen spørsmål, be om å få gå videre,

## Endringer
- `assets/css/app.css` kan oppdateres men uten å endre inneholdet av eksisterende klasser som de eksisterende php-filene inneholder. 
- List konkrete endringer som er gjort i kode eller struktur.
- Spesifiser gjerne i hvilken fil/klasse/SQL-tabell.

## Test
Hvordan endringen skal verifiseres:
- Lokalt (XAMPP / annen stack).
- Nettlesere / enheter.
- Edge cases.

## Sikkerhet og kvalitet
- Påminnelse om regler fra `AGENTS.md` (escaping, CSS, JS, osv.).

