#Usando alpine, pois é uma distro menor e só com as coisas
#necessárias para a utilização.
FROM alpine:3.9

#Instalando os pacotes necessários
ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add --no-cache \
        bash \
        sudo \
        nano \
        vim \
        bash \
        nginx \
        nodejs \
        npm \
        curl \
        lcms2-dev \
        libpng-dev \
        supervisor \
        php \
        php-ctype \
        php-curl \
        php-dom \
        php-fpm \
        php-gd \
        php-json \
        php-mbstring \
        php-mysqlnd \
        php-pdo_mysql \
        php-pdo_pgsql \
        php-opcache \
        php-openssl \
        php-pdo \
        php-pdo_mysql \
        php-pdo_pgsql \
        php-pdo_sqlite \
        php-phar \
        php-session \
        php-tokenizer \
        php-xml \
        php-xmlwriter

RUN apk add --virtual build-dependencies \
    build-base \
    bash libpng-dev

# pngquant
RUN npm install --global pngquant-bin --unsafe-perm=true --allow-root

# RUN adduser -u 1000 -D -S -G www-data www-data

# RUN apk --no-cache add shadow && usermod -aG www-data nginx

#Limpando o cache das instalações, removendo coisas
#desnecessárias no container
RUN rm -Rf /var/cache/apk/*

#Instalando composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

#Configurando Nginx
RUN curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/victorgso001/docker-images/master/alpine-php-7/nginx.conf

#Configurando supervisor
RUN curl -o /etc/supervisord.conf https://raw.githubusercontent.com/victorgso001/docker-images/master/alpine-php-7/supervisord.conf

#Criando diretório de aplicação
RUN mkdir -p /app

#Definindo diretório de trabalho
WORKDIR /app

#Expondo as portas
EXPOSE 80 443

RUN adduser -D -G www-data -u ${USER_ID:-1000} laravel-user

USER laravel-user

#Executando comandos para iniciar
CMD /usr/bin/supervisord -c /etc/supervisord.conf
