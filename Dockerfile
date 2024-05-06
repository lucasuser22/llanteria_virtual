FROM php:8.2.15-apache
COPY /src /var/www/html
EXPOSE 80
RUN apt-get update && apt-get install -y php-mysqli