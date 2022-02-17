FROM debian:buster

RUN apt update && apt install -y mariadb-server vim

COPY ./tools/script.sh ./

RUN mkdir -p /var/lib/mysql &&\
    chown -R mysql:mysql /var/lib/mysql &&\
    mysql_install_db &&\
    chmod +x ./script.sh

COPY ./my.cnf /etc/

EXPOSE 3306

CMD ["sh", "script.sh"]
