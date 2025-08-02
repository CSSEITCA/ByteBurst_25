document.addEventListener('DOMContentLoaded', () => {
    const hamburger = document.getElementById('hamburger');
    const navLinks = document.querySelector('.nav-links');

    if (hamburger && navLinks) {
        hamburger.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            hamburger.classList.toggle('active');
        });
    }

    // Optional: Add some interactivity to the buttons
    const ctaButtons = document.querySelectorAll('.cta-btn');
    ctaButtons.forEach(button => {
        button.addEventListener('click', () => {
            alert(You clicked the "${button.textContent}" button!);
            // You can replace this with a redirect or a modal
            // e.g., window.location.href = 'report-lost.html';
        });
    });
});