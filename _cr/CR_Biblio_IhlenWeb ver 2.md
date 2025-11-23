# CR_Biblio_IhlenWeb ver 1.md

## Mål
Målet er å utvide innholdt av nettstedet **IhlenWeb** med data om innhold av et biblioteks bøker.

## Rammer
- Følg reglene i `AGENTS.md`.
- Relevante prosjekt-dokumenter:
  + `AGENTS.md`
  + `IhlenWeb_Schema.sql` 
  + Bildefiler i `_basis/docs/` som viser eksempler fra en eksisterende MS Access front-end
  + Alle andre dokumenter i repoet.

- Endringene gjelder eksisterende filer, og kan medføre at nye lages.

## Nåværende oppførsel
I `user/bibliotek_detalj.php` mangler tabellen/matrisen som er vist nede til høyre i `_basis/docs/BokDetaljPlass.png`. 

## Ønsket oppførsel
1. Jeg ønsker en slik matrise som i `_basis/docs/BokDetaljPlass.png`, eller en som vist i `_basis/docs/BokMatrix.png`, plassert på et passende sted i `user/bibliotek_detalj.php.
2. Matrisen må tilfredstille det etterfølgende:
- Felles for matrisene er at `BokBook.RackID` (Tittel "Bokhylle" i bildet) avgjør horisontal plassering. `BokBook.RackID` -verdiene er som følger:
	+ 'Vindu1' har verdi = 20
	+ 'Vindu2' har verdi = 21
	+ 'Vindu3' har verdi = 22
	+ 'Åpning2' har verdi = 23
	+ 'Åpning1' har verdi = 24
- I bildet `_basis/docs/BokDetaljPlass.png` er hylle nummeret angitt ved verdien med tittel "Nr (plassering)". Vertikalt er det i dette bildets matrise angitt hylle nummer (`BokBook.ShelfID`) i feltene, mens det i matrisen i `_basis/docs/BokMatrix.png` er "Hylle nr"-kolonnen som angir `BokBook.ShelfID`. 
- I den viste matrisen i `_basis/docs/BokDetaljPlass.png` er det en avmerking som vist med oransje-farget rektangel. Det er ikke et krav at angivelsen av en boks plassering skal være et oransje farget, kravet er en tydelig visuell markering i det relevante feltet. 
Hvis det ikke er angitt for tittelen "Bokhylle" (i bildet) eller tittelen "Nr (plassering)" (i bildet), skal ingen markering vises.

## Gjennomføring
- Les denne CR'en, og still spørsmål om uklarheter, eller mulige logiske tilleggskrav.
- Du har frie hender til å komme med forslag til struktur-endringer, samt utviklingssteg.
- Be om svar, eller, hvis ingen spørsmål, gå videre.

## Endringer
- `assets/css/app.css` skal ikke oppdateres. Nye klasser kan legges inline.
- Spesifiser gjerne i hvhvor inline klasser er lagt.

## Test
Hvordan endringen skal verifiseres:
- Lokalt (XAMPP / annen stack).
- Nettlesere / enheter.
- Edge cases.

## Sikkerhet og kvalitet
- Påminnelse om regler fra `AGENTS.md` (escaping, CSS, JS, osv.).
