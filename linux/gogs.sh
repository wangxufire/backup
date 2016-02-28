#########################################################################
# File Name: rabbitmq.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Sat Nov 28 17:10:20 2015
#########################################################################
#!/bin/bash

docker rm -f gs
docker run -d -v /home/share/gogs:/data -p 10022:22 -p 3000:3000 --name gs gogs/gogs:0.8.25
sleep 3
docker ps -a
