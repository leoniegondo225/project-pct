<?php
require_once("serveur.php");

if ($con->connect_error) {
    die("Échec de la connexion : " . $con->connect_error);
}

// Requête SQL corrigée
$req = "SELECT idartisans, nom_artisan, prenom_artisan, numero_artisan, email_artisan, secteur_activite, ville FROM artisans";

// Exécution de la requête et vérification de son succès
$resul = mysqli_query($con, $req);
if (!$resul) {
    die("Erreur SQL : " . mysqli_error($con));
}
?>

<table id="exemple1" class="table table_bordered table_striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>NOM</th>
            <th>PRÉNOM</th>
            <th>NUMERO</th>
            <th>EMAIL</th>
            <th>SECTEUR D'ACTIVITE</th>
            <th>VILLE</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($fil = mysqli_fetch_array($resul)) { ?>
        <tr>
            <td><?php echo $fil['idartisans']; ?></td>
            <td><?php echo $fil['nom_artisan']; ?></td>
            <td><?php echo $fil['prenom_artisan']; ?></td>
            <td><?php echo $fil['numero_artisan']; ?></td>
            <td><?php echo $fil['email_artisan']; ?></td>
            <td><?php echo $fil['secteur_activite']; ?></td>
            <td><?php echo $fil['ville']; ?></td>
            <td>
                <a class="btn btn-warning btn-flat btn-sm" href="recup.php?codeaut=<?php echo $fil['idartisans']; ?>">
            </td>
        </tr>
        <?php } ?>
    </tbody>
</table>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PromoArt</title>
    <link rel="stylesheet" href="listes.css">
</head>
<body>
    
</body>
</html>
