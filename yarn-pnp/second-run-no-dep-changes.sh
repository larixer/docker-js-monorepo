echo '// 1' > packages/bar/test.js
docker compose -p node-monorepo run --build node ls .pnp.cjs
