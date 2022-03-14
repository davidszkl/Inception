FROM debian:buster

RUN apt-get update  -y &&	\
	apt-get upgrade -y &&	\
	apt-get install -y mariadb-server

COPY tools/script.sh script.sh

RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.cnf

ENTRYPOINT ["/bin/bash", "-x", "script.sh"]
