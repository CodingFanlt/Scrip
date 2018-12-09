FROM codingfanlt/ubuntu-ustc-source:16.04

MAINTAINER CodingFanlt <CodingFanlt@Gmail.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get upgrade -y\
    && apt-get install -y openssh-server openjdk-8-jdk wget vim net-tools iputils-ping

# install hadoop 2.9.2
RUN wget http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz \
    && tar -xzvf hadoop-2.9.2.tar.gz \
    && mv hadoop-2.9.2 /usr/local/hadoop \
    && rm hadoop-2.9.2.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/usr/local/hadoop 
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin 

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p ~/hdfs/namenode \
    && mkdir -p ~/hdfs/datanode \
    && mkdir $HADOOP_HOME/logs

# copy file
COPY config/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config \
    && mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh \
    && mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml \
    && mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml \
    && mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml \
    && mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml \
    && mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves \
    && mv /tmp/start-hadoop.sh ~/start-hadoop.sh \
    && mv /tmp/run-wordcount.sh ~/run-wordcount.sh

# add executable permissions
RUN chmod +x ~/start-hadoop.sh \
    && chmod +x ~/run-wordcount.sh \
    && chmod +x $HADOOP_HOME/sbin/start-dfs.sh \
    && chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format

CMD [ "sh", "-c", "service ssh start; bash"]