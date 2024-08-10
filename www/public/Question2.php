<!DOCTYPE html>
<html>
    <head>
        <title> PROJET BD | Q2 </title>
        <meta charset="utf-8">

        <?php
        include 'index.php';
        global $db ;
        ?>
    </head>

    <body>
        <h1> Question 2 </h1>
        <p> Pour chaque table de la liste, créez un formulaire pour sélectionner et afficher ses tuples en limitant la valeur d'un ou plusieurs de leurs
attributs : PERSON, SERIES, et EPISODE. Ces contraintes se limitent aux contraintes de contenance pour les variables qui sont des chaînes
(nom, par exemple) et aux contraintes d'égalité pour les champs qui sont des nombres ou des dates. Lorsque plusieurs contraintes sont
fournies, les tuples doivent toutes les satisfaire.</p>

        <section>
            <?php
// ----- Sélection -----
        $persons = $db->query("SELECT FIRSTNAME, LASTNAME, ID FROM person ORDER BY FIRSTNAME, LASTNAME");
        $series = $db->query("SELECT NAME FROM series");
        $episodes = $db->query("SELECT DISTINCT EPISODE_NUMBER FROM episode");

        echo "<form method='post'>";
            echo "<select name='person'>";
            echo "<option value=''>Sélectionnez une personne de l'émission</option>";
                while($person = $persons->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value='" . $person["ID"] . "'>" . $person["FIRSTNAME"] . " " . $person["LASTNAME"] . "</option>";}
            echo "</select>";

            echo "<select name='series'>";
            echo "<option value=''>Sélectionnez une série</option>";
                while($serie = $series->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value='" . $serie["NAME"] . "'>" . $serie["NAME"] . "</option>";}
            echo "</select>";

            echo "<select name='episode'>";
            echo "<option value=''>Sélectionnez un numéro d'épisode</option>";
                while($episode = $episodes->fetch(PDO::FETCH_ASSOC)) {
                        echo "<option value='" . $episode["EPISODE_NUMBER"] . "'>" . " - Episode " . $episode["EPISODE_NUMBER"] . "</option>";}
            echo "</select>";

            echo "<input type='submit' value='Sélectionner'>";
        echo "</form>";

// ----- Affichage -----
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $selectperson = $_POST['person'];
    $selectseries = $_POST['series'];
    $selectepisode = $_POST['episode'];

    $stmt = $db->prepare("SELECT ID, FIRSTNAME, LASTNAME FROM person WHERE ID = ?");
    $stmt->execute([$selectperson]);
    $person = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($person) {            
                echo "<h3>Table Person</h3>";
                echo "<table border='1'>";
                echo "<tr><th>ID</th><th>Prénom</th><th>Nom</th></tr>";
                echo "<tr>";
                echo "<td>" . $person['ID']. "</td>";
                echo "<td>" . $person['FIRSTNAME']. "</td>";
                echo "<td>" . $person['LASTNAME']. "</td>";
                echo "</tr>";
                echo "</table>";}

    $stmt = $db->prepare("SELECT ID FROM taskmaster WHERE ID = ?");
    $stmt->execute([$selectperson]);
    $taskmaster = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($taskmaster) {            
                echo "<h3>Table Taskmaster</h3>";
                echo "<table border='1'>";
                echo "<tr><th>ID</th></tr>";
                echo "<tr>";
                echo "<td>" . $taskmaster['ID']. "</td>";
                echo "</tr>";
                echo "</table>";}
    
    $stmt = $db->prepare("SELECT ID FROM assistant WHERE ID = ?");
    $stmt->execute([$selectperson]);
    $assistant = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($assistant) {            
                echo "<h3>Table Assistant</h3>";
                echo "<table border='1'>";
                echo "<tr><th>ID</th></tr>";
                echo "<tr>";
                echo "<td>" . $assistant['ID']. "</td>";
                echo "</tr>";
                echo "</table>";}

    $stmt = $db->prepare("SELECT ID FROM candidate WHERE ID = ?");
    $stmt->execute([$selectperson]);
    $candidate = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($candidate) {            
                echo "<h3>Table Candidate</h3>";
                echo "<table border='1'>";
                echo "<tr><th>ID</th></tr>";
                echo "<tr>";
                echo "<td>" . $candidate['ID']. "</td>";
                echo "</tr>";
                echo "</table>";}
    
    $stmt = $db->prepare("SELECT CANDIDATE_ID, JOB FROM job WHERE CANDIDATE_ID = ?");
    $stmt->execute([$selectperson]);
    $jobs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($jobs) {            
                echo "<h3>Table JOB</h3>";
                echo "<table border='1'>";
                echo "<tr><th>ID</th><th>JOB</th></tr>";
                foreach ($jobs as $job) {
                    echo "<tr>";
                    echo "<td>" . $job['CANDIDATE_ID']. "</td>"; echo "<td>" . $job['JOB']. "</td>";
                    echo "</tr>";}
                echo "</table>";}
    
    $stmt = $db->prepare("SELECT NAME, NETWORK, STARTDATE, ENDDATE, TASKMASTER_ID, ASSISTANT_ID, CHAMPION_ID FROM series WHERE NAME = ?AND (TASKMASTER_ID = ? OR ASSISTANT_ID = ? OR CHAMPION_ID = ?)");
    $stmt->execute([$selectseries, $selectperson, $selectperson, $selectperson]);
    $series = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($series) {            
                echo "<h3>Table SERIES</h3>";
                echo "<table border='1'>";
                echo "<tr><th>NAME</th><th>NETWORK</th><th>STARTDATE</th><th>ENDDATE</th><th>TASKMASTER_ID</th><th>ASSISTANT_ID</th><th>CHAMPION_ID</th></tr>";
                echo "<tr>";
                echo "<td>" . $series['NAME']. "</td>"; echo "<td>" . $series['NETWORK']. "</td>"; echo "<td>" . $series['STARTDATE']. "</td>"; echo "<td>" . $series['ENDDATE']. "</td>"; 
                echo "<td>" . $series['TASKMASTER_ID']. "</td>"; echo "<td>" . $series['ASSISTANT_ID']. "</td>"; echo "<td>" . $series['CHAMPION_ID']. "</td>";
                echo "</tr>";
                echo "</table>";}
    
    $stmt = $db->prepare("SELECT SERIES_NAME, CANDIDATE_ID, CHAIR FROM feature WHERE SERIES_NAME = ? AND CANDIDATE_ID = ?");
    $stmt->execute([$selectseries, $selectperson]);
    $features = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($features) {
                echo "<h3>Table FEATURE</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>CANDIDATE_ID</th><th>CHAIR</th></tr>";
                foreach ($features as $feature) {
                    echo "<tr>";
                    echo "<td>" . $feature['SERIES_NAME'] . "</td>";
                    echo "<td>" . $feature['CANDIDATE_ID'] . "</td>";
                    echo "<td>" . $feature['CHAIR'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT ID, SERIES_NAME FROM team WHERE SERIES_NAME = ?");
    $stmt->execute([$selectseries]);
    $teams = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($teams) {
                echo "<h3>Table Team</h3>";
                echo "<table border='1'>";
                echo "<tr><th>ID</th><th>SERIES_NAME</th></tr>";
                foreach ($teams as $team) {
                    echo "<tr>";
                    echo "<td>" . $team['ID'] . "</td>";
                    echo "<td>" . $team['SERIES_NAME'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}
    
    $stmt = $db->prepare("SELECT TEAM_ID, CANDIDATE_ID FROM membership WHERE CANDIDATE_ID = ?");
    $stmt->execute([$selectperson]);
    $memberships = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($memberships) {
                echo "<h3>Table MEMBERSHIP</h3>";
                echo "<table border='1'>";
                echo "<tr><th>TEAM_ID</th><th>CANDIDATE_ID</th></tr>";
                foreach ($memberships as $membership) {
                    echo "<tr>";
                    echo "<td>" . $membership['TEAM_ID'] . "</td>";
                    echo "<td>" . $membership['CANDIDATE_ID'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TITLE, AIRDATE, WINNER_ID FROM episode WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ? AND WINNER_ID = ?");
    $stmt->execute([$selectseries, $selectepisode, $selectperson]);
    $episodes = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($episodes) {
                echo "<h3>Table EPISODE</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TITLE</th><th>AIRDATE</th><th>WINNER_ID</th></tr>";
                foreach ($episodes as $episode) {
                    echo "<tr>";
                    echo "<td>" . $episode['SERIES_NAME'] . "</td>"; echo "<td>" . $episode['EPISODE_NUMBER'] . "</td>"; echo "<td>" . $episode['TITLE'] . "</td>";
                    echo "<td>" . $episode['AIRDATE'] . "</td>"; echo "<td>" . $episode['WINNER_ID'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}
            
    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER, DESCRIPTION, ISLIVETASK FROM task WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ? ");
    $stmt->execute([$selectseries, $selectepisode]);
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($tasks) {
                echo "<h3>Table TASK</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th><th>DESCRIPTION</th><th>ISLIVETASK</th></tr>";
                foreach ($tasks as $task) {
                    echo "<tr>";
                    echo "<td>" . $task['SERIES_NAME'] . "</td>"; echo "<td>" . $task['EPISODE_NUMBER'] . "</td>"; echo "<td>" . $task['TASK_NUMBER'] . "</td>";
                    echo "<td>" . $task['DESCRIPTION'] . "</td>"; echo "<td>" . $task['ISLIVETASK'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER FROM individualtask WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ?");
    $stmt->execute([$selectseries, $selectepisode]);
    $individualTasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($individualTasks) {
                echo "<h3>Table INDIVIDUALTASK</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th></tr>";
                foreach ($individualTasks as $individualTask) {
                    echo "<tr>";
                    echo "<td>" . $individualTask['SERIES_NAME'] . "</td>"; 
                    echo "<td>" . $individualTask['EPISODE_NUMBER'] . "</td>"; 
                    echo "<td>" . $individualTask['TASK_NUMBER'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER FROM teamtask WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ?");
    $stmt->execute([$selectseries, $selectepisode]);
    $teamTasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($teamTasks) {
                echo "<h3>Table TEAMTASK</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th></tr>";
                foreach ($teamTasks as $teamTask) {
                    echo "<tr>";
                    echo "<td>" . $teamTask['SERIES_NAME'] . "</td>"; 
                    echo "<td>" . $teamTask['EPISODE_NUMBER'] . "</td>"; 
                    echo "<td>" . $teamTask['TASK_NUMBER'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}
        
    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER FROM tiebreaker WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ?");
    $stmt->execute([$selectseries, $selectepisode]);
    $tiebreakers = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($tiebreakers) {
                echo "<h3>Table TIEBREAKER</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th></tr>";
                foreach ($tiebreakers as $tiebreaker) {
                    echo "<tr>";
                    echo "<td>" . $tiebreaker['SERIES_NAME'] . "</td>"; 
                    echo "<td>" . $tiebreaker['EPISODE_NUMBER'] . "</td>"; 
                    echo "<td>" . $tiebreaker['TASK_NUMBER'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER, CANDIDATE_ID, POINTS, WASDISQUALIFIED FROM points WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ? AND CANDIDATE_ID = ?");
    $stmt->execute([$selectseries, $selectepisode, $selectperson]);
    $points = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($points) {
                echo "<h3>Table POINTS</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th><th>CANDIDATE_ID</th><th>POINTS</th><th>WASDISQUALIFIED</th></tr>";
                foreach ($points as $point) {
                    echo "<tr>";
                    echo "<td>" . $point['SERIES_NAME'] . "</td>"; 
                    echo "<td>" . $point['EPISODE_NUMBER'] . "</td>"; 
                    echo "<td>" . $point['TASK_NUMBER'] . "</td>";
                    echo "<td>" . $point['CANDIDATE_ID'] . "</td>";
                    echo "<td>" . $point['POINTS'] . "</td>";
                    echo "<td>" . $point['WASDISQUALIFIED'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER, TEAM_ID, POINTS, WASDISQUALIFIED FROM teampoints WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ?");
    $stmt->execute([$selectseries, $selectepisode]);
    $teamPoints = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($teamPoints) {
                echo "<h3>Table TEAMPOINTS</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th><th>TEAM_ID</th><th>POINTS</th><th>WASDISQUALIFIED</th></tr>";
                foreach ($teamPoints as $teamPoint) {
                    echo "<tr>";
                    echo "<td>" . $teamPoint['SERIES_NAME'] . "</td>"; 
                    echo "<td>" . $teamPoint['EPISODE_NUMBER'] . "</td>"; 
                    echo "<td>" . $teamPoint['TASK_NUMBER'] . "</td>";
                    echo "<td>" . $teamPoint['TEAM_ID'] . "</td>";
                    echo "<td>" . $teamPoint['POINTS'] . "</td>";
                    echo "<td>" . $teamPoint['WASDISQUALIFIED'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}

    $stmt = $db->prepare("SELECT SERIES_NAME, EPISODE_NUMBER, TASK_NUMBER, CANDIDATE_ID, WON FROM tiebreakerresult WHERE SERIES_NAME = ? AND EPISODE_NUMBER = ? AND CANDIDATE_ID = ?");
    $stmt->execute([$selectseries, $selectepisode, $selectperson]);
    $tiebreakerResults = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($tiebreakerResults) {
                echo "<h3>Table TIEBREAKERRESULT</h3>";
                echo "<table border='1'>";
                echo "<tr><th>SERIES_NAME</th><th>EPISODE_NUMBER</th><th>TASK_NUMBER</th><th>CANDIDATE_ID</th><th>WON</th></tr>";
                foreach ($tiebreakerResults as $tiebreakerResult) {
                    echo "<tr>";
                    echo "<td>" . $tiebreakerResult['SERIES_NAME'] . "</td>"; 
                    echo "<td>" . $tiebreakerResult['EPISODE_NUMBER'] . "</td>"; 
                    echo "<td>" . $tiebreakerResult['TASK_NUMBER'] . "</td>";
                    echo "<td>" . $tiebreakerResult['CANDIDATE_ID'] . "</td>";
                    echo "<td>" . $tiebreakerResult['WON'] . "</td>";
                    echo "</tr>";}
                echo "</table>";}     
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
        width: 80%;
        border-collapse: collapse;
        margin-top: 20px;
        text-align : center;}
    </style>
    </body>
    </html>