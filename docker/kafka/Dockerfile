FROM openjdk:8-jre-slim

ARG DISTRO_NAME=kafka_2.11-2.4.0

ENV KAFKA_HOME=/$DISTRO_NAME \
    KAFKA_CONF_DIR=/conf \
    KAFKA_DATA_DIR=/data \
    KAFKA_DATA_LOG_DIR=/datalog

# Add a user with an explicit UID/GID and create necessary directories
RUN set -eux && \
    groupadd -r kafka --gid=1000 && \
    useradd -r -g kafka --uid=1000 kafka && \
    mkdir -p "$KAFKA_CONF_DIR" "$KAFKA_DATA_DIR" "$KAFKA_DATA_LOG_DIR" && \
    chown kafka:kafka "$KAFKA_CONF_DIR" "$KAFKA_DATA_DIR" "$KAFKA_DATA_LOG_DIR"

RUN set -eux && \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    wget && \
    wget http://apache.claz.org/kafka/2.4.0/kafka_2.11-2.4.0.tgz && \
    tar -xzf "$DISTRO_NAME.tgz" && \
    rm "$DISTRO_NAME.tgz" && \
    chown -R kafka:kafka "/$DISTRO_NAME"

VOLUME ["$KAFKA_DATA_DIR", "$KAFKA_DATA_LOG_DIR"]

EXPOSE 9092

ENV PATH=$PATH:$KAFKA_HOME/bin

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["kafka-server-start.sh","/kafka_2.11-2.4.0/config/server.properties"]
