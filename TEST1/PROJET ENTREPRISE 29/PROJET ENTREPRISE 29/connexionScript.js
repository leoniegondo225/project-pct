function validateForm() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    if (username === '' || password === '') {
        alert('Veuillez remplir tous les.');
        return false;
    }
    return true;
}
