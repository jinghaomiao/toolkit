#!/usr/bin/env bash

# Credit to https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
echo "Cleanup containers..."
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

echo "Cleanup images..."
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker images | grep '^<none>' | awk '{print $3}' | xargs docker rmi

echo "Cleanup volumes..."
docker volume rm $(docker volume ls -qf dangling=true)
