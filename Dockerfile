FROM node:lts-alpine

WORKDIR /usr/src/app/

USER root

COPY frontend/package*.json ./

# Create a directory for node_modules and change ownership
RUN mkdir -p node_modules && chown -R node:node node_modules

# Install dependencies and cleanup
RUN npm install && npm cache clean --force

COPY frontend/. .

# Expose the application port
EXPOSE 3000

# Health check
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

USER node
# Run the application
CMD ["npm", "start"]