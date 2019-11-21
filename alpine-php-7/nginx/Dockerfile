FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

RUN apk --update add --no-cache\
        bash \
        sudo \
        nano \
        vim \
        curl

# Clear cache
RUN rm -Rf /var/cache/apk/*

#Configurando Nginx
RUN curl -o /etc/nginx/conf.d/default.conf https://raw.githubusercontent.com/victorgso001/docker-images/master/alpine-php-7/nginx/nginx.conf
