FROM debian:buster

RUN apt update && apt install -y mariadb-server vim procps

COPY ./tools/script.sh ./

RUN mkdir -p /var/lib/mysql &&\
    chown -R mysql:mysql /var/lib/mysql &&\
    mysql_install_db &&\
    chmod +x ./script.sh &&\
    sed -i 's/.*bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./my.cnf /etc/

EXPOSE 3306

#CMD ["sleep", "infinity"]
CMD ["sh", "script.sh"]
