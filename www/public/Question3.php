<!DOCTYPE html>
<html>
    <head>
        <title> PROJET BD | Q3 </title>
        <meta charset="utf-8">

        <?php
        include 'index.php';
        global $db ;
        ?>
    </head>

    <body>
        <h1> Question 3 </h1>
        <p> Créez une page où vous pouvez ajouter des candidats. Idéalement, vous n’avez pas besoin de fournir explicitement un ID pour les nouveaux
candidats. Le formulaire doit contenir une textarea dans laquelle on peut ajouter les métiers du candidat (un métier par ligne). Nous
supposons que nous ne pouvons pas avoir deux personnes portant le même prénom et le même nom. N'oubliez pas que les candidats
doivent avoir au moins un métier. </p>

        <section>
            <form action="addQ3.php" method="POST">
            
            <input type="text"  placeholder="FIRSTNAME" id="firstname" name="firstname" required>
            <input type="text"  placeholder="LASTNAME" id="lastname" name="lastname" required><br><br>

            <textarea id="job" name="job" placeholder="JOB(s)" required></textarea><br><br>

            <input type="submit" value="Add new candidate">
            </form>
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