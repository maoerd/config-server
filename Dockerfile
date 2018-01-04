FROM openjdk:8u151-jre-slim
MAINTAINER Wenbo Wang <jackie-1685@163.com>

ARG JAR_FILE
ENV SERVER_PORT=8888
ENV SPRING_CLOUD_CONFIG_SERVER_GIT_URI=https://github.com/maoerd/configuration
ENV EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=http://localhost:8761/eureka/


ADD ${JAR_FILE} config-server.jar

VOLUME /tmp

EXPOSE 8888

# -Djava.security.egd=file:/dev/./urandom
# Tomcat generate session id according to OS dev/random or dev/urandome
# The dev/random can cause delays during startup if entropy source that is used to initialize SecureRandom is short of entropy
# The dev/urandom is not
# . in file path is used to avoid tomcat origin bug

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "config-server.jar", \
	"--server.port=${SERVER_PORT}", \
	" --spring.cloud.config.server.git.uri=${SPRING_CLOUD_CONFIG_SERVER_GIT_URI}", \
	" --eureka.client.serviceUrl.defaultZone=${EUREKA_CLIENT_SERVICEURL_DEFAULTZONE}"]
