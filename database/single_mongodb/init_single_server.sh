#!/usr/bin/env bash
# Make sure you have installed mongod. On ubuntu it is:
#    sudo apt-get install mongodb-server

HOST=0.0.0.0
PORT=27017
DATA_DIR=./data
LOG_DIR=./log

echo "Your are running with $(mongod --version)"

cd "$(dirname "$0")"
mkdir -p ${DATA_DIR} ${LOG_DIR}

# Start first on localhost to setup permissions.
CONFIG="--port ${PORT} --dbpath ${DATA_DIR} --logpath ${LOG_DIR}/mongo.log"
mongod --bind_ip localhost ${CONFIG} &

sleep 1
HOLD_ON_SECONDS=40
echo "Waiting ${HOLD_ON_SECONDS} seconds for DB startup..."
sleep ${HOLD_ON_SECONDS}

echo "Init users and reboot server..."
mongo localhost:${PORT} < mongo2.4_init_auth.js
sleep 5
mongod --bind_ip ${HOST} --fork ${CONFIG}
