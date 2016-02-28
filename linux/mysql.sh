#########################################################################
# File Name: rabbitmq.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Sat Nov 28 17:10:20 2015
#########################################################################
#!/bin/bash

docker rm -f ml
#docker run -d --net=host --name ml -v /home/share/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root mysql
docker run -d --net=host --name ml --restart=always -v /home/share/mysql:/var/lib/mysql mysql
sleep 2
docker ps -a
