<?php
    define('HOST', 'mysql-service:3306') ;
    define('DB_NAME', 'groupXX') ; //change juste le nom ici de ta db
    define('USER','root') ;
    define('PASS','root') ;

    try {
        $db = new PDO("mysql:host=" . HOST . ";dbname=" . DB_NAME, USER, PASS);
        $db-> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        var_dump("Connect ok") ;
    } catch (PDOException $e) {
        var_dump($e);
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <style>
            .head{
                background-color: darkblue;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 999;
                font-size: 20px;
                letter-spacing: 1.42px;
                line-height: 1.07;}

            .menu {
                padding: 0;
                margin: 0;}

            .menu ul {
                list-style-type: none;
                color: #ffffff;}

            .menu ul li {
                display: inline;
                margin-left: 20px;}   

            .menu ul li a {
                text-decoration: none;
                color: #ffffff;}

            .menu ul li a:hover {
                text-decoration: underline;
                opacity: 0.5;
                transition: 0.3s;}
        </style>
    </head>

    <body>
        <!-- Header -->
        <header class='head'>
        <nav class='menu'>
            <ul>
                <li class ="bouton">
                    <a href="Projet.php">PROJET DE BD</a>
                </li>
                <li class ="bouton">
                    <a href="Question2.php">Q2</a>
                </li>
                <li class ="bouton">
                    <a href="Question3.php">Q3</a>
                </li>
                <li class ="bouton">
                    <a href="Question4.php">Q4</a>
                </li>
                <li class ="bouton">
                    <a href="Question5.php">Q5</a>
                </li>
                <li class ="bouton">
                    <a href="Question6.php">Q6</a>
                </li>
                <li class ="bouton">
                    <a href="Question7.php">Q7</a>
                </li>
                <li class ="bouton">
                    <a href="Question8.php">Q8</a>
                </li>
            </ul>
        </nav>
        </header>    
    </body><br><br>
</html>