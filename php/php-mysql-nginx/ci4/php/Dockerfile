FROM php:8.2-fpm

# Install mysqli extension
# RUN docker-php-ext-install mysqli

RUN apt-get update && apt-get install -y \
    libicu-dev \
    zip unzip \
    && docker-php-ext-install intl pdo pdo_mysql mysqli
