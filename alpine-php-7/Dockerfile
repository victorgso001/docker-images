#Usando alpine, pois é uma distro menor e só com as coisas
#necessárias para a utilização
FROM php:7.2-fpm-alpine

#Instalando os pacotes necessários
RUN apk --update add --no-cache --virtual .ext-deps \
        autoconf \
        bash \
        curl \
        g++ \
        icu-dev \
        make \
        nano \
        nginx \
        php7 \
        sudo \
        supervisor \
        vim

#Limpando o cache das instalações, removendo coisas
#desnecessárias no container
RUN rm -Rf /var/cache/apk/*

#Instalando composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer


RUN \
    apk add --no-cache --virtual .mongodb-ext-build-deps openssl-dev pcre-dev
# RUN pecl install mongodb-1.2.5
# RUN docker-php-ext-enable mongodb

RUN \
    pecl install mongodb && \
    apk del .mongodb-ext-build-deps && \
    pecl clear-cache && \
    docker-php-ext-enable mongodb && \
    docker-php-source delete

RUN mkdir /home/app

# Set working directory
WORKDIR /home/app/

#Expondo as portas
EXPOSE 9000

#Executando comandos para iniciar
CMD ["php-fpm"]
