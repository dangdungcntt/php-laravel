FROM php:7.1-fpm

# Install PHP and composer dependencies
RUN apt-get update \
    && apt-get install \
       nano \
       iputils-ping \
       unzip \
       git \
       libaspell-dev \
       libbz2-dev \
       libexpat1-dev \
       libfreetype6-dev \
       libgmp3-dev \
       libicu-dev \
       libldap2-dev \
       libjpeg-dev \
       libxml2-dev \
       libcurl4-openssl-dev pkg-config libssl-dev \
       -y --no-install-recommends

# Install needed extensions
# Here you can install any other extension that you need during the test and deployment process
RUN docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache && pecl install mongodb && docker-php-ext-enable mongodb

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel Envoy
RUN composer global require "laravel/envoy"
