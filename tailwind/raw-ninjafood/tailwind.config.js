/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/index.html"],
  theme: {
    extend: {
      colors: {
        primary: '#FF6363',
        secondary: {
          100: '#E2E2D5',
          200: '#888883'
        }
      },
      fontFamily: {
        body: ['Nunito']
      }
    },
  },
  // prettier.config.js
  tailwindConfig: './styles/tailwind.config.js',
  plugins: [],
}

