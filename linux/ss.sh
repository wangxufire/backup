#########################################################################
# File Name: ./che.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Tue 12 Jan 2016 01:11:11 PM CST
#########################################################################
#!/bin/bash

docker rm -f sss
docker run -d -p 8888:1984 --name ss oddrationale/docker-shadowsocks -s 0.0.0.0 -p 1984 -k madoka -m aes-256-cfb
sleep 3
docker ps -a
