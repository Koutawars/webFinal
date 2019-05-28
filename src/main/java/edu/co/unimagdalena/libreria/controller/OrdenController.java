package edu.co.unimagdalena.libreria.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.identity.Orden;
import edu.co.unimagdalena.libreria.repository.ClientRepository;
import edu.co.unimagdalena.libreria.repository.OrdenRepository;

@RestController
@RequestMapping("/api/orden")
public class OrdenController {
	@Autowired
	private OrdenRepository ordenRepository;
	
	@Autowired
	private ClientRepository clientRepository;
	
	@PostMapping("/add")
	public ResponseEntity<Orden> addOrden(@RequestBody Orden orden, HttpServletResponse res) {
		Orden response = new Orden();
		String username = res.getHeader("Authorization");
		try {
			Client client = clientRepository.findByUsername(username);
			orden.setClient(client);
			response = ordenRepository.save(orden);
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(response);
	}
}
