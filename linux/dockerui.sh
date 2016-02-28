#########################################################################
# File Name: rabbitmq.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Sat Nov 28 17:10:20 2015
#########################################################################
#!/bin/bash

docker rm -f dockerui
docker run -d --net=host -p 9000:9000 --name dockerui --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui
sleep 3
docker ps -a
