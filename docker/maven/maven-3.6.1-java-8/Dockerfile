FROM maven:3.6.1-jdk-8

LABEL author="CodingFanlt"
LABEL maintainer="CodingFanlt@Gmail.com"
LABEL version="1.0"

# copy config file
COPY config/settings.xml $MAVEN_HOME/conf/settings.xml

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]