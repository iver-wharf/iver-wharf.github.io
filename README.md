# Wharf documentation

This repo contains a [Docsify.js](https://docsify.js.org/) site that's hosted
via GitHub Pages over at <https://iver-wharf.github.io/>.

## Build locally

1. Install Node.js <https://nodejs.org/en/download/>

2. Install Docsify.js CLI

   ```sh
   npm install -g docsify-cli
   ```

3. Run `docsify serve` on the `docs` folder in this repo

   ```sh
   docsify serve docs
   ```

4. Visit <http://localhost:3000>

## Linting markdown

1. Install Node.js <https://nodejs.org/en/download/>

2. Install linting dependencies

   ```sh
   npm install
   ```

3. Run the linting script

   ```sh
   npm run lint-md
   ```

   > Some linting errors can be fixed automatically. To do so, run the following
   > linting fixing script:
   >
   > ```sh
   > npm run lint-md-fix
   > ```
   >
   > :warning: Please keep in mind that this does change the files in-place.
   > Make sure you have committed your changes before running this.
