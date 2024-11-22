all:
	docker compose -f srcs/docker-compose.yml up --build -d

build:
	docker compose -f srcs/docker-compose.yml build

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v

fclean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v \
	&& rm -rf /Users/takimotoshiho/data/v-db/* /Users/takimotoshiho/data/v-wordpress/*
ps:
	docker compose -f srcs/docker-compose.yml ps

prune:
	docker system prune --volumes

logs:
	docker compose -f srcs/docker-compose.yml logs

.PHONY: all build up down clean fclean ps prune logs