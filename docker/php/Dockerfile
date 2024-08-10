FROM php:8.1-fpm

RUN apt-get update && apt-get install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu pdo_mysql\
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /var/www/project
