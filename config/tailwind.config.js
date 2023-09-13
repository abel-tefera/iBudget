const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        'proxima-nova-regular': ['proxima_nova_rgregular'],
        'proxima-nova-bold': ['proxima_nova_rgbold'],
        'fertigo': ['Fertigo Pro Script W03 Regular']
      },
      colors: {
        'primary': '#3778c2',
        'secondary': '#5fb523',
        'tertiary': '#434b54'
      },
      minHeight: {
        '4/5': '80vh'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
