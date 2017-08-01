#!/usr/bin/env bash

docker images | grep '^<none>' | xargs docker rmi
