<?php require_once __DIR__ . '/bootstrap.php'; ?>
<?php

if (session_status() === PHP_SESSION_NONE) { session_start(); }

$role_class = 'role-guest';
if (!empty($_SESSION['user_role'])) {
    $role_class = ($_SESSION['user_role'] === 'admin') ? 'role-admin' : 'role-user';
}

$page_class = isset($page_class) && is_string($page_class) ? $page_class : 'page';
$body_class = trim($role_class . ' ' . $page_class);
$page_title = isset($page_title) && is_string($page_title) ? $page_title : 'IhlenWeb';

$BASE = defined('BASE_URL') ? rtrim(BASE_URL, '/') : '';
?>
<!doctype html>
<html lang="no">
<head>
// <link rel="manifest" href="manifest.json"> //
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title><?php echo htmlspecialchars($page_title, ENT_QUOTES, 'UTF-8'); ?></title>
  <link rel="stylesheet" href="<?php echo $BASE; ?>/assets/css/app.css">
</head>
<body<?= !empty($bodyClass) ? ' class="' . htmlspecialchars($bodyClass, ENT_QUOTES, 'UTF-8') . '"' : '' ?>>

<header class="site-header">
  <div class="container">
    <a class="brand" href="<?php echo $BASE; ?>/">
      <img src="<?php echo $BASE; ?>/assets/img/ihlenweb-logo@2x.jpg"
        srcset="<?php echo $BASE; ?>/assets/img/ihlenweb-logo.jpg 1x,
                 <?php echo $BASE; ?>/assets/img/ihlenweb-logo@2x.jpg 2x"
        alt="SkipsWeb" class="logo">
    </a>
  </div>
</header>
