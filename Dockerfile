FROM php:7.0-cli
RUN apt-get update
RUN apt-get install -y libzip-dev zlib1g-dev
RUN pecl install zip
RUN docker-php-ext-install zip
RUN php -r "copy('https://getcomposer.org/installer', '/composer-setup.php');"
RUN php /composer-setup.php --install-dir=/usr/local/bin --filename=composer
ADD . /app
WORKDIR /app