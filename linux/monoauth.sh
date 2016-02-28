#########################################################################
# File Name: monoauth.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Sun 24 Jan 2016 10:54:26 PM CST
#########################################################################
#!/bin/bash

docker rm -f mon
docker run -d -p 27017:27017 -p 28017:28017 --net=host -v /home/share/db/:/data/db/ -e AUTH=non --name mon tutum/mongodb:3.0
sleep 3 
docker ps -a
