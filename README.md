Inception

1) Для работы данного проекта, вам потребуется Docker, Docker-compose и make

2) Ваш пользователь должен находится в группе docker для этого требуется выполнить sudo usermod -aG docker $USER

3) Вам необходимо создать каталоги следующей командой mkdir -p /home/$USER/data/wordpress /home/$USER/data/database

4) В корне находится Makefile для запуска вам достаточно написать make или make all. Ниже перечислены все команды для make:
    - re: выполнится пересборка образов с дальнешим запуском контейнеров в фоне
    - down: остановка всех созданных контейнеров с дальнейшим их удалением, также удаляется создаваемый network
    - stop: остановка всех контейнеров
    - ps: показать все запущенный контейнеры через docker-compose
    - rm: удаление всех созданных, через docker-compose, контейнеров
    - rmi: удаление всех images
    - rmv: очистка всех Volumes и очистка каталогов созданных в 3 пункте
    - rmn: удаление всех созданных networks
    - logs: просмотр логов работы docker-compose
    - info: суммарная информация по Containers, Stoping containers, Images, Networks, Volumes

5) Также Вы можете проинициализировать свои переменные в .env фале, который находится в директории srcs

6) Вам потребуется отредактировать /etc/hosts добавив следующую строку 127.0.0.1 bwayfare.42.fr

7) Сайт находится по адресу bwayfare.42.fr или 127.0.0.1