FROM php:7.4-apache

# Update package lists
RUN apt-get update

# Install PECL extensions
RUN pecl install xdebug-3.0.1 \
    && docker-php-ext-enable xdebug

# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql