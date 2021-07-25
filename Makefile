all:		dc-build

dc-build:
			cd ./srcs/ && docker-compose up -d

re:
			cd ./srcs/ && docker-compose up --build -d

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
			sudo rm -rf /home/bwayfare/data/wordpress/* /home/bwayfare/data/database/*
			docker volume rm $$(docker volume ls -q)

rmn:
			docker network rm $$(docker network ls -q)

logs:
			cd ./srcs/ && docker-compose logs -f

info:
			@echo "++++++++++++++++++++++++++++IMAGES++++++++++++++++++++++++++++"
			docker images 
			@echo ""
			@echo "++++++++++++++++++++++++++CONTAINERS++++++++++++++++++++++++++"
			cd ./srcs/ && docker-compose ps
			@echo ""
			@echo "++++++++++++++++++++++STOPING CONTAINERS++++++++++++++++++++++"
			docker ps -a
			@echo ""
			@echo "+++++++++++++++++++++++++++VOLUMES++++++++++++++++++++++++++++"
			docker volume ls
			@echo ""
			@echo "+++++++++++++++++++++++++++NETWORKS+++++++++++++++++++++++++++"
			docker network ls


.PHONY: all rm rmi ps down stop logs rmv rmn info re
