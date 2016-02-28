#########################################################################
# File Name: ./che.sh
# Author: liyue
# mail: liyue@hd123.com
# Created Time: Tue 12 Jan 2016 01:11:11 PM CST
#########################################################################
#!/bin/bash

docker rm -f pl
docker run --name pl -d --publish 5432:5432 --restart=always -e 'DB_NAME=git' -e 'DB_USER=admin' -e 'DB_PASS=admin' -v /home/share/gitlab/db:/var/lib/postgresql sameersbn/postgresql

docker rm -f rd
docker run --name rd -d --publish 6379:6379 --restart=always -v /home/share/gitlab/cache:/var/lib/redis sameersbn/redis

docker rm -f git
docker run --name git -d  --restart=always -e 'DB_ADAPTER=postgresql' -e 'DB_HOST=172.17.2.71'  -e 'DB_NAME=git' -e 'DB_USER=admin' -e 'DB_PASS=admin' -e 'REDIS_HOST=172.17.2.71' -e 'REDIS_PORT=6379' -e 'GITLAB_HOST=172.17.2.71' -e 'GITLAB_PORT=3000' -e 'GITLAB_SSH_PORT=10022' -e 'GITLAB_SECRETS_DB_KEY_BASE=XfRVX6CxZW4qCXfkDh8HFs6jvlZWKkC5MwXsfTbqSNPh4mN59q7MPWBJkflHPzCR' --publish 10022:22 --publish 3000:80 -v /home/share/gitlab/git:/home/git/data sameersbn/gitlab

docker ps -a
