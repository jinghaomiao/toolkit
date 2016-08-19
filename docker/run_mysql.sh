#!/bin/sh

docker pull mysql && \
mkdir mysql_data && \
docker run --name mysql0 -v $PWD/mysql_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=docker -d mysql:5.7
