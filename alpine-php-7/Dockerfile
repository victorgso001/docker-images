FROM php:7.2-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y\
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

#Configurando Nginx
RUN curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/victorgso001/docker-images/master/alpine-php-7/nginx.conf

#Configurando supervisor
RUN curl -o /etc/supervisord.conf https://raw.githubusercontent.com/victorgso001/docker-images/master/alpine-php-7/supervisord.conf

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=www:www . /var/www

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 80 443

#Executando comandos para iniciar
CMD /usr/bin/supervisord -c /etc/supervisord.conf