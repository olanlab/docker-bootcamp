Network
=========================================================================
docker network create shoppers
docker network rm shoppers


mongoDB
=========================================================================
docker build -t mymongodb .
docker run -d --name mymongodb --network shoppers mymongodb
docker exec -it mymongodb bash

docker stop mymongodb && docker rm mymongodb && docker image rm mymongodb

-------------------------------------------------------------------------
mongo --port 27017 -u "admin" -p "1111" --authenticationDatabase "admin"


NodeJS
=========================================================================
docker build -t mynodejs .
docker run -d --name mynodejs --network shoppers -p 8080:8080  mynodejs
docker run --name mynodejs --network shoppers -p 8080:8080 -e DATABASE_HOST=mymongodb -e DATABASE_USER=admin -e DATABASE_PASSWORD=1111 mynodejs

docker stop mynodejs && docker rm mynodejs && docker image rm mynodejs