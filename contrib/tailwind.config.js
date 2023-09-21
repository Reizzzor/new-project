/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./resources/**/*.blade.php",
        "./resources/roles/admin/**/*.blade.php",
        "./resources/**/*.js",
        "./resources/**/*.vue",
    ],
    theme: {
        backgroundSize: {
            'auto': 'auto',
            'cover': 'cover',
            'contain': 'contain',
            '150%': '150%',
            '170%': '170%',
        },
        transitionProperty: {
            'background-size': 'background-size',
        },
        extend: {},
    },
    plugins: [],
}
