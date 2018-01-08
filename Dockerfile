# Dockerized Spring Cloud Config Server
# Author: Jackie King
# License: Apache License 2.0
#
FROM openjdk:8u151-jre-slim
MAINTAINER Wenbo Wang <jackie-1685@163.com>

# Copy the final build JAR file to /config-server/config-server.jar
ARG JAR_FILE

ADD ${JAR_FILE} /config-server/config-server.jar

# Volume you application configuration files into /config-server/config
#
# If you have modified the port(default 8888) in configuration files, e.g, server.port=8080
# then you have to expose the modified port explicitly like below: 
# `docker run -e DEFAULT_CONFIG_SERVER_PORT=8080 -p 8080:8080 ...`
VOLUME /config-server/config

# Volume tmp files
VOLUME /tmp

# Default exposed port
ENV DEFAULT_CONFIG_SERVER_PORT=8888

# Make the port(default 8888) available to the world outside this container
# 
# If you have modified the port(default 8888) in configuration files, e.g, server.port=8080
# then you have to expose the modified port explicitly like below: 
# `docker run -e DEFAULT_CONFIG_SERVER_PORT=8080 -p 8080:8080 ...`
EXPOSE ${DEFAULT_CONFIG_SERVER_PORT}

# We have to explicit claim the workdir so that the spring boot application can read configuration files from /config-server/config 
WORKDIR /config-server

# -Djava.security.egd=file:/dev/./urandom
# Tomcat generate session id according to OS dev/random or dev/urandome
# The dev/random can cause delays during startup if entropy source that is used to initialize SecureRandom is short of entropy
# The dev/urandom is not
# . in file path is used to avoid tomcat origin bug
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "config-server.jar"]
