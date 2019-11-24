#Usando alpine, pois é uma distro menor e só com as coisas
#necessárias para a utilização
FROM php:7.2-fpm-alpine3.10

#Definindo diretório de trabalho
WORKDIR /home/project-folder

#Instalando os pacotes necessários
RUN apk --update add --no-cache \
        sudo \
        nano \
        bash \
        nginx \
        curl \
        supervisor \
        php7 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-fpm \
        php7-json \
        php7-mbstring \
        php7-mysqlnd \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-mcrypt \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-session \
        php7-tokenizer \
        php7-xml \
        php7-xmlwriter \
        libzip-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# We have to pull mongodb from the edge repository for now
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing php7-mongodb

#Limpando o cache das instalações, removendo coisas
#desnecessárias no container
RUN rm -Rf /var/cache/apk/*

#Instalando composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

#Configurando Nginx
RUN curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/victorgso001/docker-images/alpine-php/alpine-php-7/nginx.conf

#Configurando supervisor
RUN curl -o /etc/supervisord.conf https://raw.githubusercontent.com/victorgso001/docker-images/alpine-php/alpine-php-7/supervisord.conf

RUN curl -o /etc/php7/php-fpm.d/zzz_custom.conf https://raw.githubusercontent.com/victorgso001/docker-images/alpine-php/alpine-php-7/fpm-pool.conf

#Criando diretório de aplicação
RUN mkdir -p /home/project-folder

# Copy existing application directory contents
COPY . /home/project-folder/

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /home/project-folder

# Change current user to www
USER www-data

#Expondo as portas
EXPOSE 80 443 9000

#Executando comandos para iniciar
CMD ["php-fpm"]
