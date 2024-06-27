echo '#0' > packages/bar/test.js
npm remove lodash
docker container prune
docker rmi node-monorepo-node
docker compose -p node-monorepo run node sh
#docker compose -p node-monorepo run node npm ls -a | grep -v OPTIONAL
