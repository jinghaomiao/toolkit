#!/bin/sh

WWW_HOME=$1

docker run --name=php0 -d --link mysql0:mysql -v $WWW_HOME:/var/www/html php:7.0-apache
