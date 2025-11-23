<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// index.php - Landingsside for IhlenWeb (familie)
$page_title = 'IhlenWeb';
$page_class = 'home';
$bodyClass  = 'home';

require_once __DIR__ . '/includes/bootstrap.php';
require_once __DIR__ . '/includes/auth.php';
require_once __DIR__ . '/includes/functions.php';

$BASE = defined('BASE_URL') ? rtrim(BASE_URL, '/') : '';

include __DIR__ . '/includes/header.php';
// Ikke vis fanemeny på landingssiden foreløpig
?>

<main class="home-main" aria-labelledby="home-title">
  <div class="container">
    <section class="home-hero">
      <div class="home-hero-content">
        <span class="eyebrow"><?php echo e('Oppgradert uttrykk med marine + gull'); ?></span>
        <h1 id="home-title"><?php echo e('Velkommen til IhlenWeb'); ?></h1>
        <p class="lead"><?php echo e('Familievennlig oversikt, verktøy og arkiv i et maritimt preg inspirert av SMS1835.'); ?></p>
        <div class="home-actions">
          <a class="btn primary" href="#snarveier"><?php echo e('Se snarveier'); ?></a>
          <a class="btn accent" href="<?php echo $BASE; ?>/login.php"><?php echo e('Logg inn'); ?></a>
        </div>
      </div>
    </section>

    <div id="snarveier" class="home-grid" role="navigation" aria-label="Hurtigvalg">
      <a class="tile blue" href="<?php echo $BASE; ?>/user/oppskrifter.php">
        <div class="tile-title"><?php echo e('Oppskrifter'); ?></div>
        <div class="tile-desc"><?php echo e('Husoppskrifter, bakerstykker og favoritter samlet.'); ?></div>
      </a>
      <a class="tile yellow" href="<?php echo $BASE; ?>/user/matlager.php">
        <div class="tile-title"><?php echo e('Fryse- og matlager'); ?></div>
        <div class="tile-desc"><?php echo e('Full oversikt over innhold, holdbarhet og plassering.'); ?></div>
      </a>
      <a class="tile red" href="<?php echo $BASE; ?>/user/bibliotek.php">
        <div class="tile-title"><?php echo e('Bibliotek'); ?></div>
        <div class="tile-desc"><?php echo e('Bøker, noter og referanser du raskt vil finne igjen.'); ?></div>
      </a>
      <a class="tile admin" href="<?php echo $BASE; ?>/admin/">
        <div class="tile-title"><?php echo e('Administrasjon'); ?></div>
        <div class="tile-desc"><?php echo e('Parametre, vedlikehold og trygg datastyring.'); ?></div>
      </a>
    </div>
  </div>
</main>

<?php include __DIR__ . '/includes/footer.php'; ?>
