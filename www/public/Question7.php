<!DOCTYPE html>
<html>
    <head>
        <title> PROJET BD | Q7 </title>
        <meta charset="utf-8">

        <?php
        include 'index.php';
        global $db ;
        ?>
        
    </head>

    <body>
        <h1> Question 7 </h1>
        <p> Une page sur laquelle un utilisateur peut sélectionner une série. Après avoir sélectionné une série, vous affichez une table avec les “totaux
glissants” de chaque candidat après chaque épisode. I.e., la première ligne correspond aux totaux après le premier épisode, la deuxième
ligne correspond aux totaux après deux épisodes, etc.</p>

            <?php
            $serie = isset($_POST['serie']) ? $_POST['serie'] : null;

// Requête SQL pour récupérer les noms des séries
$query = "SELECT NAME FROM series";
$stmt = $db->query($query);
$series = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Affichage du formulaire de choix de série
echo "<h2>Choisissez une série :</h2>";
echo "<form action='' method='post'>";
echo "<select name='serie'>";
foreach ($series as $s) {
    $selected = ($serie == $s['NAME']) ? "selected" : "";
    echo "<option value='" . $s['NAME'] . "' $selected>" . $s['NAME'] . "</option>";
}
echo "</select>";
echo "<button type='submit'>Afficher le tableau</button>";
echo "</form>";


if ($serie) { 
    // $query = "SELECT p.CANDIDATE_ID, 
    //              e.EPISODE_NUMBER, 
    //              SUM(p.POINTS) AS TOTAL_POINTS, 
    //              pe.LASTNAME, 
    //              pe.FIRSTNAME
    //           FROM points p
    //           JOIN episode e ON p.SERIES_NAME = e.SERIES_NAME AND p.EPISODE_NUMBER <= e.EPISODE_NUMBER
    //           JOIN person pe ON p.CANDIDATE_ID = pe.ID
    //           WHERE p.SERIES_NAME = :serie
    //           GROUP BY p.CANDIDATE_ID, e.EPISODE_NUMBER
    //           ORDER BY (SELECT CHAIR FROM feature WHERE SERIES_NAME = :serie AND CANDIDATE_ID = p.CANDIDATE_ID), e.EPISODE_NUMBER";

    // $query = "SELECT pe.ID, 
    //              e.EPISODE_NUMBER, 
    //              (COALESCE(SUM(tp.POINTS) OVER (PARTITION BY pe.ID ORDER BY e.EPISODE_NUMBER ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 0)) AS TOTAL_POINTS, 
    //              pe.LASTNAME, 
    //              pe.FIRSTNAME
    //           FROM teampoints tp
    //           JOIN membership m ON m.TEAM_ID = tp.TEAM_ID
    //           JOIN episode e ON tp.EPISODE_NUMBER = e.EPISODE_NUMBER
    //           JOIN person pe ON m.CANDIDATE_ID = pe.ID
    //           WHERE tp.SERIES_NAME = :serie
    //           GROUP BY pe.ID, e.EPISODE_NUMBER, pe.LASTNAME, pe.FIRSTNAME
    //           ORDER BY (SELECT CHAIR FROM feature WHERE SERIES_NAME = :serie AND CANDIDATE_ID = pe.ID), e.EPISODE_NUMBER";

    $query = "SELECT EPISODE_NUMBER, CANDIDATE_NAME, 
                     SUM(TOTAL_POINTS) AS TOTAL_POINTS
              FROM ( SELECT 
                        e.EPISODE_NUMBER, 
                        CONCAT(pe.FIRSTNAME, ' ', pe.LASTNAME) AS CANDIDATE_NAME, 
                        SUM(p.POINTS) AS TOTAL_POINTS
                      FROM points p
                      JOIN episode e ON p.SERIES_NAME = e.SERIES_NAME AND p.EPISODE_NUMBER <= e.EPISODE_NUMBER
                      JOIN person pe ON p.CANDIDATE_ID = pe.ID
                      WHERE p.SERIES_NAME = :serie
                      GROUP BY  e.EPISODE_NUMBER, pe.ID
                UNION ALL
                      SELECT e.EPISODE_NUMBER, 
                        CONCAT(pe.FIRSTNAME, ' ', pe.LASTNAME) AS CANDIDATE_NAME, 
                        (COALESCE(SUM(tp.POINTS) OVER (PARTITION BY pe.ID ORDER BY e.EPISODE_NUMBER ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 0)) AS TOTAL_POINTS
                      FROM teampoints tp
                      JOIN membership m ON m.TEAM_ID = tp.TEAM_ID
                      JOIN episode e ON tp.EPISODE_NUMBER = e.EPISODE_NUMBER
                      JOIN person pe ON m.CANDIDATE_ID = pe.ID
                      WHERE tp.SERIES_NAME = :serie
                      GROUP BY e.EPISODE_NUMBER, pe.ID) 
                            AS combined_points
                      GROUP BY EPISODE_NUMBER, CANDIDATE_NAME
                      ORDER BY EPISODE_NUMBER, CANDIDATE_NAME;";

$stmt = $db->prepare($query);
$stmt->execute(array(':serie' => $serie));
$pointsData = $stmt->fetchAll(PDO::FETCH_ASSOC);

$pointsByEpisode = array();

foreach ($pointsData as $row) {
    $episode = $row['EPISODE_NUMBER'];
    $candidateName = $row['CANDIDATE_NAME'];
    $points = $row['TOTAL_POINTS'];

    $pointsByEpisode[$episode][$candidateName] = $points;
}

// Affichage du tableau des points par candidat et par épisode
echo "<h2>Points par candidat et par épisode pour la série '$serie'</h2>";
echo "<table border='1'>";
echo "<tr><th>Épisode</th>";

// En-têtes de colonne avec les noms des candidats
foreach (reset($pointsByEpisode) as $candidateName => $points) {
    echo "<th>$candidateName</th>";
}
echo "</tr>";

// Affichage des points pour chaque épisode
foreach ($pointsByEpisode as $episode => $points) {
    echo "<tr><td>Épisode $episode</td>";

    // Affichage des points pour chaque candidat dans cet épisode
    foreach ($points as $candidateName => $points) {
        echo "<td>$points</td>";
    }
    echo "</tr>";
}
echo "</table>";

    
//     $stmt = $db->prepare($query);
//     $stmt->execute(array(':serie' => $serie));
//     $pointsData = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
//     $pointsByEpisode = array();

//     foreach ($pointsData as $row) {
//         $candidateName = $row['FIRSTNAME'] . ' ' . $row['LASTNAME'];
//         $episode = $row['EPISODE_NUMBER'];
//         $points = $row['TOTAL_POINTS'];

//         $pointsByEpisode[$episode][$candidateName] = $points;
//     }

//     // Affichage du tableau des points par candidat et par épisode
//     echo "<h2>Points par candidat et par épisode pour la série '$serie'</h2>";
//     echo "<table border='1'>";
//     echo "<tr><th>Épisode</th>";
    
//     // En-têtes de colonne avec les noms des candidats
//     foreach (reset($pointsByEpisode) as $candidateName => $points) {
//         echo "<th>$candidateName</th>";
//     }
//     echo "</tr>";

//     // Affichage des points pour chaque épisode
//     foreach ($pointsByEpisode as $episode => $points) {
//         echo "<tr><td>Épisode $episode</td>";
        
//         // Affichage des points pour chaque candidat dans cet épisode
//         foreach ($points as $candidateName => $points) {
//             echo "<td>$points</td>";
//         }
//         echo "</tr>";
//     }
//     echo "</table>";
}
?>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f9;
        color: #333;}
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        text-align : center;}
</style>
    </body>
</html>
        
