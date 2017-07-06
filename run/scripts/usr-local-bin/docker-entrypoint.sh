#!/bin/sh

#docker system df
#docker system prune --all --force

echo  ">>> Deleting stopped containers"
docker ps --all --quiet -f 'status=exited' |xargs -r docker rm

echo  ">>> Deleting untagged images"
docker images -q -f dangling=true |xargs -r docker rmi

echo  ">>> Deleting unused networks"
docker network prune -f

echo  ">>> Deleting unused volumes"
docker volume prune -f

