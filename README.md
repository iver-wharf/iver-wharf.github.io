# Wharf documentation

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/528712e18d2a4472bddf29aab4328923)](https://www.codacy.com/gh/iver-wharf/iver-wharf.github.io/dashboard?utm_source=github.com\&utm_medium=referral\&utm_content=iver-wharf/iver-wharf.github.io\&utm_campaign=Badge_Grade)

This repo contains a [Docsify.js](https://docsify.js.org/) site that's hosted
via GitHub Pages over at <https://iver-wharf.github.io/>.

## Build locally

1. Install Node.js: <https://nodejs.org/en/download/>

2. Install [Docsify.js](https://docsify.js.org/) dependencies using NPM:

   ```sh
   npm install
   ```

3. Start Docsify's local server (that supports hot-reloading!)

   ```sh
   npm start
   ```

4. Visit <http://localhost:3000>

## Linting markdown

Requires Node.js (npm) to be installed: <https://nodejs.org/en/download/>

```sh
npm install

npm run lint

# Some errors can be fixed automatically. Keep in mind that this updates the
# files in place.
npm run lint-fix
```

---

Maintained by [Iver](https://www.iver.com/en).
Licensed under the [MIT license](./LICENSE).
