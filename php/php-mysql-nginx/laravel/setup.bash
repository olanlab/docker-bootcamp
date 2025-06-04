#!/bin/bash

# Laravel Docker Setup Script
echo "Setting up Laravel with Docker..."

# Create directory structure
mkdir -p docker/nginx
mkdir -p docker/php
mkdir -p docker/mysql
mkdir -p src

# Create configuration files
cat > docker/nginx/nginx.conf << 'EOF'
# Copy the nginx.conf content from the Nginx Main Configuration artifact
EOF

cat > docker/nginx/default.conf << 'EOF'
# Copy the default.conf content from the Nginx Server Configuration artifact
EOF

cat > docker/php/Dockerfile << 'EOF'
# Copy the Dockerfile content from the PHP Dockerfile artifact
EOF

cat > docker/php/php.ini << 'EOF'
# Copy the php.ini content from the PHP Configuration artifact
EOF

cat > docker/mysql/my.cnf << 'EOF'
# Copy the my.cnf content from the MySQL Configuration artifact
EOF

# Create Laravel project if src directory is empty
if [ ! -f "src/artisan" ]; then
    echo "Creating new Laravel project..."
    docker run --rm -v $(pwd):/app composer create-project laravel/laravel /app/src
fi

# Set proper permissions
sudo chown -R $USER:$USER src/
chmod -R 755 src/

# Create .env file for Laravel
if [ ! -f "src/.env" ]; then
    cp src/.env.example src/.env
    
    # Update database configuration
    sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=mysql/' src/.env
    sed -i 's/DB_HOST=127.0.0.1/DB_HOST=mysql/' src/.env
    sed -i 's/DB_PORT=3306/DB_PORT=3306/' src/.env
    sed -i 's/DB_DATABASE=laravel/DB_DATABASE=laravel/' src/.env
    sed -i 's/DB_USERNAME=root/DB_USERNAME=laravel/' src/.env
    sed -i 's/DB_PASSWORD=/DB_PASSWORD=laravel_password/' src/.env
    
    # Update Redis configuration
    sed -i 's/REDIS_HOST=127.0.0.1/REDIS_HOST=redis/' src/.env
    sed -i 's/REDIS_PORT=6379/REDIS_PORT=6379/' src/.env
    
    # Update session and cache drivers
    sed -i 's/SESSION_DRIVER=file/SESSION_DRIVER=redis/' src/.env
    sed -i 's/CACHE_DRIVER=file/CACHE_DRIVER=redis/' src/.env
    sed -i 's/QUEUE_CONNECTION=sync/QUEUE_CONNECTION=redis/' src/.env
fi

echo "Setup complete!"
echo ""
echo "Directory structure:"
echo "├── docker-compose.yml"
echo "├── docker/"
echo "│   ├── nginx/"
echo "│   │   ├── nginx.conf"
echo "│   │   └── default.conf"
echo "│   ├── php/"
echo "│   │   ├── Dockerfile"
echo "│   │   └── php.ini"
echo "│   └── mysql/"
echo "│       └── my.cnf"
echo "└── src/ (Laravel project)"
echo ""
echo "To start the application:"
echo "1. docker-compose up -d"
echo "2. docker-compose exec php composer install"
echo "3. docker-compose exec php php artisan key:generate"
echo "4. docker-compose exec php php artisan migrate"
echo ""
echo "Access your application at: http://localhost"
echo ""
echo "Useful commands:"
echo "- docker-compose logs -f                    # View logs"
echo "- docker-compose exec php php artisan ...  # Run artisan commands"
echo "- docker-compose exec php composer ...     # Run composer commands"
echo "- docker-compose down                       # Stop containers"
echo "- docker-compose down -v                    # Stop and remove volumes"
echo ""
echo "Database connection:"
echo "- Host: localhost"
echo "- Port: 3306"
echo "- Database: laravel"
echo "- Username: laravel"
echo "- Password: laravel_password"
echo ""
echo "Redis connection:"
echo "- Host: localhost"
echo "- Port: 6379"