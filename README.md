# docker-js-monorepo

Node.js monorepo setup for Docker demo. The setup demonstrates how to utilize Docker cache layers and separate container install artifacts (`node_modules` or `pnp` files) from host artifacts.
Provided examples:

- `npm` - npm monorepository
- `yarn` - Yarn node_modules monorepository
- `yarn-pnp` - Yarn PnP monorepository, non-zero install, global cache enabled
- `yarn-pnp-zero` - Yarn PnP zero-install monorepository

Provided demo scripts:

- `./first-run.sh` - builds initial docker image with all files from the host except install artifacts, then runs install inside container to produce container-specific install artifacts (.dockerigonre comes into play)
- `./second-run-no-dep-changes.sh` - demonstrates what will happen if there were no `package.json` file changes, but there were changes into other source code files (package manager install should not happen in this case)
- `./third-run-dep-changes.sh` - demonstrates changes to `package.json` files (package manager install should happen)
