# docker-js-monorepo

Node.js monorepo setup for Docker demo. The setup demonstrates how to utilize Docker cache layers and separate container `node_modules` from host `node_modules`.

`./first-run.sh` - builds initial docker image with all files from the host except `node_modules`, then runs install inside container to produce container-specific `node_modules` (.dockerigonre comes into play)
`./second-run-no-dep-changes.sh` - demonstrates what will happen if there were no `package.json` file changes, but there were changes into other source code files (npm install should not happen in this case)
`./third-run-dep-changes.sh` - demonstrates changes to `package.json` files (npm install should happen)
