package edu.co.unimagdalena.libreria.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.identity.CreditCard;
import edu.co.unimagdalena.libreria.repository.ClientRepository;
import edu.co.unimagdalena.libreria.repository.CreditCardRepository;

@RestController
@RequestMapping("/api/client")
public class ClientController {
	@Autowired
	ClientRepository clientRepository;
	
	@Autowired
	CreditCardRepository creditCardRepository;
	
	@GetMapping
	public ResponseEntity<Client> getClient(HttpServletResponse res) {
		String username = res.getHeader("Authorization");
		Client response = clientRepository.findByUsername(username);
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/addcard")
	public ResponseEntity<CreditCard> addCard(@RequestBody CreditCard creditCard, HttpServletResponse res){
		String username = res.getHeader("Authorization");
		CreditCard response;
		Client client;
		try {
			client = clientRepository.findByUsername(username);
			creditCard.setClient(client);
			response = creditCardRepository.save(creditCard);
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		
		return ResponseEntity.ok(response);
	}
	
}
