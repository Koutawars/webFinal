package edu.co.unimagdalena.libreria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.repository.ClientRepository;

@RestController
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	ClientRepository repository;
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@PostMapping
	ResponseEntity<Client> registrar(@RequestBody Client client) {
		Client response;
		System.out.println(client.toString());
		String pwsEncode = encoder.encode(client.getPassword());
		client.setPassword(pwsEncode);
		try {
			response = repository.save(client);
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(response);
	}
	
}
