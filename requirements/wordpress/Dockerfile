FROM    alpine:3.13.4

RUN apk -U upgrade && apk add	php7 \
	php7-fpm			\
	php7-phar			\
    php7-json			\
    php7-mysqli			\
    php7-curl			\
    php7-iconv			\
    php7-pecl-mailparse	\
    curl				\
    mariadb-client		\
    bash                \
    vim

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar &&	\
	cp wp-cli.phar /usr/bin/wp 

WORKDIR /var/www/wordpress
RUN     wp core download

RUN	    adduser -S nginx &&	\
		addgroup -S nginx

RUN		mkdir /var/log/php-fpm 

COPY	./config/php-fpm.conf /etc/php7/php-fpm.conf
COPY	./config/www.conf /etc/php7/php-fpm.d/www.conf
COPY	./config/wp-config.php ./
COPY    ./tools/script.sh ./

RUN     chmod +x script.sh

CMD  [ "sh", "./script.sh" ]
#CMD  [ "sleep", "infinity" ]