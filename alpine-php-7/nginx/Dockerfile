FROM nginx

RUN rm /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y\
        bash \
        sudo \
        nano \
        vim \
        curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#Configurando Nginx
RUN curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/victorgso001/docker-images/master/alpine-php-7/nginx.conf
