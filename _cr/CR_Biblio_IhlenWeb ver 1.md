# CR_Biblio_IhlenWeb ver 1.md

## Mål
Målet er å utvide innholdt av nettstedet **IhlenWeb** med data om innhold av et biblioteks bøker.

## Rammer
- Følg reglene i `AGENTS.md`.
- Relevante prosjekt-dokumenter:
  + `AGENTS.md`
  + `IhlenWeb_Schema.sql`
  + `includes/functions.php` 
  + Bildefiler i `_basis/docs/` som viser eksempler fra en eksisterende MS Access front-end
  + Alle andre dokumenter i repoet.

- Endringene gjelder eksisterende filer, og kan medføre at nye lages.

## Nåværende oppførsel
Funksjonaliteten eksisterer ikke på det nåværende.

## Ønsket oppførsel
1. Jeg ønsker filer som lager funksjonalitet og layout som følger:
- En side som viser meny. Siden skal helst ha tilsvarende funksjonalitet og lay-out som antydet i `_basis/docs/BokMeny.png`.
- En side som viser bøkene i biblioteket. Siden skal helst ha tilsvarende funksjonalitet og lay-out som antydet i `_basis/docs/Bokliste.png`. Bøkene er i tabellen `bokbook`
- En side som viser detaljene i hver bok, samt plassering i biblioteket. Siden skal helst ha tilsvarende funksjonalitet og lay-out som antydet i `_basis/docs/BokDetaljPlass.png`.
- En side som viser forfatterne og deres bøker i biblioteket. Siden skal helst ha tilsvarende funksjonalitet og lay-out som antydet i `_basis/docs/ForfatterBoker.png`. Forfatterne er i tabellen `bokauthor`. Forfatterens er koblet til sine bøker i tabellen `bokauthorbook`.
- En side som viser kategorienes bøker i biblioteket. Siden skal helst ha tilsvarende funksjonalitet og lay-out som antydet i `_basis/docs/KategoriBoker.png`.
2. Rapporter som antydet i som antydet i `_basis/docs/BokMeny.png`.
3. Viktige parametertabeller er:
-  `xbokcategory`, som inneholder navn på kategorier av bøker
-  `xboknation`, som inneholder navn på nasjoner for utgivere/utgivelse av bøker
-  `xbokpublish`, som inneholder navn på utgivere av bøker
-  `xbokshelf`, som inneholder navn på bokhyller i bruk	
4. Skriv-knappen skal ha samme funksjonalitet som i `user/oppskrifter.php`.
5. Aktivering av funksjoner som gir CRUD-mulighet skal kreve innlogging. En innlogging skal gjelde for hele brukerens sesjon i ihlenweb.

## Gjennomføring
- Les denne CR'en, og still spørsmål om uklarheter, eller mulige logiske tilleggskrav.
- Du har frie hender til å komme med forslag til struktur-endringer, samt utviklingssteg.
- Be om svar, eller, hvis ingen spørsmål, be om å få gå videre.

## Endringer
- `assets/css/app.css` kan oppdateres men uten å endre inneholdet av eksisterende klasser som de eksisterende php-filene inneholder. 
- List konkrete endringer som er gjort i kode eller struktur.
- Spesifiser gjerne i hvilken fil/klasse/SQL-tabell som berøres.

## Test
Hvordan endringen skal verifiseres:
- Lokalt (XAMPP / annen stack).
- Nettlesere / enheter.
- Edge cases.

## Sikkerhet og kvalitet
- Påminnelse om regler fra `AGENTS.md` (escaping, CSS, JS, osv.).

