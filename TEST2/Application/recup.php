<?php
require_once("serveur.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST["S'inscrire"])) {
    // Récupération des données du formulaire
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $numero = $_POST['numero'];
    $email = $_POST['email'];
    $secteur_activite = $_POST['secteur_activite'];
    $ville = $_POST['ville'];
    $mot_de_passe = password_hash($_POST['mot_de_passe'], PASSWORD_BCRYPT);
    
    // Affichage des valeurs pour vérification
    
    // Préparation de la requête SQL
    $req = $con->prepare("INSERT INTO artisans (nom_artisan, prenom_artisan, numero_artisan, email_artisan, secteur_activite,  ville, mot_de_passe) VALUES (?, ?, ?, ?, ?, ?, ?)");
    
    if ($req === false) {
        die("Erreur de préparation de la requête : " . $con->error);
    }

    // Liaison des paramètres
    $req->bind_param("sssssss", $nom, $prenom, $numero, $email, $secteur_activite, $ville, $mot_de_passe);

    // Exécution de la requête
    if ($req->execute()) {
        echo "Données insérées avec succès.";
        header("Location: connex.html");
    } else {
        echo "Erreur: " . $req->error;
    }

    $req->close();
}

$con->close();
?>
