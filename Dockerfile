FROM php:8.0.0-fpm-buster

ENV TZ=America/Recife

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt update && apt install -y --no-install-recommends apt-utils && apt upgrade -y

RUN apt install -y \
    bash \
    curl \ 
    nano \
    nginx \
    libxrender1 \
    libfontconfig1 \
    libxtst6 \
    supervisor

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd xdebug imagick mbstring soap zip curl mongodb

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Configurando Nginx
RUN curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/victorgso001/docker-images/php-fpm-nginx/nginx.conf

#Configurando supervisor
RUN curl -o /etc/supervisord.conf https://raw.githubusercontent.com/victorgso001/docker-images/php-fpm-nginx/supervisord.conf

#Criando diretório de aplicação
RUN mkdir -p /app

#Adicionando www-data como usuário
RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 www-data www-data && exit 0 ; exit 1 \
  usermod -aG www-data www-data

WORKDIR /app

EXPOSE 80 443

#Executando comandos para iniciar
CMD /usr/bin/supervisord -c /etc/supervisord.conf
