package edu.co.unimagdalena.libreria.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.repository.ClientRepository;

@RestController
@RequestMapping("/api/client")
public class ClientController {
	@Autowired
	ClientRepository clientRepository;
	
	@GetMapping
	public ResponseEntity<Client> getClient(HttpServletResponse res) {
		String username = res.getHeader("Authorization");
		Client response = clientRepository.findByUsername(username);
		return new ResponseEntity<Client>(response, HttpStatus.OK);
	}
	
}
