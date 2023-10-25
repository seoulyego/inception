VOLUME_DIR		:=	/home/yeongo/data
DOCKER_COMPOSE		:=	docker-compose
DOCKER_COMPOSE_FILE	:=	./srcs/docker-compose.yml
PROJECT_NAME		:=	Inception
NETWORK_NAME		:=	network-inception

.PHONY: all
all:
	@mkdir -p $(VOLUME_DIR)/db
	@mkdir -p $(VOLUME_DIR)/wordpress
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build -d

log:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs

.PHONY: up
up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

.PHONY: down
down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

.PHONY: clean
clean: down
	docker system prune -f --all # Remove all unused images not just dangling ones

.PHONY: fclean
fclean: clean
	@sudo rm -rf $(VOLUME_DIR)/db
	@sudo rm -rf $(VOLUME_DIR)/wordpress
	@docker volume rm $$(docker volume ls -q)

.PHONY: re
re: fclean
	make all
