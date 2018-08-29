# Specify a base image
#FROM alpine
# FROM node:6.14
FROM node:alpine

WORKDIR /usr/app

# Install some dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./

# Default command
CMD ["npm", "start"]
