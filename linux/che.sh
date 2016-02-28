#########################################################################
# File Name: ./che.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Tue 12 Jan 2016 01:11:11 PM CST
#########################################################################
#!/bin/bash

docker rm -f che
#docker run --privileged --name che -it --net=host -p 8380:8080 -p 32768-32788:32768-32788 codenvy/che 
docker run --privileged --name che -it --net=host codenvy/che 
