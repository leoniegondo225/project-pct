<?php
// connexion à ma base de données
$con=mysqli_connect("localhost", "root","mot de passe", "bdpct");
if(!$con){
    die("Impossible de faire la connexion".mysqli_error());
}
?>