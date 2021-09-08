package com.jhta.neocom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class NeocomApplication {

	public static void main(String[] args) {
		SpringApplication.run(NeocomApplication.class, args);
	}

}
