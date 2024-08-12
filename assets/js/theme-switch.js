document.addEventListener('DOMContentLoaded', function () {
    const themeToggleButton = document.getElementById('theme-toggle-button');

    // Function to switch themes and toggle button class
    function toggleTheme() {
        let theme = document.documentElement.getAttribute('data-theme');
        if (theme === 'dark') {
            document.documentElement.setAttribute('data-theme', 'light');
            localStorage.setItem('theme', 'light');
            themeToggleButton.classList.remove('theme-toggle--toggled');
        } else {
            document.documentElement.setAttribute('data-theme', 'dark');
            localStorage.setItem('theme', 'dark');
            themeToggleButton.classList.add('theme-toggle--toggled');
        }
    }

    // Set initial theme based on localStorage or OS preference
    const storedTheme = localStorage.getItem('theme');
    if (storedTheme) {
        document.documentElement.setAttribute('data-theme', storedTheme);
        if (storedTheme === 'dark') {
            themeToggleButton.classList.add('theme-toggle--toggled');
        } else {
            themeToggleButton.classList.remove('theme-toggle--toggled');
        }
    } else if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
        document.documentElement.setAttribute('data-theme', 'dark');
        themeToggleButton.classList.add('theme-toggle--toggled');
    }

    // Add click event listener to the button
    themeToggleButton.addEventListener('click', toggleTheme);
});