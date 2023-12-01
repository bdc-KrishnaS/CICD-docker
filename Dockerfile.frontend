FROM node:lts-alpine

WORKDIR /usr/src/app/

COPY frontend/package*.json ./

# USER node

RUN npm install

COPY frontend/. .
# RUN mv /src/index.js /src/index.mjs
# RUN node /src/index.mjs

EXPOSE 3000
CMD [ "npm", "start"]
