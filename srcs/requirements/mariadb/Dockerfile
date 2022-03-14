FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY tools/script.sh script.sh

RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.cnf

ENTRYPOINT ["/bin/bash", "-x", "script.sh"]
