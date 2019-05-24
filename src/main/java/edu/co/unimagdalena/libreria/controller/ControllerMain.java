package edu.co.unimagdalena.libreria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.co.unimagdalena.libreria.repository.CityRepository;
import edu.co.unimagdalena.libreria.repository.SpecialityRepository;

@Controller
public class ControllerMain {
	@Autowired
	CityRepository cityRepository;
	@Autowired
	SpecialityRepository specialityRepository;
	
	@GetMapping("/signup")
	String getSignup(Model model) {
		model.addAttribute("citys", cityRepository.findAll());
		model.addAttribute("specialitys", specialityRepository.findAll());
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
