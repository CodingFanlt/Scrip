# This is a Docker-based Hadoop build script.

## How to use ?

First, make sure you have Docker installed on your machine. The version number I am using is `Docker version 18.09.0` .

### Run only Hadoop clusters

Run with the following command:

``` shell
curl -fsSL ${https://github.com/CodingFanlt/Scrip/blob/master/docker/hadoop/hadoop-2.9.2/start.sh} | sh
```

You may need to use Root when creating a container.

By default, this script will create a master node and two slave nodes.

You can use parameters to specify the number of slave nodes, up to five:

``` shell
./start.sh 5
```

When the node is created successfully, it will automatically enter the master node.

You can also use the following command to enter the master or slave node:

``` shell
docker exec -it your_node_name bash
```

Within the master node, you can use the following command to run a Hadoop cluster.

``` shell
./start-hadoop.sh
```

Then you can use the following command to run the wordcount program:

``` shell
./run-wordcount.sh
```

You can go to `your_ip:8088` and `your_ip:50070` to see how the Hadoop cluster is running.

### Rebuild the Docker image

If you need to change the relevant configuration file, please rebuild after changing the configuration file.

``` shell
docker builder -t your_image_name .
```