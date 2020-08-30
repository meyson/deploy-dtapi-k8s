FROM php:7.2-apache

# install php and apahce2 modules
RUN docker-php-ext-install pdo_mysql \
  && a2enmod headers \
  && a2enmod rewrite 

# copy source files
COPY --chown="www-data:root" ./build/app/be/ /var/www/html/
