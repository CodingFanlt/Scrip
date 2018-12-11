#!/bin/bash

# the default node number is 2
N=${1:-2} # take effect when the variable is an empty string

# create hadoop network
docker network create --driver=bridge hadoop

# start hadoop master container
docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                codingfanlt/hadoop:2.9.2

# start hadoop slave container
i=1
# while [ $i -lt $N ]
while (("$i" <= "$N"))
do
	docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                codingfanlt/hadoop:2.9.2
	i=$(( $i + 1 ))
done 

# get into hadoop master container
docker exec -it hadoop-master bash