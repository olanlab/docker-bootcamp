// CREATE NETWORK
docker network create api-application

// CLEAR
docker stop api mysql pma
docker rm api mysql pma

// API =============================================================================

// BUILD
docker build . -t flask-api:v1

// API : RUN
docker run --name api --network api-application -p 5000:5000 flask-api:v1
docker run --name api --network api-application -p 5000:5000 -d flask-api:v1

// API ( VOLUME )
docker run --name api --network api-application -v $(pwd):/app -p 5000:5000  -d flask-api:v1

docker stop api & docker rm api 


// MYSQL ===========================================================================
docker run --name mysql -e MYSQL_ROOT_PASSWORD=1111 -d mysql:5.7

// MYSQL with setup.sql
docker run --name mysql --network api-application -v $(pwd)/db/:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=1111 -d mysql:5.7

// Enter to mysql container
docker exec -it mysql bash

// phpmyadmin ======================================================================
docker run --name pma -d --network api-application -p 8888:80 -e PMA_ARBITRARY=1 phpmyadmin/phpmyadmin
