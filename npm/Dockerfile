# syntax=docker/dockerfile:1.7-labs
FROM node:20-alpine
WORKDIR /app
# Copy only files specific to npm install, so that install was run only when these files changed
COPY --exclude=**/node_modules --parents **/package.json .npmrc package-lock.json .
# Preserve global npm cache across installs and run install
RUN --mount=type=cache,target=/root/.npm npm i
# Copy all the other source code
COPY --exclude=**/node_modules . .
