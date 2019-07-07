FROM codingfanlt/hadoop:2.9.2

LABEL author="CodingFanlt"
LABEL maintainer="CodingFanlt@Gmail.com"
LABEL version="1.0"

RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/hbase/1.4.9/hbase-1.4.9-bin.tar.gz \
    && tar -xzvf hbase-1.4.9-bin.tar.gz \
    && mv hbase-1.4.9 /usr/local/hbase \
    && rm hbase-1.4.9-bin.tar.gz

ENV HBASE_HOME=/usr/local/hbase
ENV PATH=$HBASE_HOME/bin:$PATH

COPY config/* /tmp/

RUN mv /tmp/hbase-env.sh /usr/local/hbase/conf/hbase-env.sh \
    && mv /tmp/hbase-site.xml /usr/local/hbase/conf/hbase-site.xml \
    && mv /tmp/regionservers /usr/local/hbase/conf/regionservers \
    && mv /tmp/start-hbase.sh ~/ 

RUN chmod +x ~/start-hbase.sh \
    && chmod +x $HBASE_HOME/bin/start-hbase.sh

CMD [ "sh", "-c", "service ssh start; bash"]