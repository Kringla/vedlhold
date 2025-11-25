<?php

require_once __DIR__ . '/../bootstrap.php';

/**
 * Beregner neste forfallsdato
 */
function vedlhold_calculate_next_due($lastDate, $intervalYears) {
    if (!$lastDate || !$intervalYears) {
        return null;
    }

    $d = new DateTime($lastDate);
    $d->modify("+{$intervalYears} year");
    return $d->format('Y-m-d');
}

/**
 * Oppdaterer vedlikeholdsplan etter at en jobb fullføres
 */
function vedlhold_update_plan_after_job($jobId, $db) {

    // Hent jobben
    $stmt = $db->prepare("
        SELECT JobbID, ObjektID, DatoFerdig, Status
        FROM vedlikeholdjobb
        WHERE JobbID = ?
    ");
    $stmt->execute([$jobId]);
    $job = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$job) {
        return false;
    }
    if ($job['Status'] !== 'Fullført') {
        return false;
    }
    if (!$job['DatoFerdig']) {
        return false;
    }

    // Finn tilhørende plan
    $stmt = $db->prepare("
        SELECT PlanID, IntervallAar 
        FROM vedlikeholdplan
        WHERE ObjektID = ?
        LIMIT 1
    ");
    $stmt->execute([$job['ObjektID']]);
    $plan = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$plan) {
        return false; // ingen plan tilknyttet objektet
    }

    $nextDue = vedlhold_calculate_next_due($job['DatoFerdig'], $plan['IntervallAar']);

    // Oppdater plan
    $stmt = $db->prepare("
        UPDATE vedlikeholdplan
        SET 
            SistUtført = ?,
            NesteForfall = ?
        WHERE PlanID = ?
    ");

    return $stmt->execute([
        $job['DatoFerdig'],
        $nextDue,
        $plan['PlanID']
    ]);
}


/**
 * Oppdater ALLE planer (cron-jobb)
 */
function vedlhold_refresh_all_plans($db) {

    $stmt = $db->query("
        SELECT PlanID, IntervallAar, SistUtført
        FROM vedlikeholdplan
    ");

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

        // Mangler nødvendig data
        if (!$row['IntervallAar'] || !$row['SistUtført']) {
            continue;
        }

        $next = vedlhold_calculate_next_due($row['SistUtført'], $row['IntervallAar']);

        $u = $db->prepare("
            UPDATE vedlikeholdplan
            SET NesteForfall = ?
            WHERE PlanID = ?
        ");
        $u->execute([$next, $row['PlanID']]);
    }
}

?>
