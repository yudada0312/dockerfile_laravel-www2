FROM php:7.2.14-fpm-alpine3.8
LABEL maintainer="yudada <yudada0312@gmail.com>"

RUN apk update && apk upgrade && apk add bash git
COPY php.ini /usr/local/etc/php
COPY entrypoint2.sh /var

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN chmod u+x /var/entrypoint2.sh

WORKDIR /var/www/html
CMD ["/bin/sh", "-c","/var/entrypoint2.sh"]
