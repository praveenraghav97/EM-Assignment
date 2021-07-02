package com.extramarks.sms;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.extramarks.sms.controller.EmployeeController;

@SpringBootApplication
public class EmployeeDemoApplication {

	public static void main(String[] args) {
		new File(EmployeeController.uploadDirectory).mkdir();
		SpringApplication.run(EmployeeDemoApplication.class, args);
	}
}
