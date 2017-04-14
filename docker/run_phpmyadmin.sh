#!/bin/sh

echo "Please start mysql server first."

docker run --name phpmyadmin -d --restart=always --link mysql:db -p 8080:80 phpmyadmin/phpmyadmin

echo "Current existing instances:"
docker ps -a
