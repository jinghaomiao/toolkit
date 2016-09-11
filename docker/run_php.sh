#!/bin/sh

echo "Please start mysql server first."

WWW_HOME=$1
docker run --name=php0 -d -p 80:80 --link mysql0:mysql -v $WWW_HOME:/var/www/html php:7.0-apache

echo "Current existing instances:"
docker ps -a

