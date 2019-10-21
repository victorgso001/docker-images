#Usando alpine, pois é uma distro menor e só com as coisas
#necessárias para a utilização
FROM alpine:3.9

#Instalando os pacotes necessários
RUN apk --update add --no-cache \
        sudo \
        nano \
        vim \
        bash \
        nodejs \
        npm
        

#Limpando o cache das instalações, removendo coisas
#desnecessárias no container
RUN rm -Rf /var/cache/apk/*

RUN npm install -g swagger-ui-preview

