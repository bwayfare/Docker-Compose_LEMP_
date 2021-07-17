all:		dc-build

docker-build:	d-nginx d-wordpress d-mysql

nginx:
			docker build --tag nginx ./srcs/nginx

wordpress:
			docker build --tag wordpress ./srcs/wordpress

mysql:
			docker build --tag mariadb ./srcs/mariaDB

dc-build:
			cd ./srcs/ && docker-compose up -d

ps:
			cd ./srcs/ && docker-compose ps

stop:
			cd ./srcs/ && docker-compose stop

down:
			cd ./srcs/ && docker-compose down

rm:
			docker rm $$(docker ps -qa)

rmi:
			docker rmi -f $$(docker images -q)

rmv:
			docker volume rm $$(docker volume ls -q)

logs:
			cd ./srcs/ && docker-compose logs -f

.PHONY: all nginx wordpress docker-build rm rmi ps down stop logs rmv
