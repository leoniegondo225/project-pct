document.addEventListener('DOMContentLoaded', () => {
    const navlinks = document.querySelectorAll('.nav_links');

    navlinks.forEach(link => {
        link.addEventListener('mouseover', () => {
            link.classList.add('.nav_links-hover');
        });
        
        link.addEventListener('mouseout',() => {
            if (! link.classList.contains('active'))
            {
            link.classList.remove('.nav_links-hover');
        }
        });

        link.addEventListener('click', (event) => { 
            navlinks.forEach(link => link.classList.remove('active'));
            link.classList.add('active');
        });
    });
    document.getElementById('Search').addEventListener('focus', function() {
        this.style.width = '350px';
    });

    document.getElementById('Search').addEventListener('blur', function() {
        this.style.width = '300px';
    });

    document.getElementById('backButton').addEventListener('click', function(event) {
        event.preventDefault();
        window.history.back();
    });
});