FROM openjdk:8-jre-alpine

ENV KAFKA_CONF_DIR=/KAFKA_CONF_DIR \
    KAFKA_DATA_DIR=/data \
    KAFKA_DATA_LOG_DIR=/datalog 

ARG DISTRO_NAME=kafka_2.11-2.4.0

WORKDIR $DISTRO_NAME

# Add a user with an explicit UID/GID and create necessary directories
RUN set -eux; \
    # addgroup -S kafka --g 1000; \
    # useradd -r -g kafka --uid=1000 kafka; \
    mkdir -p "$KAFKA_CONF_DIR" "$KAFKA_DATA_DIR" "$KAFKA_DATA_LOG_DIR";
    # chown kafka:kafka "$KAFKA_CONF_DIR" "$KAFKA_DATA_DIR" "$KAFKA_DATA_LOG_DIR"

RUN set -eux; \
    apk add --no-cache wget; \
    wget http://apache.claz.org/kafka/2.4.0/kafka_2.11-2.4.0.tgz; \
    tar -xzf "$DISTRO_NAME.tgz"; \
    mv "$DISTRO_NAME/conf/"* "$KAFKA_CONF_DIR";
    # chown -R kafka:kafka "/$DISTRO_NAME"

VOLUME ["$KAFKA_DATA_DIR", "$KAFKA_DATA_LOG_DIR"]

EXPOSE 9092

ENV PATH=$PATH:/$DISTRO_NAME/bin

CMD ["start-kafka.sh"]
