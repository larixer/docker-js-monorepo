echo '// 0' > packages/bar/test.js
npm remove lodash
docker system prune -a
docker compose -p node-monorepo run node npm ls -a | grep -v OPTIONAL
