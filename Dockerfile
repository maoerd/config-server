# Dockerized Spring Cloud Config Server
# Author: Jackie King
# License: Apache License 2.0
#
FROM openjdk:8u151-jre-slim
MAINTAINER Wenbo Wang <jackie-1685@163.com>

# Arg for java file name
ARG JAR_FILE

# Copy the final build JAR file to /config-server/config-server.jar
ADD ${JAR_FILE} /config-server/config-server.jar

# We have to explicit claim the workdir so that the spring boot application can read configuration files from /config-server/config 
WORKDIR /config-server

# -Djava.security.egd=file:/dev/./urandom
# Tomcat generate session id according to OS dev/random or dev/urandome
# The dev/random can cause delays during startup if entropy source that is used to initialize SecureRandom is short of entropy
# The dev/urandom is not
# . in file path is used to avoid tomcat origin bug
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "config-server.jar"]
