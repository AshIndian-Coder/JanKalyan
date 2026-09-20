package com.portal.schemes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SchemesApplication {
    public static void main(String[] args) {
        SpringApplication.run(SchemesApplication.class, args);
    }
}