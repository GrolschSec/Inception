# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlouvrie <rlouvrie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/21 17:28:40 by rlouvrie          #+#    #+#              #
#    Updated: 2023/12/04 23:08:34 by rlouvrie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE := srcs/docker-compose.yaml

COMPOSE := docker compose -f $(COMPOSE_FILE)

all: up

up:
	@mkdir -p ${HOME}/data
	@mkdir -p ${HOME}/data/mariadb
	@mkdir -p ${HOME}/data/wordpress
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs

ssh:
	$(COMPOSE) exec $(service) /bin/bash

clean:
	$(COMPOSE) down --volumes
	docker system prune -a -f --volumes

fclean: clean
	sudo rm -rf ${HOME}/data

.PHONY: all up stop ps logs ssh clean fclean
