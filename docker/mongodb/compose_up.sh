#!/usr/bin/env bash

nohup docker-compose -f stack.yml up &

# To stop:
#   docker-compose -f stack.yml stop
# To remvoe:
#   docker-compose -f stack.yml down
