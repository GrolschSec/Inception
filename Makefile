# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlouvrie <rlouvrie@student.42.fr >         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/21 17:28:40 by rlouvrie          #+#    #+#              #
#    Updated: 2023/10/31 14:45:14 by rlouvrie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE := srcs/docker-compose.yaml

COMPOSE := docker-compose -f $(COMPOSE_FILE)

all: build up

build:
	@mkdir -p ${HOME}/data
	@mkdir -p ${HOME}/data/mariadb
	@mkdir -p ${HOME}/data/wordpress
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs

ssh:
	$(COMPOSE) exec $(service) /bin/bash

validate:
	$(COMPOSE) config --quiet

restart:
	$(COMPOSE) up -d --no-deps --build $(service)

clean:
	$(COMPOSE) down -v
	$(COMPOSE) down --volumes
	docker system prune -a -f --volumes

fclean: clean
	sudo rm -rf ${HOME}/data

.PHONY: all build up up-fg stop down ps logs ssh validate restart clean fclean
