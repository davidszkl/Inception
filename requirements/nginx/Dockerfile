FROM debian:buster

EXPOSE 443

RUN apt update -y && apt install -y nginx && \
    mkdir -p /var/www/dszklarz.42.fr/public_html /etc/nginx/ssl && \
    rm /etc/nginx/sites-enabled/default

COPY ./dszklarz.42.fr /etc/nginx/sites-available
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY dszklarz.42.fr.pem dszklarz.42.fr-key.pem etc/nginx/ssl/

RUN ln -s /etc/nginx/sites-available/dszklarz.42.fr /etc/nginx/sites-enabled

ENTRYPOINT nginx -g 'daemon off;'
