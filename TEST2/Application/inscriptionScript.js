document.getElementById('registrationForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Récupère les données du formulaire
    const formData = new FormData(event.target);
    const fullName = formData.get('fullName');
    const birthDate = formData.get('birthDate');
    const username = formData.get('username');
    const email = formData.get('email');
    const password = formData.get('password');
    const confirmPassword = formData.get('confirmPassword');

    const errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(el => el.textContent = '');

    // Validation des champs
    let isValid = true;

    if (!/^[a-zA-Z\s]{4,30}$/.test(fullName)) {
        document.getElementById('FullNameError').textContent = 'Le nom doit etre compris entre 3 et 30 caractères et ne peut contenir que des lettres et des espaces.';
        isValid = false;
    }

    const birthDateObj = new Date(birthDate);
    const today = new Date();
    if (isNaN(birthDateObj.getTime()) || birthDateObj >= today) {
        document.getElementById('birthDateError').textContent = 'Date de naissance non valable.';
        isValid = false;
    }

    if (!/^[a-zA-Z0-9_]{4,15}$/.test(username)) {
        document.getElementById('usernameError').textContent = 'le nom d\'utilisateur doit comporter 4 caractères minimum long et ne peut contenir que des chiffres, et tirets( _ ).';
        isValid = false;
    }

    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
        document.getElementById('emailError').textContent = 'Adresse email non valable.';
        isValid = false;
    }

    if (password.length < 6) {
        document.getElementById('passwordError').textContent = 'Le mot de passe doit contenir 6 caratères minimum.';
        isValid = false;
    }

    if (!/[A-Z]/.test(password) || !/[a-z]/.test(password) || !/[0-9]/.test(password) || !/[!@#$%^&*]/.test(password)) {
        document.getElementById('passwordError').textContent = 'Le mot de passe doit contenir une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial (!@#$%^&*).';
        isValid = false;
    }

    if (password !== confirmPassword) {
        document.getElementById('passwordError').textContent = 'Les mots de passes ne correspondent pas.';
        isValid = false;
    } 
    if (!isValid) {
        return;
    }

    // Envoie les données au serveur
    fetch('https://le serveur à saisir.com/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            fullName: fullName,
            birthDate: birthDate,
            username: username,
            email: email,
            password: password
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            messageDiv.textContent = 'Inscription réussie! Rédirection...';
            messageDiv.style.color = 'green';

            setTimeout(() => {
                window.location.href = 'signin.html'; // Remplacez par l'URL de la page de destination
            }, 2000);
        } else {
            messageDiv.textContent = 'Inscritpion échouée: ' + data.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        messageDiv.textContent = 'Une erreur a été rencontré, veuillez réesayer.';
    });
});
