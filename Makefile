COMPOSE_FILE=srcs/docker-compose.yml

all: images
	sudo docker-compose -f $(COMPOSE_FILE) up -d

stop:
	sudo docker-compose -f $(COMPOSE_FILE) down

images: .mariadb .wordpress .nginx

.wordpress:
	sudo docker build -t wordpress srcs/requirements/wordpress/
	touch $@

.mariadb:
	sudo docker build -t mariadb srcs/requirements/mariadb/
	touch $@

.nginx:
	sudo docker build -t nginx srcs/requirements/nginx/
	touch $@

clean: stop
	rm -rf .nginx .wordpress .mariadb
	docker volume rm $(docker volume ls -q) || echo no volumes

re: clean build

.PHONY: clean re
