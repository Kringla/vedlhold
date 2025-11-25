<?php
require_once __DIR__ . '/../includes/bootstrap.php';
require_once __DIR__ . '/../includes/functions/maintenance.php';

$jobId = $_GET['id'] ?? null;

if (!$jobId) {
    die("Mangler JobbID");
}

// Sett status til fullført
$stmt = $db->prepare("
    UPDATE vedlikeholdjobb
    SET Status='Fullført'
    WHERE JobbID=?
");
$stmt->execute([$jobId]);

// Oppdater plan
vedlhold_update_plan_after_job($jobId, $db);

// Redirect
header("Location: /jobs/view.php?id={$jobId}");
exit;
