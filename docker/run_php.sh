#!/bin/sh

echo "Please start mysql server first."

WWW_HOME=$1
docker run --name=php -d --restart=always -p 80:80 --link mysql:mysql -v $WWW_HOME:/var/www/html php:7.0-apache

echo "Current existing instances:"
docker ps -a
