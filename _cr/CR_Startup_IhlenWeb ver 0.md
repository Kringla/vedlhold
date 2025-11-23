# CR_Startup_IhlenWeb ver 0

## Mål
Målet er å starte utviklingen av et nytt nettsted: **IhlenWeb**

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
- en landingsside med meny-system eksisterer
- en landingsside som ikke krever innlogging
- en landingsside med fire knapper med captions 'Oppskrifter', 'Fryse- og matlager','Vedlikehold', 'Administrasjon'
- Siten har farger i duse toner av hvitt, gult, rødt og blått, passende for en familie.
- at kun brukere i `admin`-rollen kan bruke filer under `admin/`
- en har en meny under `admin/` som gir adgang til legge til, endre og slette parametertabellene.

## Endringer
- Les igjennom eksisterende php-filer. 
- Endre php-filene som nødvendig. 
- `assets/css/app.css` oppdateres til kun å inneholde de klasser som de eksisterende php-filene inneholder. Øvrige klasser slettes. 
- Beskriv hovedtrekkene tema for siten.
- List konkrete endringer som er gjort i kode eller struktur.
- Spesifiser gjerne i hvilken fil/klasse/SQL-tabell.

## Test
Hvordan endringen skal verifiseres:
- Lokalt (XAMPP / annen stack).
- Nettlesere / enheter.
- Edge cases.

## Sikkerhet og kvalitet
- Påminnelse om regler fra `AGENTS.md` (escaping, CSS, JS, osv.).

