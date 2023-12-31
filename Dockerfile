# Use a minimal base image for Node.js
FROM node:lts-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

USER root

# Copy only the package.json and package-lock.json to leverage Docker cache
COPY backend/package*.json ./

# Create a directory for node_modules and change ownership
RUN mkdir -p node_modules && chown -R node:node node_modules

# Install dependencies and cleanup
RUN npm install --production && npm cache clean --force

# Copy the entire backend code
COPY /backend/. .

# Expose the application port
EXPOSE 3001

USER node

# Run the application using node
CMD [ "node", "./server.js" ]
