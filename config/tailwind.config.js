const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/presenters/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim,rb}',
    'config/initializers/simple_form.rb',
    'config/initializers/simple_form_tailwind_css.rb'
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.red,
        gray: colors.gray,
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        'fade-out': {
          '0%, 70%': { opacity: 1 },
          '100%': { opacity: 0 }
        }
      },
      animation: {
        'fade-out': 'fade-out 3s linear 1'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
