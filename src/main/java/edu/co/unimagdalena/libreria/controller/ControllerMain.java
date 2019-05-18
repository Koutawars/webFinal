package edu.co.unimagdalena.libreria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerMain {
	@RequestMapping("/")
	String getIndex() {
		return "login";
	}
	@RequestMapping("/login")
	String getLogin() {
		return "login";
	}
	
	@RequestMapping("/signup")
	String getSignup() {
		return "signup";
	}
	
}
