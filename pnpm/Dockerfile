# syntax=docker/dockerfile:1.7-labs
FROM node:20-alpine
WORKDIR /app
RUN corepack enable pnpm
# Copy only files specific to pnpm install, so that install was run only when these files changed
COPY --exclude=**/node_modules --parents **/package.json .npmrc pnpm-workspace.yaml pnpm-lock.yaml .
RUN pnpm i
# Copy all the other source code
COPY --exclude=**/node_modules . .
# Optional application compile step
# pnpm build
