#!/bin/bash

CONTAINER=cassandra
docker exec -i -t ${CONTAINER} nodetool status
