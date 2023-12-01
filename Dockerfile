FROM node:lts-alpine

WORKDIR /usr/src/app

COPY backend/package*.json ./

# USER node

RUN npm install
COPY /backend/. .

EXPOSE 3001

CMD [ "node", "./server.js" ]