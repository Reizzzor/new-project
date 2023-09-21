# Используем официальный образ PHP
FROM php:8.1-fpm

# Установка Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Устанавливаем git и unzip (необходимы для некоторых Composer-пакетов)
RUN apt-get update && apt-get install -y git unzip