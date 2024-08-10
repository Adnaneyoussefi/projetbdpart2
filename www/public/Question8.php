<!DOCTYPE html>
<html>
    <head>
        <title> PROJET BD | Q8 </title>
        <meta charset="utf-8">

        <?php
        include 'index.php';
        global $db ;
        ?>
    </head>

    <body>
        <h1> Question 8 </h1>
        <p> Une page où l'on affiche, pour chaque personne (!), le nombre d'épisodes gagnés par cette personne ainsi que la liste des épisodes gagnés
par cette personne. Vous pouvez utiliser GROUP_CONCAT pour la création de cette liste.</p>

        <section>
            <?php

            $query = 
            "SELECT pe.ID, pe.FIRSTNAME, pe.LASTNAME, f.SERIES_NAME,
            COUNT(ep.WINNER_ID) AS EPISODES_WON,
            GROUP_CONCAT(CONCAT(ep.SERIES_NAME, ' - ', ep.EPISODE_NUMBER, ': ', ep.TITLE) SEPARATOR ', ') AS EPISODES_WON_LIST
            FROM person pe
            LEFT JOIN episode ep ON pe.ID = ep.WINNER_ID
            LEFT JOIN feature f ON f.CANDIDATE_ID = pe.ID
            GROUP BY pe.ID, pe.FIRSTNAME, pe.LASTNAME
            ORDER BY f.SERIES_NAME, pe.LASTNAME, pe.FIRSTNAME";

$stmt = $db->query($query);
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo "<table border='1'>";
echo "<tr><th>ID</th><th>Prénom</th><th>Nom</th><th>Épisodes gagnés</th><th>Liste des épisodes gagnés</th></tr>";
foreach ($results as $row) {
    echo "<tr>";
    echo "<td>" . $row['ID'] . "</td>";
    echo "<td>" . $row['FIRSTNAME'] . "</td>";
    echo "<td>" . $row['LASTNAME'] . "</td>";
    echo "<td>" . $row['EPISODES_WON'] . "</td>";
    echo "<td>" . $row['EPISODES_WON_LIST'] . "</td>";
    echo "</tr>";
}
echo "</table>";
?>

</section>
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
        text-align : justify;}
</style>
</body>
</html>