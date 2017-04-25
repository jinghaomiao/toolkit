#!/bin/bash

CONTAINER=$1
docker exec -i -t ${CONTAINER} /bin/bash
