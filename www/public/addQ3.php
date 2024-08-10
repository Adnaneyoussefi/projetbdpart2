<?php
include 'index.php';
global $db;

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $jobList = $_POST['job'];

    $query_check = $db->prepare("SELECT COUNT(*) as count FROM person WHERE firstname = :firstname AND lastname = :lastname");
    $query_check->bindParam(':firstname', $firstname);
    $query_check->bindParam(':lastname', $lastname);
    $query_check->execute();
    $result = $query_check->fetch(PDO::FETCH_ASSOC);

    if($result['count'] != 0) {
        echo '<script>alert("Un candidat avec le même nom existe déjà.");</script>';
        echo '<script>window.history.back();</script>';
        exit;}

    else{
    $query = $db->prepare("INSERT INTO person (firstname, lastname) VALUES (:fistname, :lastname)");
    $query->execute(array(
        ':fistname' => $firstname,
        ':lastname' => $lastname
    ));

    $candidate_id = $db->lastInsertId();

    $query_insert_candidate = $db->prepare("INSERT INTO candidate (ID) VALUES (:id)");
    $query_insert_candidate->bindParam(':id', $candidate_id);
    $query_insert_candidate->execute();

    $jobs = explode("\n", $jobList);
        foreach ($jobs as $job) {
            $query_insert_job = $db->prepare("INSERT INTO job (CANDIDATE_ID, JOB) VALUES (:id_candidat, :job)");
            $query_insert_job->bindParam(':id_candidat', $candidate_id);
            $query_insert_job->bindParam(':job', $job);
            $query_insert_job->execute();
        }
}}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PROJET BD | addQ3</title>
</head>
<body>
    <h1>Merci !</h1>
    <p>Le Candidat a bien été ajouté avec succès.</p>
    <p><a href="Question3.php">Retour à la question 3</a></p>
</body>
</html>