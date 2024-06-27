echo '#1' > packages/bar/test.js
docker compose -p node-monorepo run --build node npm ls -a | grep -v OPTIONAL
