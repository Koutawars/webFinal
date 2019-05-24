package edu.co.unimagdalena.libreria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControllerMain {
	
	@GetMapping("/signup")
	String getSignup() {
		return "signup";
	}
	
	@GetMapping("/login")
	String getLogin() {
		return "login";
	}
	
	@GetMapping("/user")
	String getDashboard() {
		return "dashboard";
	}
}
