# Specify a base image
FROM node:alpine
WORKDIR /usr/app

COPY ./db.json ./
RUN npm install -g json-server

EXPOSE 3000

ENTRYPOINT ["json-server", "--host", "0.0.0.0"]
CMD ["--watch", "db.json"]
