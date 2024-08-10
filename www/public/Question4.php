<!DOCTYPE html>
<html>
<head>
    <title> PROJET BD | Q4 </title>
    <meta charset="utf-8">
    <?php include 'index.php'; ?>
</head>

<body>
    <h1> Question 4 </h1>
    <p> Une page où vous pouvez sélectionner un épisode (vous pouvez utiliser une liste déroulante). Après une sélection d'un épisode, un
utilisateur se voit présenter deux formulaires. Le premier nous permet de mettre à jour les informations d'un épisode (date, titre, etc.). Le
deuxième nous permet de définir ou de mettre à jour le gagnant d'un épisode. Le gagnant d'un épisode est celui qui a le plus de points ou
qui a remporté la tâche d'égalité. Cette page contient également un formulaire pour ajouter de nouveaux épisodes à une série qui n'est pas
encore terminée (i.e., une série qui n'a pas de champion).</p>

    <section>
        <?php
        global $db;

        // liste episode avec nom serie, numeo et titre
        $sql = "SELECT SERIES_NAME, EPISODE_NUMBER, TITLE FROM episode";
        $result = $db->query($sql);

        // formulaire
        echo "<form method='post'>";
        echo "<select name='episode'>";
        echo "<option value=''>Sélectionnez un épisode</option>";
        while($row = $result->fetch(PDO::FETCH_ASSOC)) {
            echo "<option value='" . $row["SERIES_NAME"] . "," . $row["EPISODE_NUMBER"] . "'>" . $row["SERIES_NAME"] . " - Episode " . $row["EPISODE_NUMBER"] . " - " . $row["TITLE"] . "</option>";
        }
        echo "</select>";
        echo "<input type='submit' value='Sélectionner'>";
        echo "</form>";

        // ne s'affiche que si un episode est selectionne
        if(isset($_POST['episode']) && $_POST['episode'] !== ''){
            $episode = explode(",", $_POST['episode']);
            $series_name = $episode[0];
            $episode_number = $episode[1];

            //formulaire maj episode
            echo "<h2>Mettre à jour les informations de l'épisode</h2>";
            echo "<form method='post'>"; //methode post car modif
            echo "<input type='hidden' name='series_name' value='" . $series_name . "'>";
            echo "<input type='hidden' name='episode_number' value='" . $episode_number . "'>";
            echo "Titre: <input type='text' name='title'><br>";
            echo "Date de diffusion: <input type='date' name='airdate'><br>";
            echo "<input type='submit' name='update_episode' value='Mettre à jour'>";
            echo "</form>";

            // maj gagnant
            echo "<h2>Définir/mettre à jour le gagnant de l'épisode</h2>";
            echo "<form method='post'>";
            echo "<input type='hidden' name='series_name' value='" . $series_name . "'>";
            echo "<input type='hidden' name='episode_number' value='" . $episode_number . "'>";

            // liste candidats (en fction des points)
            $sql = "SELECT c.ID, p.FIRSTNAME, p.LASTNAME,
                        COALESCE(SUM(po.POINTS), 0) + COALESCE(SUM(tp.POINTS), 0) AS TOTAL_POINTS
                    FROM CANDIDATE c
                    JOIN PERSON p ON c.ID = p.ID
                    JOIN MEMBERSHIP m ON c.ID = m.CANDIDATE_ID
                    JOIN TEAM t ON m.TEAM_ID = t.ID AND t.SERIES_NAME = ?
                    LEFT JOIN POINTS po ON c.ID = po.CANDIDATE_ID
                                                AND po.SERIES_NAME = ?
                                                AND po.EPISODE_NUMBER = ?
                    LEFT JOIN TEAMPOINTS tp ON m.TEAM_ID = tp.TEAM_ID
                                                        AND tp.SERIES_NAME = ?
                                                        AND tp.EPISODE_NUMBER = ?
                    GROUP BY c.ID
                    ORDER BY TOTAL_POINTS DESC";

            $stmt = $db->prepare($sql);
            $stmt->bindParam(1, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(2, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(3, $episode_number, PDO::PARAM_INT);
            $stmt->bindParam(4, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(5, $episode_number, PDO::PARAM_INT);
           
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // ID candidat avec le + de points
            $winner_id = null;
            if (!empty($result)) {
                $winner_id = $result[0]["ID"];
            }

            // verifie si il y a eu une tache d'egalite
            $sql = "SELECT tr.CANDIDATE_ID
                    FROM TIEBREAKERRESULT tr
                    WHERE tr.SERIES_NAME = ?
                        AND tr.EPISODE_NUMBER = ?
                        AND tr.WON = 1
                    LIMIT 1";

            $stmt = $db->prepare($sql);
            $stmt->bindParam(1, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(2, $episode_number, PDO::PARAM_INT);
            $stmt->execute();
            $tiebreaker_row = $stmt->fetch(PDO::FETCH_ASSOC);

            //si gagnant de la tache d'egalite, devient le winner
            if ($tiebreaker_row) {
                $winner_id = $tiebreaker_row["CANDIDATE_ID"];
            }

            echo "Gagnant: <select name='winner_id'>";
            foreach ($result as $row) {
                $selected = ($row["ID"] == $winner_id) ? "selected" : "";
                echo "<option value='" . $row["ID"] . "' $selected>" . $row["FIRSTNAME"] . " " . $row["LASTNAME"] . "</option>";
            }    
            echo "</select><br>";
            echo "<input type='submit' name='update_winner' value='Définir gagnant'>";
            echo "</form>";
        }

        // si formulaire soumis => MAJ dans table pr episodes
        if(isset($_POST['update_episode'])){
            $series_name = $_POST['series_name'];
            $episode_number = $_POST['episode_number'];
            $title = $_POST['title'];
            $airdate = $_POST['airdate'];

            $sql = "UPDATE EPISODE SET TITLE=?, AIRDATE=?
                    WHERE SERIES_NAME=? AND EPISODE_NUMBER=?";
            
            $stmt = $db->prepare($sql);
            $stmt->bindParam(1, $title, PDO::PARAM_STR);
            $stmt->bindParam(2, $airdate, PDO::PARAM_STR);
            $stmt->bindParam(3, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(4, $episode_number, PDO::PARAM_INT);

            if ($stmt->execute()) {
                echo "Informations de l'épisode mises à jour avec succès";
            } else {
                echo "Erreur lors de la mise à jour des informations de l'épisode: " . $stmt->errorInfo()[2];
            }
        }

        // si formulaire soumis => MAJ dans table pr gagnat
        if(isset($_POST['update_winner'])){
            $series_name = $_POST['series_name'];
            $episode_number = $_POST['episode_number'];
            $winner_id = $_POST['winner_id'];

            $sql = "UPDATE EPISODE SET WINNER_ID=?  
                    WHERE SERIES_NAME=? AND EPISODE_NUMBER=?";
            
            $stmt = $db->prepare($sql);
            $stmt->bindParam(1, $winner_id, PDO::PARAM_INT);
            $stmt->bindParam(2, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(3, $episode_number, PDO::PARAM_INT);
            
            if ($stmt->execute()) {
                echo "Gagnant de l'épisode mis à jour avec succès";
            } else {
                echo "Erreur lors de la mise à jour du gagnant de l'épisode: " . $stmt->errorInfo()[2];
            }
        }

        // ajout nouvel episode
        $sql = "SELECT s.NAME
                FROM series s
                WHERE s.CHAMPION_ID IS NULL"; //UNIQUEMENT SI SERIE PAS TERMINEE DONC PAS DE CHAMPION

        $result = $db->query($sql);

        if ($result->rowCount() > 0) {
            echo "<h2>Ajouter un nouvel épisode</h2>";
            echo "<form method='post'>";
            echo "Série: <select name='new_series_name'>";
            while($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row["NAME"] . "'>" . $row["NAME"] . "</option>";
            }
            echo "</select><br>";
            echo "Numéro d'épisode: <input type='number' name='new_episode_number' min='1' required><br>";
            echo "Titre: <input type='text' name='new_title' required><br>";
            echo "Date de diffusion: <input type='date' name='new_airdate' required><br>";
            echo "<input type='submit' name='add_episode' value='Ajouter épisode'>";
            echo "</form>";
        }

        // si formulaire soumis => ajout episode avec parametres
        if(isset($_POST['add_episode'])){
            $series_name = $_POST['new_series_name'];
            $episode_number = $_POST['new_episode_number'];
            $title = $_POST['new_title'];
            $airdate = $_POST['new_airdate'];

            $sql = "INSERT INTO EPISODE (SERIES_NAME, EPISODE_NUMBER, TITLE, AIRDATE)
                    VALUES (?, ?, ?, ?)";
            
            $stmt = $db->prepare($sql);
            $stmt->bindParam(1, $series_name, PDO::PARAM_STR);
            $stmt->bindParam(2, $episode_number, PDO::PARAM_INT);
            $stmt->bindParam(3, $title, PDO::PARAM_STR);
            $stmt->bindParam(4, $airdate, PDO::PARAM_STR);
            
            if ($stmt->execute()) {
                echo "Nouvel épisode ajouté avec succès";
            } else {
                echo "Erreur lors de l'ajout de l'épisode: " . $stmt->errorInfo()[2];
            }
        }
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
        text-align : center;}
    </style>
</body>
</html>