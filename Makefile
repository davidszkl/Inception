SHELL=/bin/bash
certificate=./srcs/requirements/nginx/conf/certificate.crt
key=./srcs/requirements/nginx/conf/private.key
mkcertdir=./srcs/requirements/nginx/tools/mkcert
mkcert=$(mkcertdir)/mkcert
yml=srcs/docker-compose.yml

run: build
	sudo docker-compose -f $(yml) up -d

stop:
	sudo docker-compose -f $(yml) down

build: .mariadb_done .wordpress_done .nginx_done 

.wordpress_done:
	sudo docker build -t wordpress_im srcs/requirements/wordpress/
	touch $@

.mariadb_done:
	sudo docker build -t mariadb_im srcs/requirements/mariadb/
	touch $@

.nginx_done: $(certificate) $(key)
	sudo docker build -t nginx_im srcs/requirements/nginx/
	touch $@

$(key): $(certificate)

$(certificate): $(mkcert)
	touch $(certificate) $(key)
	$(mkcert) -cert-file $(certificate) -key-file $(key) localhost 127.0.0.1 dszklarz.42.fr

$(mkcert):
	cd $(mkcertdir) && go build -ldflags "-X main.Version=$(git describe --tags)"
	$(mkcert) -install

clean: stop
	rm -rf .nginx_done .wordpress_done .mariadb_done
	rm -rf $(certificate) $(key)
	rm -rf $(mkcert)

### need sudo privileges ###
host:
	echo "127.0.0.1 dszklarz.42.fr" >> /etc/hosts

cleanhost:
	sed -i 's/127\.0\.0\.1 dszklarz.42.fr//g' /etc/hosts

volumes:
	mkdir -p /home/dszklarz/data/mariadb_volume
	mkdir -p /home/dszklarz/data/wordpress_volume

cleanvolumes:
	rm -rf /hone/mlefeve/data/mariadb_volume
	rm -rf /hone/mlefeve/data/wordpress_volume
	docker volume rm $(docker volume ls -q) || echo no volume to be deleted
## --- ###

re: clean build

rerun: clean run

.PHONY: clean re rerun build run stop host cleanhost volumes cleanvolumes
