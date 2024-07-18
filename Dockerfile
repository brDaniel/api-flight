FROM php:8.2-apache

RUN apt-get update && apt-get install -y git unzip \
    && pecl install \
        apcu \
        xdebug \
        redis \
    && docker-php-ext-enable \
        apcu \
        xdebug \
        redis

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
WORKDIR /var/www/html/
RUN a2enmod rewrite
RUN service apache2 restart

COPY composer.json .
RUN composer install
COPY . ./

EXPOSE 80
