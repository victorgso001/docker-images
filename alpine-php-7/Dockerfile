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
        php7-xml

#Limpando o cache das instalações, removendo coisas
#desnecessárias no container
RUN rm -Rf /var/cache/apk/*

#Instalando composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

#Configurando Nginx
COPY nginx.conf /etc/nginx/nginx.conf

#Configurando supervisor
COPY supervisord.conf /etc/supervisord.conf

#Criando diretório de aplicação
RUN mkdir -p /app

#Definindo diretório de trabalho
WORKDIR /app

#Expondo as portas
EXPOSE 80 443

#Executando comandos para iniciar
CMD /usr/bin/supervisord -c /etc/supervisord.conf
