module.exports = {
    darkMode: "class",

    content: [
        "./app/**/*.{js,ts,jsx,tsx}",
        "./components/**/*.{js,ts,jsx,tsx}",
    ],

    theme: {
        extend: {
            animation: {
                fadeIn: "fadeIn 1s ease-in-out",
                slideUpCubiBezier:
                    "slideUpCubiBezier 1s cubic-bezier(.39,.575,.565,1) both",
            },

            keyframes: {
                fadeIn: {
                    "0%": {
                        opacity: "0",
                    },
                    "100%": {
                        opacity: "1",
                    },
                },

                slideUpCubiBezier: {
                    "0%": {
                        transform: "translateY(40px)",
                        opacity: "0",
                    },
                    "100%": {
                        transform: "translateY(0)",
                        opacity: "1",
                    },
                },
            },
        },
    },

    plugins: [],
}