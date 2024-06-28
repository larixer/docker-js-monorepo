# syntax=docker/dockerfile:1.7-labs
FROM node:20-alpine
WORKDIR /app
RUN corepack enable pnpm
# Copy only files specific to pnpm install, so that install was run only when these files changed
COPY --exclude=**/node_modules --parents **/package.json .npmrc pnpm-workspace.yaml pnpm-lock.yaml .
# Preserve global pnpm cache across installs and run install
RUN --mount=type=cache,target=/root/.local/share/pnpm pnpm i
# Copy all the other source code
COPY --exclude=**/node_modules . .
# Optional application compile step
# pnpm build
