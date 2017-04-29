#!/bin/bash

WWW_HOME=$(realpath $1)
docker run --name=php -d --restart=always -p 80:80 -v $WWW_HOME:/var/www/html php:7.1-apache

echo "Current existing instances:"
docker ps -a
