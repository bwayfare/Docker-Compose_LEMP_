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
			docker rmi -f srcs_mysql_svc srcs_wordpress_svc srcs_nginx_svc

rmv:
			docker volume rm $$(docker volume ls -q)

logs:
			cd ./srcs/ && docker-compose logs -f

info:
			@echo "++++++++++++++ IMAGES ++++++++++++++ "
			docker images 
			@echo ""
			@echo "++++++++++++++ DOCKER PS ++++++++++++++ "
			cd ./srcs/ && docker-compose ps && docker ps -a
			@echo ""
			@echo "++++++++++++++ VOLUMES ++++++++++++++ " 
			docker volume ls
			@echo ""
			@echo "++++++++++++++ NETWORKS ++++++++++++++" 
			docker network ls


.PHONY: all nginx wordpress docker-build rm rmi ps down stop logs rmv info
