FROM composer:2.1 AS composer
FROM php:8.1-fpm as base

RUN apt update && \
    apt install -y --no-install-recommends git openssh-client unzip supervisor --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install bcmath mysqli pdo pdo_mysql exif

COPY php.ini $PHP_INI_DIR/conf.d/php.ini

WORKDIR /src

ENV PATH="$PATH:/src/vendor/bin"
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY composer.* ./
RUN composer install --no-scripts --no-autoloader --no-interaction --no-dev


FROM base as prod
COPY . ./
RUN chgrp -R www-data storage bootstrap/cache && chmod -R ug+rwx storage bootstrap/cache \
    && composer dump-autoload --optimize

FROM base as dev
RUN composer install --no-scripts --no-autoloader --no-interaction --dev


COPY . ./
RUN chgrp -R www-data storage bootstrap/cache && chmod -R ug+rwx storage bootstrap/cache \
    && composer dump-autoload --optimize
