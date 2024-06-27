echo '// 0' > packages/bar/test.js
yarn remove lodash 2>&1 > /dev/null
docker system prune -a
docker compose -p node-monorepo run node ls node_modules
