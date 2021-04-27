FROM node:16-buster

COPY client /client

WORKDIR /client

RUN yarn global add @quasar/cli

RUN yarn install
