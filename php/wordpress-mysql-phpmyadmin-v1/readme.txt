// CREATE NETWORK
docker network create wordpress
// MYSQL
docker run --name mysql --network wordpress -e MYSQL_ROOT_PASSWORD=1111 -d mysql:5.7
docker run --name mysql --network wordpress -e MYSQL_ROOT_PASSWORD=1111 -e MYSQL_DATABASE=wordpress_db -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -d mysql:5.7
docker run --name mysql --network wordpress -v $(pwd)/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1111 -d mysql:5.7

// WORDPRESS
docker run -d --name wordpress --network wordpress -p 888:80 -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=1111 wordpress
docker run -d --name wordpress --network wordpress -p 888:80 -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress_db wordpress
docker run -d --name wordpress --network wordpress -p 888:80 -v $(pwd)/wordpress:/var/www/html -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=1111 wordpress

// PHPMYADMIN
docker run --name pma -d --network wordpress -p 8888:80 -e PMA_ARBITRARY=1 phpmyadmin/phpmyadmin

// MYSQL
docker run --name mysql --network wordpress -e MYSQL_ROOT_PASSWORD=1111 -e MYSQL_DATABASE=wordpress_db -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -d mysql:5.7
// WORDPRESS
docker run -d --name wordpress --network wordpress -p 888:80 -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress_db wordpress