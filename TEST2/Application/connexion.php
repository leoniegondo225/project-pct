<?php
require_once("serveur.php");

// Vérification de l'existence des clés dans $_POST
if (isset($_POST['email']) && isset($_POST['mot_de_passe'])) {
    // Récupération et nettoyage des données du formulaire
    $email = trim($_POST['email']);
    $mot_de_passe = trim($_POST['mot_de_passe']);

    // Préparation de la requête SQL
    $sql = "SELECT * FROM artisans WHERE (email_artisan= ?)";
    $stmt = $con->prepare($sql);

    if ($stmt === false) {
        die("Erreur de préparation de la requête : " . $con->error);
    }

    // Liaison des paramètres
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        echo 'reésayer';
        $row = $result->fetch_assoc();
        // Vérification du mot de passe
        if (password_verify($mot_de_passe, $row['mot_de_passe'])) {
            // Démarrer une session
            session_start();
            $_SESSION['user_id'] = $row['idartisan']; // Stocker l'ID utilisateur dans la session
            header("Location: accueil.html"); // Redirection vers la page d'accueil
            exit();
        } 
    } else {
        echo "Nom d'utilisateur ou mot de passe incorrect.";
    }

    $stmt->close();
   
} else { 
    echo "Veuillez fournir un nom d'utilisateur et un mot de passe.";
}

// Fermeture de la connexion
mysqli_close($con);


?>