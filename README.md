## Spring Cloud Config Server

#### Default  Enabled Features
1. Clone repositories on server startup to avoid invalid repositories URI issue
2. Force pull repo's change to void local clone dirty issue
3. Search configurations by application name in per repo for support multi applications

#### Default Disabled Features
1. Eureka client (Developers should to explict enable it when they want to register this service to eureka server)
2. Spring Cloud Bus(Developers should to explict enable it when they want to monitor and handle configurations change automatically)

#### Source Code
https://github.com/maoerd/config-server

#### Docker Image
https://hub.docker.com/r/mengluo668/config-server/

#### Run
1. Run with default configurations
```` docker run -p 8888:8888 mengluo668/config-server:0.0.1-SNAPSHOT ````

2. Run with customize configuration files (Without port change in customer configuration files)
```` shell
docker run -p 8888:8888 -v /path/to/configurations:/config-server/config mengluo668/config-server:0.0.1-SNAPSHOT
````

3. Run with customize configuration files(With port change to 80 in customer configuration files)
```` shell
docker run -p 80:80 -v /path/to/configurations:/config-server/config  mengluo668/config-server:0.0.1-SNAPSHOT
````

#### Enable Features
1. Enable service register and discovery feature
```` text
  eureka:
    instance:
      hostname: localhost
    client:
      enabled: true
      serviceUrl:
        defaultZone: http://localhost:8761/eureka/
````
> 1. You have to explicit claim _eureka.client.enabled_ as _true_ to enable service register and discovery feature(Override the default value)
> 2. _eureka.client_ require a external *Eureka Server* exist. You have to explicit claim your *Eureka Server* settings in your configuration files(Eureka client will register config-server application into Eureka Server as a service).

2. Enable spring cloud bus feature
````text
  spring:
    cloud:
      bus:
        enabled: true
````
> 1. You have to explicit claim _spring.cloud.bus.enabled_ as _true_ to enable spring cloud bus feature(Override the default value).
> 2. _spring.cloud.bus_ require a external *kafka* bind. You have to explicit claim your *kafka* settings in your configuration files(Spring Cloud Bus links nodes of a distributed system with a lightweight message broker, here is *Kafka*, and broadcast state changes to nodes).

#### Default Configuration Repository
https://github.com/maoerd/configuration

#### Help From Author
<jackie-1685@163.com>
