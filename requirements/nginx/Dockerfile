FROM debian:buster

RUN apt update -y && apt install -y nginx && \
    mkdir -p /var/www/example.com/html /etc/nginx/ssl && \
    rm /etc/nginx/sites-enabled/default
COPY index.html /var/www/example.com/html/
COPY example.com /etc/nginx/sites-available
COPY nginx.conf /etc/nginx/nginx.conf
COPY example.com.pem example.com-key.pem etc/nginx/ssl/
RUN ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled

ENTRYPOINT nginx -g 'daemon off;'

EXPOSE 443