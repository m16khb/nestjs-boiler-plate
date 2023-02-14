#dockerfile
FROM node:16.19.0-alpine

# Create app directory
WORKDIR /usr/src/app

ENV NODE_ENV development

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN yarn

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

EXPOSE 3000

# Start the server using the production build
CMD [ "node","dist/main.js" ]