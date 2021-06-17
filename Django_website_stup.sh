#!bin/sh

PROJECT=${1-myproject}

virtualenv -p python3 venv
echo "Creating Virtualenv"

source venv/bin/activate
echo "activating venv"

pip install Django django-tables2 pandas bs4 requests psycopg2
pip freeze > requirements.txt

echo "Creating project '$PROJECT' "
django-admin startproject $PROJECT
cd $PROJECT
python manage.py startapp main
echo "Creating App Main"

touch main/urls.py

mkdir main/templates
mkdir main/static
mkdir main/static/css
mkdir main/static/images
mkdir main/templates/components
echo "Created directories"

echo "Intialising tailwind"
mkdir jstools && cd jstools

npm init -y && npm install tailwindcss autoprefixer clean-css-cli && npx tailwindcss init -p

rm tailwind.config.js
rm package.json



cat << EQF > package.json
{
  "name": "jstools",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "build": "tailwind build ../main/static/css/tailwind.css -o ../main/static/css/style.css && cleancss -o ../main/static/css/style.min.css ../main/static/css/style.css"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "autoprefixer": "^10.2.5",
    "clean-css-cli": "^5.3.0",
    "tailwindcss": "^2.1.2"
  }
}
EQF

cat << EQF > tailwind.config.js
const colors = require('tailwindcss/colors')

module.exports = {
  darkMode: 'class',
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
  },
  purge: {
      enabled: false, //true for production build
      content: [
          '../**/templates/*.html',
          '../**/templates/**/*.html'
      ]
  },
  theme: {
    screens: {
      sm: '480px',
      md: '768px',
      lg: '976px',
      xl: '1440px',
    },
    colors: {
      p2:'#1EE118',
      primary:'#02B159',
      secondary:'#006AF5',
      white:'#ffffff',
      offwhite:colors.coolGray[50],
      black:colors.coolGray[800],
      gray: colors.coolGray,
      blue: colors.lightBlue,
      red: colors.rose,
      pink: colors.fuchsia,
      yellow: colors.amber,
      green: colors.green,
    },
    fontWeight: {
      hairline: 100,
      'extra-light': 100,
      thin: 200,
      light: 300,
      normal: 400,
      medium: 500,
      semibold: 600,
      bold: 700,
      extrabold: 800,
      'extra-bold': 800,
      black: 900,
     },
    fontFamily: {
      sans: ['Graphik', 'sans-serif'],
      mw: ['Merriweather', 'serif'],
      ss: ['ui-sans-serif', 'system-ui'],
      serif: ['ui-serif', 'Georgia'],
      mono: ['ui-monospace', 'SFMono-Regular'],
    },
    extend: {
      spacing: {
        '128': '32rem',
        '144': '36rem',
      },
      borderRadius: {
        '4xl': '2rem',
      }
    }
  },
  variants: {},
  plugins: [],
}
EQF

cat << EQF > ../main/static/css/tailwind.css
@tailwind base;

@tailwind components;

@tailwind utilities;
EQF


npm run build

echo "ran first tailwind build"

cd ..
echo "Editing settings.py"
