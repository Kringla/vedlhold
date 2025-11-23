<?php
define('DB_HOST', 'hostmaster.onnet.no');
define('DB_NAME', 'gerhard_vedlhold'); // navnet du valgte i phpMyAdmin
define('DB_USER', 'gerhard_vedlhadmin');     // standardbruker i XAMPP
define('DB_PASSWORD', '1Gondor!');     // XAMPP root har vanligvis ingen passord

$conn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if ($conn->connect_error) {
    die("Tilkobling mislyktes: " . $conn->connect_error);
}
$conn->set_charset('UTF-8');
?>