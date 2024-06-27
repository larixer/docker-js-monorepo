# syntax=docker/dockerfile:1.7-labs
FROM node:20-alpine
WORKDIR /app
RUN corepack enable yarn
# Copy only files specific to yarn install, so that install was run only when these files changed
COPY --exclude=node_modules --exclude=.yarn/install-state.gz --parents **/package.json .yarnrc.yml yarn.lock .
RUN yarn
# Copy all the other source code
COPY . .
