# syntax=docker/dockerfile:1.7-labs
FROM node:20-alpine
WORKDIR /app
# Copy only files specific to npm install, so that install was run only when these files changed
COPY --parents packages/*/package.json package*.json .
RUN npm i
# Copy all the other source code
COPY . .