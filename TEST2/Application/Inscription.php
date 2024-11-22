<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="inscription.css">
</head>
<body>
    
    <div class="container">
        <div class="form-container">
            <div class="header">
                <a href="index.html" class="back-to-home"><i class="fa fa-home"></i> Acceuille</a>
                <h2>Inscription</h2>
            </div>
            <form id="loginForm" method="POST" action="recup.php">
                <div class="input-group">
                    <label for="name">
                        <i class="fa fa-user"></i> Entrer votre Nom
                    </label>
                    <input type="text" id="name" name="nom" placeholder="Nom" required>
                </div>
                <div class="input-group">
                    <label for="surname">
                        <i class="fa fa-user"></i> Entrer votre Prénom
                    </label>
                    <input type="text" id="surname" name="prenom" placeholder="Prenom" required>
                </div>
                <div class="input-group">
                    <label for="phone">
                        <i class="fa fa-phone"></i> Entrer votre numéro de téléphone
                    </label>
                    <input type="tel" id="phone" name="numero" placeholder="Numéro de téléphone" required>
                </div>
                <div class="input-group">
                    <label for="email">
                        <i class="fa fa-envelope"></i> Entrer votre Email
                    </label>
                    <input type="email" id="email" name='email' placeholder="Email" required>
                </div>

                <div class="input-group">
                    <label for="sector">
                        <i class="fa fa-briefcase"></i> Selectionner votre secteur d'activité
                    </label>
                    <select id="sector" name="secteur_activite" required>
                        <option value="">Select a sector</option>
                        <option value="Caroleur">Caroleur</option>
                        <option value="cordonnier">cordonnier</option>
                        <option value="Plonbier">Plonbier</option>
                        <option value="Menusier">Menusier</option>
                        <option value="Massonnier">Massonnier</option>
                        <option value="Couturier">Couturier</option>
                        <option value="commercente">commercente</option>
                        <option value="Electricien">Electricien</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="city">
                        <i class="fa fa-city"></i> Entrer votre ville 
                    </label>
                    <input type="text" id="city" name="ville" placeholder="ville" required>
                </div>
                <div class="input-group">
                    <label for="password">
                        <i class="fa fa-lock"></i> Entrer votre mot de passe
                    </label>
                    <div class="password-container">
                        <input type="password" id="password" name="mot_de_passe" placeholder="Password" required>
                        <i class="fa fa-eye" id="togglePassword" style="cursor: pointer;"></i>
                    </div>
                </div>
                <div class="input-group">
                    <label for="password">
                        <i class="fa fa-lock"></i> Confirmer votre mot de passe 
                    </label>
                    <div class="password-container">
                        <input type="password" id="password"  name="mot_de_pass_confirm" placeholder="Password" required>
                    </div>
                </div>
                
                <!--<a href="#" class="forgot-password">Mot de passe oublié ?</a>-->
                <button type="submit" id="signupButton" name="S'inscrire">S'inscrire</button>
                <p class="signup-text">Déjà inscrit?</p>
            </form>
        </div>
        <div class="image-container">
            <p>INSCRIVEZ-VOUS ICI</p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const togglePassword = document.getElementById('togglePassword');

            togglePassword.addEventListener('click', function() {
                // Toggle the type attribute
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);

                // Toggle the eye icon
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        });
        document.addEventListener('DOMContentLoaded', function() {
        const signupButton = document.getElementById('signupButton');

        signupButton.addEventListener('click', function() {
            window.location.href = 'connex.html';
        });
    });
    </script>
</body>
</html>