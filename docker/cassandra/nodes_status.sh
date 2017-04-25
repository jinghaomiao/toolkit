#!/bin/bash

CONTAINER=cassandra
docker exec -i -t cassandra nodetool status
