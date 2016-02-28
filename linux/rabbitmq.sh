#########################################################################
# File Name: rabbitmq.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Sat Nov 28 17:10:20 2015
#########################################################################
#!/bin/bash

docker rm -f rb
docker run -d --net=host -p 5672:5672 -p 15672:15672 --name rb rabbitmq:3-management
sleep 3
docker ps -a
