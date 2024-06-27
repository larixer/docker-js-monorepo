# docker-js-monorepo

Node.js monorepo setup for Docker demo. The setup demonstrates how to utilize Docker cache layers and separate container install artifacts (`node_modules` or `pnp` files) from host artifacts.

The idea. During image rebuild the Docker can skip commands if the underlying files were not changed, so to properly utilize Docker cache you want the following structure of your Dockerfile:

- Copy files that are used by command 1
- Run command 1
- Copy files that are used by command 2
- Run command 2
- ...

`Run command 1` will be skipped by Docker if the prior step result yields the same files.

In the case of JavaScript projects this boils down to:

- Copy all `package.json` and a lockfile into build image, but only them, not any other files
- Run install
- Copy JavaScript source code
- Compile project
- ...

We should be careful to not use platform-specific files inside Docker image, that can potentially confuse JavaScript tools and have negative impact on installation. These files should be excluded during copy and should never show up inside the image. The example of platform-specific files: `node_modules`, `.yarn/install-state.gz`. Another example where `COPY --exclude` will be useful is if you want to install and run only a specific microservice with dependent workspaces from the monorepo inside a Docker container.

Provided examples:

- `npm` - npm monorepository
- `yarn` - Yarn node_modules monorepository
- `yarn-pnp` - Yarn PnP monorepository, non-zero install, global cache enabled
- `yarn-pnp-zero` - Yarn PnP zero-install monorepository

Provided demo scripts:

- `./first-run.sh` - builds initial docker image with all files from the host except install artifacts, then runs install inside container to produce container-specific install artifacts (.dockerigonre comes into play)
- `./second-run-no-dep-changes.sh` - demonstrates what will happen if there were no `package.json` file changes, but there were changes into other source code files (package manager install should not happen in this case)
- `./third-run-dep-changes.sh` - demonstrates changes to `package.json` files (package manager install should happen)

Miscellaneous scripts:

- `./docker-shell.sh` is a script to enter shell inside Docker to experiment with provided Dockerfile and check resulting container image contents
