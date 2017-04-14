#!/bin/sh

sudo docker run -d --restart=always --name=splash -p 5023:5023 -p 8050:8050 -p 8051:8051 scrapinghub/splash

echo "Current existing instances:"
docker ps -a
