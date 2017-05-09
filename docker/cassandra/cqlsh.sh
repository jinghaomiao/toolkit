#!/bin/bash

CONTAINER=cassandra
docker exec -i -t ${CONTAINER} /usr/bin/cqlsh
