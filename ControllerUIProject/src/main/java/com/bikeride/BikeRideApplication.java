package com.bikeride;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class BikeRideApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BikeRideApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(BikeRideApplication.class, args);
		System.out.println("BikeRide Platform Started Successfully!");
		System.out.println("Access at: http://localhost:8080");
	}
}