FROM composer:2 as builder

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install --no-dev --no-scripts --optimize-autoloader

FROM php:8.4-fpm-alpine
WORKDIR /var/www/html

RUN apk add --no-cache libpng-dev libzip-dev zip unzip \
    && docker-php-ext-install pdo_mysql bcmath zip

COPY --from=builder /app/vendor ./vendor
COPY . .
