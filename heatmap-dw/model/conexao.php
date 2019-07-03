<?php

$host = "localhost"; //adicione o host do banco aqui
$dbname = "dbname"; //nome do banco
$username = "user"; //nome do usuario do banco
$password = "pass"; //senha do usuario do banco
$charset = "utf8"; //configuracao utf8 para o banco

try {
  $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=$charset", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}

?>