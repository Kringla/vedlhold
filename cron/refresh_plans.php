<?php
require_once __DIR__ . '/../includes/bootstrap.php';
require_once __DIR__ . '/../includes/functions/maintenance.php';

vedlhold_refresh_all_plans($db);

echo "Vedlikeholdsplaner oppdatert: " . date('Y-m-d H:i:s');
