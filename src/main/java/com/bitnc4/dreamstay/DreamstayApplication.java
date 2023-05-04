package com.bitnc4.dreamstay;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@ComponentScan({"com.bitnc4.*","naver.cloud"})
@SpringBootApplication
@MapperScan("com.bitnc4.mapper")
public class DreamstayApplication {

    public static void main(String[] args) {
        SpringApplication.run(DreamstayApplication.class, args);
    }

}
