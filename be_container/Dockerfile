FROM php:7.2-apache

ENV PATH /usr/local/bin:$PATH

# install php and apahce2 modules
RUN docker-php-ext-install pdo_mysql \
  && a2enmod headers \
  && a2enmod rewrite 

# copy source files
COPY --chown="www-data:www-data" ./build/app/be/ /var/www/html/

COPY ./be_container/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["bash", "docker-entrypoint.sh"]
CMD ["apache2-foreground"]
