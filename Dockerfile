# base image
FROM node:alpine3.10
RUN npm install -g npm-cli-login

ENV NPM_USER=<YOUR-USERNAME>
ENV NPM_PASS=<YOUR-GITHUB-TOKEN>
ENV NPM_EMAIL=<YOUR-PUBLIC-EMAIL>
ENV NPM_REGISTRY=https://npm.pkg.github.com

# define workdir
WORKDIR /app

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
COPY .env /app/.env
COPY .npmrc /app/.npmrc
COPY app.js /app/app.js

RUN npm-cli-login && npm install
