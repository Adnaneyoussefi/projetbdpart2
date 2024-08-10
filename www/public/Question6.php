<!DOCTYPE html>
<html>
<head>
    <title> PROJET BD | Q6 </title>
    <meta charset="utf-8">
    <?php include 'index.php'; ?>

    <style>
    table {
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid black;
      padding: 5px;
    }
  </style>
</head>

<body>
    <h1> Question 6 </h1>
    <p> Une page où vous pouvez sélectionner un épisode (vous pouvez utiliser une liste déroulante). Après une sélection d'un épisode, après avoir
sélectionné un épisode, l'utilisateur voit une table où, pour chaque tâche, vous montrez les points obtenus par chaque candidat. Vous devez
respecter l'ordre des chaises. Le tableau doit se terminer par une ligne contenant les totaux. Ces totaux peuvent être obtenus avec une
requête séparée, mais vous pouvez également utiliser ROLLUP pour créer une ligne supplémentaire avec des totaux dans le jeu de résultats.
Il n'est pas nécessaire de prendre en compte les disqualifications.</p>

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

    <section>
        <?php
        global $db;

//liste episode avec la serie en particulier, le num d'episode et son titre
$sql_episodes = "SELECT DISTINCT SERIES_NAME, EPISODE_NUMBER, TITLE 
                 FROM episode 
                 ORDER BY SERIES_NAME, EPISODE_NUMBER";
$result_episodes = $db->query($sql_episodes);

// traite la soumission du formulaire
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $selected_episode = explode(",", $_POST["episode"]);
  $series_name = $selected_episode[0];
  $episode_number = $selected_episode[1];

    // obtention des points des candidats par tâche pour l'épisode selectionne dans le formulaire.
    // ici, on va d'abord selectionner le numero de la tache et la description de la tache.
    // jointure gauche entre table task et et table points
    // jointure gauche entre table feature et table points
    // jointure gauche entre table personne et table feature

    // esnuite, pour chaque chaise on concat le prenom et le nom de la personne en question. Verification chaise est bien la bonne sinon on renvoit NULL. PMeme principe pr les points
    // puis on filtre les resultats en fction du nom de la serie et du numero d'episode. On groupe par numero de task et par la decription pour avoir qu'une seule ligne a chaque fois.

  $sql_points = "SELECT t.TASK_NUMBER, t.DESCRIPTION, 
                   MAX(CASE WHEN f.CHAIR = 1 THEN CONCAT(p.FIRSTNAME, ' ', p.LASTNAME) ELSE NULL END) AS 'Chair 1',
                   MAX(CASE WHEN f.CHAIR = 1 THEN pts.POINTS ELSE NULL END) AS 'Points 1',
                   MAX(CASE WHEN f.CHAIR = 2 THEN CONCAT(p.FIRSTNAME, ' ', p.LASTNAME) ELSE NULL END) AS 'Chair 2',
                   MAX(CASE WHEN f.CHAIR = 2 THEN pts.POINTS ELSE NULL END) AS 'Points 2',
                   MAX(CASE WHEN f.CHAIR = 3 THEN CONCAT(p.FIRSTNAME, ' ', p.LASTNAME) ELSE NULL END) AS 'Chair 3',
                   MAX(CASE WHEN f.CHAIR = 3 THEN pts.POINTS ELSE NULL END) AS 'Points 3',
                   MAX(CASE WHEN f.CHAIR = 4 THEN CONCAT(p.FIRSTNAME, ' ', p.LASTNAME) ELSE NULL END) AS 'Chair 4',
                   MAX(CASE WHEN f.CHAIR = 4 THEN pts.POINTS ELSE NULL END) AS 'Points 4',
                   MAX(CASE WHEN f.CHAIR = 5 THEN CONCAT(p.FIRSTNAME, ' ', p.LASTNAME) ELSE NULL END) AS 'Chair 5',
                   MAX(CASE WHEN f.CHAIR = 5 THEN pts.POINTS ELSE NULL END) AS 'Points 5'
                FROM TASK t
                LEFT JOIN POINTS pts ON t.SERIES_NAME = pts.SERIES_NAME AND t.EPISODE_NUMBER = pts.EPISODE_NUMBER AND t.TASK_NUMBER = pts.TASK_NUMBER   
                LEFT JOIN FEATURE f ON pts.CANDIDATE_ID = f.CANDIDATE_ID AND t.SERIES_NAME = f.SERIES_NAME
                LEFT JOIN PERSON p ON f.CANDIDATE_ID = p.ID
                WHERE t.SERIES_NAME = '$series_name' AND t.EPISODE_NUMBER = $episode_number
                GROUP BY t.TASK_NUMBER, t.DESCRIPTION";
  $result_points = $db->query($sql_points);

  //requete pour avoir totaux des pts.
  // jointure entre table feature et table points pr lier les candidats aux chaises
  // pr chaque chaise, on attribue les points. SUM pour somme des pts de chaque chaise.

  $sql_totals = "SELECT 
                   SUM(CASE WHEN f.CHAIR = 1 THEN pts.POINTS ELSE 0 END) AS 'Points 1',
                   SUM(CASE WHEN f.CHAIR = 2 THEN pts.POINTS ELSE 0 END) AS 'Points 2',
                   SUM(CASE WHEN f.CHAIR = 3 THEN pts.POINTS ELSE 0 END) AS 'Points 3',
                   SUM(CASE WHEN f.CHAIR = 4 THEN pts.POINTS ELSE 0 END) AS 'Points 4',
                   SUM(CASE WHEN f.CHAIR = 5 THEN pts.POINTS ELSE 0 END) AS 'Points 5'
                FROM POINTS pts
                LEFT JOIN FEATURE f ON pts.CANDIDATE_ID = f.CANDIDATE_ID
                WHERE pts.SERIES_NAME = '$series_name' AND pts.EPISODE_NUMBER = $episode_number";
  $result_totals = $db->query($sql_totals);
  $row_totals = $result_totals->fetch(PDO::FETCH_ASSOC);
}

?>
  </section>
  <title>Points par tâche et candidat</title>
  <h2>Sélectionnez un épisode :</h2>
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <select name="episode">
      <?php
      //boucle pour parcourir les résultats
        while($row = $result_episodes->fetch(PDO::FETCH_ASSOC)) {
          $episode = $row["SERIES_NAME"] . "," . $row["EPISODE_NUMBER"];
          $label = $row["SERIES_NAME"] . " - Episode " . $row["EPISODE_NUMBER"] . " - " . $row["TITLE"];
          echo "<option value='$episode'>$label</option>";
        }
      ?>
    </select>
    <input type="submit" value="Afficher les points">
  </form> 
  <br>

  <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      echo "<h2>Points par tâche pour $series_name - Episode $episode_number</h2>";
      if ($result_points->rowCount() > 0){ // changement code loan
        echo "<table>
        <tr>
          <th>Tâche</th>
          <th>Description</th>
          <th>Chaise 1</th>
          <th>Points</th>
          <th>Chaise 2</th>
          <th>Points</th>
          <th>Chaise 3</th>
          <th>Points</th>
          <th>Chaise 4</th>
          <th>Points</th>
          <th>Chaise 5</th>
          <th>Points</th>
        </tr>";
    
        while($row = $result_points->fetch(PDO::FETCH_ASSOC)) {
          echo "<tr>";
          echo "<td>" . $row['TASK_NUMBER'] . "</td>";
          echo "<td>" . $row['DESCRIPTION'] . "</td>";
          echo "<td>" . $row['Chair 1'] . "</td>";
          echo "<td>" . $row['Points 1'] . "</td>";
          echo "<td>" . $row['Chair 2'] . "</td>";
          echo "<td>" . $row['Points 2'] . "</td>";
          echo "<td>" . $row['Chair 3'] . "</td>";
          echo "<td>" . $row['Points 3'] . "</td>";
          echo "<td>" . $row['Chair 4'] . "</td>";
          echo "<td>" . $row['Points 4'] . "</td>";
          echo "<td>" . $row['Chair 5'] . "</td>";
          echo "<td>" . $row['Points 5'] . "</td>";
          echo "</tr>";
        }
    
        echo "<tr>
                <td colspan='2'>TOTAL</td>
                <td colspan='2'>" . $row_totals['Points 1'] . "</td>
                <td colspan='2'>" . $row_totals['Points 2'] . "</td>
                <td colspan='2'>" . $row_totals['Points 3'] . "</td>
                <td colspan='2'>" . $row_totals['Points 4'] . "</td>
                <td colspan='2'>" . $row_totals['Points 5'] . "</td>
              </tr>";
    
        echo "</table>";
      } else {
        echo "Aucune tâche trouvée pour cet épisode.";
      }
    }    
  ?>
</body>
</html>