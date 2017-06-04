FROM php:7.0.6-fpm-alpine

MAINTAINER Michael Alexnander <michael@micalexander.com>

RUN apk add --update \
    vim \
    alpine-sdk \
    libpng-dev \ 
    yaml-dev \
    autoconf \
    curl-dev \
    libxml2-dev \
 && rm -rf /var/cache/apk/*

RUN docker-php-ext-install -j $(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    iconv gd mbstring fileinfo curl xmlreader xmlwriter spl ftp mysqli

RUN pecl install yaml-beta

RUN pecl install yaml-2.0.0 && echo "extension=yaml.so" > /usr/local/etc/php/conf.d/ext-yaml.ini

USER nobody

