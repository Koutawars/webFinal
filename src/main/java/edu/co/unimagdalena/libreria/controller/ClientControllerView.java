package edu.co.unimagdalena.libreria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.co.unimagdalena.libreria.repository.TypeRepository;

@RequestMapping("/user")
@Controller
public class ClientControllerView {

	@Autowired
	TypeRepository typeRepository;
	
	@GetMapping
	String getDashboard() {
		return "dashboard";
	}
	
	@GetMapping("/addcard")
	String getAddcard(Model model) {
		model.addAttribute("types", typeRepository.findAll());
		return "addcard";
	}
}
