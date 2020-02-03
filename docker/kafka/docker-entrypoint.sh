#!/bin/bash

sed -i "s/broker.id=0/broker.id=$BROKER_ID/g" ${KAFKA_HOME}/config/server.properties
sed -i "s/zookeeper.connect=localhost:2181/zookeeper.connect=$ZOO_SERVERS/g" ${KAFKA_HOME}/config/server.properties

exec "$@"
