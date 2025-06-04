// MYSQL
docker run --name mysql -e MYSQL_ROOT_PASSWORD=1111 -d mysql:5.7

// MYSQL with setup.sql
docker run --name mysql  -v $(pwd)/db/:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=1111 -d mysql:5.7

docker run --name mysql -v $(pwd)/db/:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=1111 -d mysql

// Enter to mysql container
docker exec -it mysql bash