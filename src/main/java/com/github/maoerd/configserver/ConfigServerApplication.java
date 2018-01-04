package com.github.maoerd.configserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

/**
 * Maoerd Cloud Configuration Server
 * 
 * @author jackie-1685@163.com
 */

@SpringBootApplication
@EnableConfigServer
public class ConfigServerApplication {

	public static void main(String args[]) {
		SpringApplication.run(ConfigServerApplication.class, args);
	}
}
