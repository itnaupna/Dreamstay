package com.bitnc4;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@ComponentScan("com.bitnc4.*")
@SpringBootApplication
public class DreamstayApplication {

    public static void main(String[] args) {
        SpringApplication.run(DreamstayApplication.class, args);
    }

}
