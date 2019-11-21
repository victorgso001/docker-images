FROM php:7.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
        bash \
        sudo \
        nano \
        vim \
        nginx \
        curl \
        libpng-dev \
        supervisor \
        curl \
        openssl \
        pngquant

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 www-data
RUN useradd -u 1000 -ms /bin/bash -g www-data www-data

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www-data

# Change current user to www
USER www-data

# Expose port and start php-fpm server
EXPOSE 9000

#Executando comandos para iniciar
CMD ["php-fpm"]