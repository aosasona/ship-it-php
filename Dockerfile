FROM php:8.0-apache

USER root

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

RUN a2enmod rewrite

COPY composer.json .

RUN composer install

COPY . .

EXPOSE 80

CMD ["apache2-foreground"]
