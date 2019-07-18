FROM php:7.2-cli

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip

RUN docker-php-ext-install zip

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get install nano

RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

WORKDIR var/www/html
