#!/bin/sh

mkdir mysql_data
docker run --name mysql0 -v $PWD/mysql_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=docAQ123 -d mysql:5.7

echo "Current existing instances:"
docker ps -a

