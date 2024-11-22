document.querySelectorAll('.style-button').forEach(button => {
    button.addEventListener('click', function() {
        const fileInput = this.parentElement.querySelector('.fileInput');
        fileInput.click();
    });
});

document.querySelectorAll('.fileInput').forEach(input => {
    input.addEventListener('change', function(event) {
        const file =
        event.target.files[0];
        if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const preview = event.target.parentElement.querySelector('.preview');
            preview.src = e.target.result;
            preview.style.display = 'block';
        };

        reader.readAsDataURL(file);
        }
    });
});