FROM composer:2 as builder

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install --no-dev --no-scripts --optimize-autoloader

FROM php:8.4-fpm-alpine
WORKDIR /var/www/html

RUN apk add --no-cache libpng-dev libzip-dev zip unzip \
    && docker-php-ext-install pdo_mysql bcmath zip gd exif pcntl

COPY . .

COPY --from=builder /app/vendor ./vendor

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

