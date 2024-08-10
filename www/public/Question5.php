<!DOCTYPE html>
<html>
    <head>
        <title> PROJET BD | Q5 </title>
        <meta charset="utf-8">

        <?php
        include 'index.php';
        global $db ;
        ?>
    </head>

    <body>
        <h1> Question 5 </h1>
        <p> Une page où vous affichez, à l'aide d’un table, les statistiques de chaque candidat. Les statistiques doivent contenir le pourcentage de 0, 1,
2, 3, 4 et 5 points que le candidat à obtenu, ainsi que la moyenne des ses points. Un utilisateur doit pouvoir choisir la colonne dans laquelle
le tableau est classé. L'ordre et les statistiques doivent être calculés par le système de gestion de base de données.</p>

        <section>
            <?php


function fetchCandidateStats($db, $order = 'ID', $asc = 'ASC') {
    $validOrders = ['ID', 'FIRSTNAME', 'LASTNAME', 'average_points', 'percent_0', 'percent_1', 'percent_2', 'percent_3', 'percent_4', 'percent_5'];
    $order = in_array($order, $validOrders) ? $order : 'ID';
    $asc = $asc === 'ASC' ? 'ASC' : 'DESC';

    $sql = "SELECT 
                p.ID, 
                p.FIRSTNAME, 
                p.LASTNAME,
                AVG(pts.POINTS) AS average_points,
                ROUND(SUM(CASE WHEN pts.POINTS = 0 THEN 1 ELSE 0 END) / COUNT(pts.POINTS) * 100, 2) AS percent_0,
                ROUND(SUM(CASE WHEN pts.POINTS = 1 THEN 1 ELSE 0 END) / COUNT(pts.POINTS) * 100, 2) AS percent_1,
                ROUND(SUM(CASE WHEN pts.POINTS = 2 THEN 1 ELSE 0 END) / COUNT(pts.POINTS) * 100, 2) AS percent_2,
                ROUND(SUM(CASE WHEN pts.POINTS = 3 THEN 1 ELSE 0 END) / COUNT(pts.POINTS) * 100, 2) AS percent_3,
                ROUND(SUM(CASE WHEN pts.POINTS = 4 THEN 1 ELSE 0 END) / COUNT(pts.POINTS) * 100, 2) AS percent_4,
                ROUND(SUM(CASE WHEN pts.POINTS = 5 THEN 1 ELSE 0 END) / COUNT(pts.POINTS) * 100, 2) AS percent_5
            FROM person p
            JOIN points pts ON p.ID = pts.CANDIDATE_ID
            GROUP BY p.ID
            ORDER BY $order $asc";

    $stmt = $db->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$order = $_GET['order'] ?? 'ID'; // Default order
$asc = $_GET['asc'] ?? 'ASC'; // Default order direction
$candidates = fetchCandidateStats($db, $order, $asc);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Statistiques des Candidats</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            color: white;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Statistiques des Candidats</h1>
    <table>
        <tr>
            <?php
            $headers = ['ID' => 'ID', 'FIRSTNAME' => 'Prénom', 'LASTNAME' => 'Nom', 'average_points' => 'Moyenne des Points', 'percent_0' => '% de 0 pts', 'percent_1' => '% de 1 pt', 'percent_2' => '% de 2 pts', 'percent_3' => '% de 3 pts', 'percent_4' => '% de 4 pts', 'percent_5' => '% de 5 pts'];
            foreach ($headers as $key => $value) {
                $newAsc = ($order == $key && $asc == 'ASC') ? 'DESC' : 'ASC';
                echo "<th><a href='?order=$key&asc=$newAsc'>$value</a></th>";
            }
            ?>
        </tr>
        <?php foreach ($candidates as $candidate): ?>
        <tr>
            <?php
            foreach ($headers as $key => $value) {
                echo "<td>{$candidate[$key]}</td>";
            }
            ?>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>


