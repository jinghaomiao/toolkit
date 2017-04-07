#!/bin/sh

echo "Please start mysql server first."

docker run --name phpmyadmin0 -d --restart=always --link mysql0:db -p 8080:80 phpmyadmin/phpmyadmin

echo "Current existing instances:"
docker ps -a

