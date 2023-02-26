FROM php:8.0-apache

USER root

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN a2enmod rewrite

COPY composer.json .

RUN composer install

COPY . .

EXPOSE 80

CMD ["apache2-foreground"]
