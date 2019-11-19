#Usando alpine, pois é uma distro menor e só com as coisas
#necessárias para a utilização
FROM alpine:3.9

#Instalando os pacotes necessários
RUN apk --update add --no-cache \
        sudo \
        nano \
        vim \
        bash \
        nginx \
        curl \
        libpng \
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
        php7-xmlwriter

RUN apk add --virtual build-dependencies \
    build-base \
    bash libpng-dev

# pngquant
RUN curl -L -O https://github.com/ImageOptim/libimagequant/archive/2.9.1.tar.gz
RUN tar xzf 2.9.1.tar.gz
RUN curl -L -O https://github.com/pornel/pngquant/archive/2.8.0.tar.gz
RUN tar xzf 2.8.0.tar.gz
RUN mv libimagequant-2.9.1/* pngquant-2.8.0/lib/
RUN cd pngquant-2.8.0
RUN ./configure && make && make install

RUN apk --no-cache add shadow && usermod -aG www-data nginx

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

#Executando comandos para iniciar
CMD /usr/bin/supervisord -c /etc/supervisord.conf
