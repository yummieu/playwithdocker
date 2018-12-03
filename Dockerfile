FROM ubuntu:latest
MAINTAINER Yurii Makukha <makuha.yura@gmail.com>

RUN apt-get -yqq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install php nodejs npm curl php-cli php-mbstring git unzip php-xml php-mysql mysql-server

# install composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/laravel

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0"]