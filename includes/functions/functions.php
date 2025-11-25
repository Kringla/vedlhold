<?php
function e($string) {
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}
function is_valid_id($id) {
    return ctype_digit(strval($id)) && intval($id) > 0;
}
function isAdmin() {
    return isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'admin';
}

/**
 * URL-helper som respekterer BASE_URL.
 * Eksempel: url('user/fart_soknavn.php')
 */
function url(string $path = ''): string {
    $base = defined('BASE_URL') ? rtrim(BASE_URL, '/') : '';
    return $base . '/' . ltrim($path, '/');
}

if (!function_exists('asset')) {
    /**
     * asset('/assets/img/hero1.jpg')  ->  '/assets/img/hero1.jpg?v=1699999999'
     * Legger på mtime for cache-busting og respekterer BASE_URL.
     */
    function asset(string $path): string {
        $base = defined('BASE_URL') ? rtrim(BASE_URL, '/') : '';
        $rel  = '/' . ltrim($path, '/');
        $fs   = rtrim(__DIR__ . '/..', '/') . $rel; // prosjektrot = includes/..
        $v    = @filemtime($fs);
        return $base . $rel . ($v ? ('?v=' . $v) : '');
    }
}
/* ========================================================================
 * sw_len() – TABELL-UAVHENGIG oppslag basert på feltnavn (IhlenWeb_Fields)
 *  Bruk:
 *    <?= sw_len('Navn') ?>
 *    <?= sw_len('fryseinnhold','Navn') ?>   // tabellargumentet ignoreres
 *
 *  Returnerer en ferdig streng med HTML-attributter:
 *    - tekst/tallfelt:  maxlength="N" size="S" style="max-width: calc(Nch  1.5rem);"
 *    - textarea (width=max): style="max-width: 100%;"
 *    - checkbox: (tom streng)
 *
 *  Deduplisering: forste forekomst vinner basert pa tabellrekkefolgen i _sw_fields_map_tables()
 * ======================================================================== */
if (!function_exists('sw_len')) {
    /**
     * @param string      $fieldOrTable Feltnavn ELLER (bakoverkomp.) et tabellnavn
     * @param string|null $maybeField   Feltnavn hvis to-args brukes (tabell ignoreres)
     * @param array       $opts         Valgfritt: ['sizeCap'=>int] – visuell tak på size (default 60)
     * @return string                   Ferdig HTML-attributtstreng (eller tom for checkbox)
     */
    function sw_len(string $fieldOrTable, ?string $maybeField = null, array $opts = []): string
    {
        $sizeCap = isset($opts['sizeCap']) && is_int($opts['sizeCap']) ? max(1, $opts['sizeCap']) : 60;
        // 1-arg: sw_len('Felt')  |  2-arg: sw_len('tabell','Felt')  (tabell ignoreres)
        $field = $maybeField === null ? trim($fieldOrTable) : trim($maybeField);

        $def = _sw_field_def($field);   // ['kind'=>'cols|max|checkbox','width'=>int|null] | null

        // Ukjent felt → trygg fallback (48)
        if ($def === null) {
            $maxlength = 48;
            $size      = min($maxlength, $sizeCap);
            $style     = 'max-width: calc(' . $maxlength . 'ch + 1.5rem);';
            return 'maxlength="'.$maxlength.'" size="'.$size.'" style="'.$style.'"';
        }

        // Checkbox → ingen lengdeattributter
        if ($def['kind'] === 'checkbox') {
            return '';
        }
        // Store tekstblokker → textarea-stilhint
        if ($def['kind'] === 'max') {
            return 'style="max-width: 100%;"';
        }

        // Vanlige tekst-/tallfelt med kjent bredde (cols)
        $maxlength = is_int($def['width']) ? $def['width'] : 48;
        $size      = min($maxlength, $sizeCap);
        $style     = 'max-width: calc(' . $maxlength . 'ch + 1.5rem);';
        return 'maxlength="'.$maxlength.'" size="'.$size.'" style="'.$style.'"';
    }
}

// -------------------------- interne hjelpere -------------------------------
if (!function_exists('_sw_field_def')) {
    /**
     * Flater ut feltnavn fra relevante tabeller til ett oppslag – første forekomst vinner.
     * Felter flates ut i rekkefolge definert av _sw_fields_map_tables().
     * @return array{kind:string,width:?int}|null
     */
    function _sw_field_def(string $field)
    {
        static $flat = null;
        if ($flat === null) {
            $flat = [];
            $tables = _sw_fields_map_tables();
            foreach ($tables as $cols) {
                foreach ($cols as $fname => $def) {
                    if (!isset($flat[$fname])) {
                        $flat[$fname] = $def;  // forste forekomst vinner
                    }
                }
            }
        }
        return $flat[$field] ?? null;
    }
}

if (!function_exists('_sw_fields_map_tables')) {
    /**
    
     * kind: 'cols' | 'max' | 'checkbox'
     */
    function _sw_fields_map_tables(): array
    {
        return [
            'abonmedlem' => [
                'AbID' => ['kind'=>'cols','width'=>6],
                'AbNavn' => ['kind'=>'cols','width'=>255],
                'AbFirma' => ['kind'=>'cols','width'=>255],
                'AbType' => ['kind'=>'cols','width'=>255],
                'AbTittel' => ['kind'=>'cols','width'=>255],
                'AbAdresse' => ['kind'=>'cols','width'=>255],
                'AbTelf' => ['kind'=>'cols','width'=>255],
                'AbMobil' => ['kind'=>'cols','width'=>255],
                'AbEpost' => ['kind'=>'cols','width'=>255],
                'AbWeb' => ['kind'=>'cols','width'=>255],
                'AbPassord' => ['kind'=>'cols','width'=>255],
                'AbUser' => ['kind'=>'cols','width'=>255],
                'AbBelop' => ['kind'=>'cols','width'=>24],
                'AbValuta' => ['kind'=>'cols','width'=>255],
                'AbPeriode' => ['kind'=>'cols','width'=>255],
                'AbFornyDato' => ['kind'=>'cols','width'=>255],
                'AbSistBetalt' => ['kind'=>'cols','width'=>18],
                'AbAuto' => ['kind'=>'checkbox','width'=>null],
                'AbFastTrekk' => ['kind'=>'checkbox','width'=>null],
                'AbMerknader' => ['kind'=>'cols','width'=>255],
            ],
            'bokauthor' => [
                'AutID' => ['kind'=>'cols','width'=>6],
                'LName' => ['kind'=>'cols','width'=>50],
                'FName' => ['kind'=>'cols','width'=>50],
                'NatID' => ['kind'=>'cols','width'=>6],
                'OldNo' => ['kind'=>'cols','width'=>6],
            ],
            'bokauthorbook' => [
                'AutBookID' => ['kind'=>'cols','width'=>6],
                'BookID' => ['kind'=>'cols','width'=>6],
                'AutID' => ['kind'=>'cols','width'=>6],
            ],
            'bokbook' => [
                'BookID' => ['kind'=>'cols','width'=>6],
                'Title' => ['kind'=>'cols','width'=>255],
                'SubTitle' => ['kind'=>'cols','width'=>255],
                'Series' => ['kind'=>'cols','width'=>6],
                'Abstract' => ['kind'=>'cols','width'=>255],
                'PubYear' => ['kind'=>'cols','width'=>50],
                'EditionNo' => ['kind'=>'cols','width'=>6],
                'ISBN' => ['kind'=>'cols','width'=>50],
                'DateRec' => ['kind'=>'cols','width'=>50],
                'RecFrom' => ['kind'=>'cols','width'=>50],
                'ReadAnne' => ['kind'=>'cols','width'=>255],
                'ReadGerhard' => ['kind'=>'cols','width'=>255],
                'DateLoan' => ['kind'=>'cols','width'=>50],
                'LoanTo' => ['kind'=>'cols','width'=>50],
                'NatID' => ['kind'=>'cols','width'=>6],
                'PubID' => ['kind'=>'cols','width'=>6],
                'CatID' => ['kind'=>'cols','width'=>6],
                'ShelfID' => ['kind'=>'cols','width'=>6],
                'RackNo' => ['kind'=>'cols','width'=>6],
                'PaperBack' => ['kind'=>'checkbox','width'=>null],
                'Flyttet' => ['kind'=>'checkbox','width'=>null],
            ],
            'contacts' => [
                'ContactID' => ['kind'=>'cols','width'=>6],
                'FirstName' => ['kind'=>'cols','width'=>50],
                'LastName' => ['kind'=>'cols','width'=>50],
                'Address' => ['kind'=>'cols','width'=>255],
                'POBox' => ['kind'=>'cols','width'=>50],
                'AreaCode' => ['kind'=>'cols','width'=>20],
                'City' => ['kind'=>'cols','width'=>50],
                'StateOrProvince' => ['kind'=>'cols','width'=>20],
                'PostalCode' => ['kind'=>'cols','width'=>20],
                'Country' => ['kind'=>'cols','width'=>50],
                'EmailName' => ['kind'=>'cols','width'=>50],
                'Birthdate' => ['kind'=>'cols','width'=>15],
                'Engelsk' => ['kind'=>'checkbox','width'=>null],
                'MottattBrev' => ['kind'=>'checkbox','width'=>null],
                'MottattMail' => ['kind'=>'checkbox','width'=>null],
                'MottattKort' => ['kind'=>'checkbox','width'=>null],
                'MottattSMS' => ['kind'=>'checkbox','width'=>null],
                'Julebrev' => ['kind'=>'checkbox','width'=>null],
                'Julekort' => ['kind'=>'checkbox','width'=>null],
                'JuleMail' => ['kind'=>'checkbox','width'=>null],
                'JuleSMS' => ['kind'=>'checkbox','width'=>null],
                'Sent' => ['kind'=>'checkbox','width'=>null],
                'Plural' => ['kind'=>'checkbox','width'=>null],
                'DinDere' => ['kind'=>'cols','width'=>6],
                'IkkeAktuell' => ['kind'=>'checkbox','width'=>null],
                'GaveKandidat' => ['kind'=>'checkbox','width'=>null],
            ],
            'dokumenter' => [
                'DokID' => ['kind'=>'cols','width'=>6],
                'DokFork' => ['kind'=>'cols','width'=>255],
                'DokTittel' => ['kind'=>'cols','width'=>255],
                'Utgitt' => ['kind'=>'cols','width'=>255],
                'Media' => ['kind'=>'cols','width'=>255],
                'Tegning' => ['kind'=>'checkbox','width'=>null],
                'PlassID' => ['kind'=>'cols','width'=>6],
                'ElektronFil' => ['kind'=>'checkbox','width'=>null],
                'DokFil' => ['kind'=>'cols','width'=>255],
                'Merknad' => ['kind'=>'cols','width'=>255],
            ],
            'fryseinnhold' => [
                'ID' => ['kind'=>'cols','width'=>6],
                'Navn' => ['kind'=>'cols','width'=>255],
                'FryMID' => ['kind'=>'cols','width'=>6],
                'FEmbID' => ['kind'=>'cols','width'=>6],
                'Antall' => ['kind'=>'cols','width'=>24],
                'FMID' => ['kind'=>'cols','width'=>6],
                'Mengde' => ['kind'=>'cols','width'=>24],
                'DatoInn' => ['kind'=>'cols','width'=>18],
                'HoldDato' => ['kind'=>'cols','width'=>18],
                'Sted' => ['kind'=>'cols','width'=>255],
                'Merket' => ['kind'=>'cols','width'=>255],
                'Drikk' => ['kind'=>'checkbox','width'=>null],
            ],
            'husrom' => [
                'HusRomID' => ['kind'=>'cols','width'=>6],
                'HusID' => ['kind'=>'cols','width'=>6],
                'RomID' => ['kind'=>'cols','width'=>6],
                'Ute' => ['kind'=>'checkbox','width'=>null],
                'Sorter' => ['kind'=>'cols','width'=>6],
            ],
            'husromsted' => [
                'HusRomStedID' => ['kind'=>'cols','width'=>6],
                'HusRomID' => ['kind'=>'cols','width'=>6],
                'StedID' => ['kind'=>'cols','width'=>6],
                'Ute' => ['kind'=>'checkbox','width'=>null],
                'Sorter' => ['kind'=>'cols','width'=>6],
                'Anlagt' => ['kind'=>'cols','width'=>255],
            ],
            'inventar' => [
                'InvID' => ['kind'=>'cols','width'=>6],
                'InventarNavn' => ['kind'=>'cols','width'=>255],
                'Fabrikat' => ['kind'=>'cols','width'=>255],
                'InvTypeID' => ['kind'=>'cols','width'=>6],
                'StatusBeholdning' => ['kind'=>'cols','width'=>24],
                'StatusDato' => ['kind'=>'cols','width'=>18],
                'AnskaffMetode' => ['kind'=>'cols','width'=>255],
                'AnskaffPris' => ['kind'=>'cols','width'=>6],
                'AnskaffYear' => ['kind'=>'cols','width'=>255],
                'Merknader' => ['kind'=>'cols','width'=>255],
            ],
            'inventarplass' => [
                'InvPlID' => ['kind'=>'cols','width'=>6],
                'InvID' => ['kind'=>'cols','width'=>6],
                'PlassID' => ['kind'=>'cols','width'=>6],
                'Beholdning' => ['kind'=>'cols','width'=>24],
                'Utlaant' => ['kind'=>'checkbox','width'=>null],
                'Merknader' => ['kind'=>'cols','width'=>255],
            ],
            'jobb' => [
                'JobbID' => ['kind'=>'cols','width'=>6],
                'KompID' => ['kind'=>'cols','width'=>6],
                'JobbNavn' => ['kind'=>'cols','width'=>255],
                'JobbBeskrivelse' => ['kind'=>'cols','width'=>255],
                'Male' => ['kind'=>'checkbox','width'=>null],
                'HusID' => ['kind'=>'cols','width'=>6],
                'RomID' => ['kind'=>'cols','width'=>6],
                'StedID' => ['kind'=>'cols','width'=>6],
                'StedElement' => ['kind'=>'cols','width'=>255],
                'HusRomID' => ['kind'=>'cols','width'=>6],
                'HusRomStedID' => ['kind'=>'cols','width'=>6],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'MalID' => ['kind'=>'cols','width'=>6],
                'SekvNr' => ['kind'=>'cols','width'=>6],
                'Ute' => ['kind'=>'checkbox','width'=>null],
                'Intervall' => ['kind'=>'cols','width'=>6],
                'Frist' => ['kind'=>'cols','width'=>18],
                'Startet' => ['kind'=>'checkbox','width'=>null],
                'Ferdig' => ['kind'=>'checkbox','width'=>null],
                'FerdigDato' => ['kind'=>'cols','width'=>18],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'JobbIDPrev' => ['kind'=>'cols','width'=>6],
                'Flag' => ['kind'=>'checkbox','width'=>null],
            ],
            'jobboppd' => [
                'JobbID' => ['kind'=>'cols','width'=>6],
                'KompID' => ['kind'=>'cols','width'=>6],
                'JobbNavn' => ['kind'=>'cols','width'=>255],
                'JobbBeskrivelse' => ['kind'=>'cols','width'=>255],
                'Male' => ['kind'=>'checkbox','width'=>null],
                'HusID' => ['kind'=>'cols','width'=>6],
                'RomID' => ['kind'=>'cols','width'=>6],
                'StedID' => ['kind'=>'cols','width'=>6],
                'StedElement' => ['kind'=>'cols','width'=>255],
                'HusRomID' => ['kind'=>'cols','width'=>6],
                'HusRomStedID' => ['kind'=>'cols','width'=>6],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'MalID' => ['kind'=>'cols','width'=>6],
                'SekvNr' => ['kind'=>'cols','width'=>6],
                'Ute' => ['kind'=>'checkbox','width'=>null],
                'Intervall' => ['kind'=>'cols','width'=>6],
                'Frist' => ['kind'=>'cols','width'=>18],
                'Startet' => ['kind'=>'checkbox','width'=>null],
                'Ferdig' => ['kind'=>'checkbox','width'=>null],
                'FerdigDato' => ['kind'=>'cols','width'=>18],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'JobbIDPrev' => ['kind'=>'cols','width'=>6],
                'Flag' => ['kind'=>'checkbox','width'=>null],
            ],
            'komponent' => [
                'KompID' => ['kind'=>'cols','width'=>6],
                'Trinn' => ['kind'=>'cols','width'=>6],
                'Komponent' => ['kind'=>'cols','width'=>150],
                'KompNr' => ['kind'=>'cols','width'=>255],
                'ParentID' => ['kind'=>'cols','width'=>6],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'Benyttes' => ['kind'=>'checkbox','width'=>null],
                'Lavest' => ['kind'=>'checkbox','width'=>null],
                'SerNr' => ['kind'=>'cols','width'=>6],
                'Flag' => ['kind'=>'checkbox','width'=>null],
            ],
            'malingbrukssted' => [
                'MBSID' => ['kind'=>'cols','width'=>6],
                'Male' => ['kind'=>'checkbox','width'=>null],
                'HusID' => ['kind'=>'cols','width'=>6],
                'RomID' => ['kind'=>'cols','width'=>6],
                'StedID' => ['kind'=>'cols','width'=>6],
                'StedElement' => ['kind'=>'cols','width'=>255],
                'HusRomID' => ['kind'=>'cols','width'=>6],
                'HusRomStedID' => ['kind'=>'cols','width'=>6],
                'MalID' => ['kind'=>'cols','width'=>6],
                'FerdigDato' => ['kind'=>'cols','width'=>18],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'Flag' => ['kind'=>'checkbox','width'=>null],
            ],
            'malingplass' => [
                'MSID' => ['kind'=>'cols','width'=>6],
                'MalID' => ['kind'=>'cols','width'=>6],
                'EnhID' => ['kind'=>'cols','width'=>6],
                'PlassID' => ['kind'=>'cols','width'=>6],
                'Beholdning' => ['kind'=>'cols','width'=>24],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'AnskaffDato' => ['kind'=>'cols','width'=>18],
                'EmbID' => ['kind'=>'cols','width'=>6],
            ],
            'malingslag' => [
                'MalID' => ['kind'=>'cols','width'=>6],
                'MalBasisID' => ['kind'=>'cols','width'=>6],
                'MalingFabrikat' => ['kind'=>'cols','width'=>255],
                'Farge' => ['kind'=>'cols','width'=>255],
                'Blankhet' => ['kind'=>'cols','width'=>255],
                'Fargekode' => ['kind'=>'cols','width'=>255],
                'Ute' => ['kind'=>'checkbox','width'=>null],
                'StatusBeholdning' => ['kind'=>'cols','width'=>24],
                'StatusDato' => ['kind'=>'cols','width'=>18],
                'FraDato' => ['kind'=>'cols','width'=>18],
                'Intervall' => ['kind'=>'cols','width'=>6],
            ],
            'middel' => [
                'MiddelID' => ['kind'=>'cols','width'=>6],
                'MiddelNavn' => ['kind'=>'cols','width'=>255],
                'Fabrikat' => ['kind'=>'cols','width'=>255],
                'MiddelTypeID' => ['kind'=>'cols','width'=>6],
                'EnhetVolum' => ['kind'=>'cols','width'=>255],
                'EnhID' => ['kind'=>'cols','width'=>6],
                'StatusBeholdning' => ['kind'=>'cols','width'=>24],
                'StatusDato' => ['kind'=>'cols','width'=>18],
                'Merknader' => ['kind'=>'cols','width'=>255],
                'FrostFritt' => ['kind'=>'checkbox','width'=>null],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'Forbruks' => ['kind'=>'checkbox','width'=>null],
            ],
            'middelplass' => [
                'MidDetID' => ['kind'=>'cols','width'=>6],
                'MiddelID' => ['kind'=>'cols','width'=>6],
                'PlassID' => ['kind'=>'cols','width'=>6],
                'Beholdning' => ['kind'=>'cols','width'=>24],
                'Utlaant' => ['kind'=>'checkbox','width'=>null],
                'Merknader' => ['kind'=>'cols','width'=>255],
            ],
            'oppskrifter' => [
                'OppskriftID' => ['kind'=>'cols','width'=>6],
                'OppskriftNavn' => ['kind'=>'cols','width'=>50],
                'TypeMat' => ['kind'=>'cols','width'=>50],
                'Ingrediens' => ['kind'=>'cols','width'=>255],
                'ArbInstruks' => ['kind'=>'cols','width'=>255],
                'GraderOvn' => ['kind'=>'cols','width'=>6],
                'TidIOvn' => ['kind'=>'cols','width'=>6],
                'OppskriftLenke' => ['kind'=>'cols','width'=>255],
                'Porsjoner' => ['kind'=>'cols','width'=>255],
                'OppskriftKilde' => ['kind'=>'cols','width'=>255],
                'OppskriftVedlegg' => ['kind'=>'cols','width'=>255],
                'HarVedlegg' => ['kind'=>'checkbox','width'=>null],
                'Nam' => ['kind'=>'cols','width'=>6],
                'SistLaget' => ['kind'=>'cols','width'=>18],
            ],
            'passanne' => [
                'SerID' => ['kind'=>'cols','width'=>6],
                'Product' => ['kind'=>'cols','width'=>50],
                'WebAddr' => ['kind'=>'cols','width'=>255],
                'UserName' => ['kind'=>'cols','width'=>50],
                'CustomerID' => ['kind'=>'cols','width'=>50],
                'SerialNo' => ['kind'=>'cols','width'=>255],
                'Code' => ['kind'=>'cols','width'=>50],
                'OwnEmail' => ['kind'=>'cols','width'=>50],
                'LoginName' => ['kind'=>'cols','width'=>50],
                'Password' => ['kind'=>'cols','width'=>255],
                'PIN' => ['kind'=>'cols','width'=>50],
                'Special' => ['kind'=>'cols','width'=>255],
            ],
            'passgerhard' => [
                'SerID' => ['kind'=>'cols','width'=>6],
                'Product' => ['kind'=>'cols','width'=>50],
                'WebAddr' => ['kind'=>'cols','width'=>255],
                'UserName' => ['kind'=>'cols','width'=>50],
                'CustomerID' => ['kind'=>'cols','width'=>50],
                'SerialNo' => ['kind'=>'cols','width'=>255],
                'Code' => ['kind'=>'cols','width'=>50],
                'OwnEmail' => ['kind'=>'cols','width'=>50],
                'LoginName' => ['kind'=>'cols','width'=>50],
                'Password' => ['kind'=>'cols','width'=>255],
                'PIN' => ['kind'=>'cols','width'=>50],
                'Special' => ['kind'=>'cols','width'=>255],
            ],
            'persutstyr' => [
                'PUID' => ['kind'=>'cols','width'=>6],
                'PUType' => ['kind'=>'cols','width'=>255],
                'PUEier' => ['kind'=>'cols','width'=>24],
                'PUSted' => ['kind'=>'cols','width'=>255],
            ],
            'reservedel' => [
                'DelID' => ['kind'=>'cols','width'=>6],
                'DelNavn' => ['kind'=>'cols','width'=>255],
                'Fabrikat' => ['kind'=>'cols','width'=>255],
                'DelNummer' => ['kind'=>'cols','width'=>255],
                'Spesifikasjon' => ['kind'=>'cols','width'=>255],
                'EnhetVolum' => ['kind'=>'cols','width'=>24],
                'Emballasje' => ['kind'=>'cols','width'=>15],
                'StatusDato' => ['kind'=>'cols','width'=>18],
                'StatusBeholdning' => ['kind'=>'cols','width'=>6],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'Tilbeh' => ['kind'=>'checkbox','width'=>null],
            ],
            'reservedelplass' => [
                'ResPlID' => ['kind'=>'cols','width'=>6],
                'DelID' => ['kind'=>'cols','width'=>6],
                'PlassID' => ['kind'=>'cols','width'=>6],
                'Beholdning' => ['kind'=>'cols','width'=>24],
                'Utlaant' => ['kind'=>'checkbox','width'=>null],
                'Merknader' => ['kind'=>'cols','width'=>255],
            ],
            'service' => [
                'SID' => ['kind'=>'cols','width'=>6],
                'Firma' => ['kind'=>'cols','width'=>255],
                'Adresse' => ['kind'=>'cols','width'=>255],
                'Telefon' => ['kind'=>'cols','width'=>255],
                'Epost' => ['kind'=>'cols','width'=>255],
                'Webadr' => ['kind'=>'cols','width'=>255],
                'Kontakt' => ['kind'=>'cols','width'=>255],
                'Mobil' => ['kind'=>'cols','width'=>255],
                'Kepost' => ['kind'=>'cols','width'=>255],
                'Merknader' => ['kind'=>'cols','width'=>255],
                'Kundenr' => ['kind'=>'cols','width'=>255],
            ],
            'utstyr' => [
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'KompID' => ['kind'=>'cols','width'=>6],
                'Utstyr' => ['kind'=>'cols','width'=>255],
                'Fabrikat' => ['kind'=>'cols','width'=>255],
                'Modell' => ['kind'=>'cols','width'=>255],
                'Serienr' => ['kind'=>'cols','width'=>255],
                'Kapasitet' => ['kind'=>'cols','width'=>255],
                'KravSertifikat' => ['kind'=>'checkbox','width'=>null],
                'Reserve' => ['kind'=>'checkbox','width'=>null],
                'Merknad' => ['kind'=>'cols','width'=>255],
                'Antall' => ['kind'=>'cols','width'=>6],
                'Flag' => ['kind'=>'checkbox','width'=>null],
                'StatusDato' => ['kind'=>'cols','width'=>18],
            ],
            'utstyrdok' => [
                'SerID' => ['kind'=>'cols','width'=>6],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'DokID' => ['kind'=>'cols','width'=>6],
            ],
            'utstyrplass' => [
                'UtstyrPlassID' => ['kind'=>'cols','width'=>6],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'PlassID' => ['kind'=>'cols','width'=>6],
                'Beholdning' => ['kind'=>'cols','width'=>6],
                'Utlaant' => ['kind'=>'checkbox','width'=>null],
                'Merknader' => ['kind'=>'cols','width'=>255],
            ],
            'utstyrreserve' => [
                'SerID' => ['kind'=>'cols','width'=>6],
                'DelID' => ['kind'=>'cols','width'=>6],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
            ],
            'utstyrservice' => [
                'UtstyrSvcID' => ['kind'=>'cols','width'=>6],
                'UtstyrID' => ['kind'=>'cols','width'=>6],
                'SID' => ['kind'=>'cols','width'=>6],
                'Dato' => ['kind'=>'cols','width'=>18],
                'SvcInnhold' => ['kind'=>'cols','width'=>255],
            ],
            'vin' => [
                'VinID' => ['kind'=>'cols','width'=>6],
                'VinType' => ['kind'=>'cols','width'=>255],
                'VinNavn' => ['kind'=>'cols','width'=>255],
                'VinYard' => ['kind'=>'cols','width'=>255],
                'Distrikt' => ['kind'=>'cols','width'=>255],
                'Land' => ['kind'=>'cols','width'=>255],
                'Drue' => ['kind'=>'cols','width'=>255],
                'Vintage' => ['kind'=>'cols','width'=>6],
                'Kommentar' => ['kind'=>'cols','width'=>255],
                'PasserTil' => ['kind'=>'cols','width'=>255],
            ],
            'vwboker' => [
                'BookID' => ['kind'=>'cols','width'=>6],
                'Title' => ['kind'=>'cols','width'=>255],
                'SubTitle' => ['kind'=>'cols','width'=>255],
                'Series' => ['kind'=>'cols','width'=>6],
                'Abstract' => ['kind'=>'cols','width'=>255],
                'PaperBack' => ['kind'=>'checkbox','width'=>null],
                'ShelfID' => ['kind'=>'cols','width'=>6],
                'PubYear' => ['kind'=>'cols','width'=>50],
                'EditionNo' => ['kind'=>'cols','width'=>6],
                'ISBN' => ['kind'=>'cols','width'=>50],
                'NatID' => ['kind'=>'cols','width'=>6],
                'DateRec' => ['kind'=>'cols','width'=>50],
                'RecFrom' => ['kind'=>'cols','width'=>50],
                'LoanTo' => ['kind'=>'cols','width'=>50],
                'ReadAnne' => ['kind'=>'cols','width'=>255],
                'ReadGerhard' => ['kind'=>'cols','width'=>255],
                'DateLoan' => ['kind'=>'cols','width'=>50],
                'PubID' => ['kind'=>'cols','width'=>6],
                'RackNo' => ['kind'=>'cols','width'=>6],
                'CatID' => ['kind'=>'cols','width'=>6],
                'ShelfName' => ['kind'=>'cols','width'=>255],
                'AutID' => ['kind'=>'cols','width'=>6],
                'LName' => ['kind'=>'cols','width'=>50],
                'FName' => ['kind'=>'cols','width'=>50],
            ],
            'wishgift' => [
                'ID' => ['kind'=>'cols','width'=>6],
                'ContactID' => ['kind'=>'cols','width'=>6],
                'ValYear' => ['kind'=>'cols','width'=>6],
                'Wish' => ['kind'=>'cols','width'=>50],
                'Gift' => ['kind'=>'cols','width'=>255],
                'Anne' => ['kind'=>'cols','width'=>255],
                'Gerhard' => ['kind'=>'cols','width'=>255],
            ],
            'xbokcategory' => [
                'CatID' => ['kind'=>'cols','width'=>6],
                'Category' => ['kind'=>'cols','width'=>255],
            ],
            'xboknation' => [
                'NatID' => ['kind'=>'cols','width'=>6],
                'Country' => ['kind'=>'cols','width'=>50],
                'Citizen' => ['kind'=>'cols','width'=>50],
            ],
            'xbokpublish' => [
                'PubID' => ['kind'=>'cols','width'=>6],
                'PublishName' => ['kind'=>'cols','width'=>50],
                'City' => ['kind'=>'cols','width'=>50],
                'NatID' => ['kind'=>'cols','width'=>6],
            ],
            'xbokshelf' => [
                'ShelfID' => ['kind'=>'cols','width'=>6],
                'ShelfName' => ['kind'=>'cols','width'=>255],
                'NoShelves' => ['kind'=>'cols','width'=>6],
            ],
            'xemballasje' => [
                'EmbID' => ['kind'=>'cols','width'=>6],
                'EmbBenevn' => ['kind'=>'cols','width'=>255],
            ],
            'xenhet' => [
                'EnhID' => ['kind'=>'cols','width'=>6],
                'Enhet' => ['kind'=>'cols','width'=>255],
            ],
            'xfryseembal' => [
                'FEmbID' => ['kind'=>'cols','width'=>6],
                'EmbFork' => ['kind'=>'cols','width'=>3],
                'Emballasje' => ['kind'=>'cols','width'=>255],
            ],
            'xfrysemat' => [
                'FryMID' => ['kind'=>'cols','width'=>6],
                'MatFork' => ['kind'=>'cols','width'=>3],
                'MatKat' => ['kind'=>'cols','width'=>255],
                'MatTypeID' => ['kind'=>'cols','width'=>6],
                'Drikk' => ['kind'=>'checkbox','width'=>null],
            ],
            'xfrysemea' => [
                'FMID' => ['kind'=>'cols','width'=>6],
                'MeaFork' => ['kind'=>'cols','width'=>3],
                'MeaNavn' => ['kind'=>'cols','width'=>255],
            ],
            'xfrysetyper' => [
                'FryTyID' => ['kind'=>'cols','width'=>6],
                'MatTypeID' => ['kind'=>'cols','width'=>6],
                'MatType' => ['kind'=>'cols','width'=>90],
            ],
            'xhus' => [
                'HusID' => ['kind'=>'cols','width'=>6],
                'HusBenevn' => ['kind'=>'cols','width'=>255],
                'Sorter' => ['kind'=>'cols','width'=>6],
                'Bygd' => ['kind'=>'cols','width'=>255],
            ],
            'xinventar' => [
                'InvTypeID' => ['kind'=>'cols','width'=>6],
                'InvType' => ['kind'=>'cols','width'=>255],
            ],
            'xlager' => [
                'LagerID' => ['kind'=>'cols','width'=>6],
                'lagerBenevn' => ['kind'=>'cols','width'=>255],
            ],
            'xmalbasis' => [
                'MalBasisID' => ['kind'=>'cols','width'=>6],
                'MalBasisBenevn' => ['kind'=>'cols','width'=>255],
            ],
            'xmattyper' => [
                'MatTypeID' => ['kind'=>'cols','width'=>6],
                'MatType' => ['kind'=>'cols','width'=>90],
            ],
            'xmiddeltype' => [
                'MiddelTypeID' => ['kind'=>'cols','width'=>6],
                'MiddelType' => ['kind'=>'cols','width'=>2],
                'MiddelBeskrivelse' => ['kind'=>'cols','width'=>255],
            ],
            'xplassering' => [
                'PlassID' => ['kind'=>'cols','width'=>6],
                'Plassering' => ['kind'=>'cols','width'=>255],
                'Reserve' => ['kind'=>'checkbox','width'=>null],
                'Middel' => ['kind'=>'checkbox','width'=>null],
                'Utstyr' => ['kind'=>'checkbox','width'=>null],
                'Dok' => ['kind'=>'checkbox','width'=>null],
                'Redsk' => ['kind'=>'checkbox','width'=>null],
                'Inv' => ['kind'=>'checkbox','width'=>null],
            ],
            'xrom' => [
                'RomID' => ['kind'=>'cols','width'=>6],
                'RomBenevn' => ['kind'=>'cols','width'=>255],
            ],
            'xsted' => [
                'StedID' => ['kind'=>'cols','width'=>6],
                'StedBenevn' => ['kind'=>'cols','width'=>255],
            ],
            'xtypeoppskrift' => [
                'TypRID' => ['kind'=>'cols','width'=>6],
                'TypeRett' => ['kind'=>'cols','width'=>50],
            ],
            'xuser' => [
                'user_id' => ['kind'=>'cols','width'=>6],
                'email' => ['kind'=>'cols','width'=>90],
                'password' => ['kind'=>'cols','width'=>90],
                'role' => ['kind'=>'cols','width'=>8],
                'created_at' => ['kind'=>'cols','width'=>24],
                'IsActive' => ['kind'=>'checkbox','width'=>null],
                'LastUsed' => ['kind'=>'cols','width'=>24],
            ],
            'yearlist' => [
                'ID' => ['kind'=>'cols','width'=>6],
                'ValYear' => ['kind'=>'cols','width'=>6],
            ],
            'zrapporter' => [
                'ID' => ['kind'=>'cols','width'=>6],
                'Rapport' => ['kind'=>'cols','width'=>255],
                'RepNr' => ['kind'=>'cols','width'=>6],
                'TabNr' => ['kind'=>'cols','width'=>6],
                'Ibruk' => ['kind'=>'checkbox','width'=>null],
            ],
        ];
    }
}
