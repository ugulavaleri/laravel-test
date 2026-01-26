FROM php:8.4-fpm

WORKDIR /var/www/html

COPY ./src .

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql zip exif pcntl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

