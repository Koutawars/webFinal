package edu.co.unimagdalena.libreria.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Book;
import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.identity.Orden;
import edu.co.unimagdalena.libreria.identity.OrderDetails;
import edu.co.unimagdalena.libreria.repository.BookRepository;
import edu.co.unimagdalena.libreria.repository.ClientRepository;
import edu.co.unimagdalena.libreria.repository.OrdenRepository;
import edu.co.unimagdalena.libreria.repository.OrderDetailsRepository;

@RestController
@RequestMapping("/api/orden")
public class OrdenController {
	@Autowired
	private OrdenRepository ordenRepository;
	
	@Autowired
	private ClientRepository clientRepository;
	
	@Autowired
	private OrderDetailsRepository orderDetailsRepository;
	
	@Autowired
	private BookRepository bookRepository;
	
	@PostMapping("/add")
	public ResponseEntity<Orden> addOrden(@RequestBody Orden orden, HttpServletResponse res) {
		Orden response = new Orden();
		ArrayList<OrderDetails> details = (ArrayList<OrderDetails>) orden.getDetails();
		String username = res.getHeader("Authorization");
		List<String> error = new ArrayList<String>(); // libros que salen mal
		try {
			Client client = clientRepository.findByUsername(username);
			if(client.getCreditCard() != null) {
				orden.setClient(client);
				for(int i = 0; i < details.size(); i++) {
					if(details.get(i).getBook().getStock() - details.get(i).getAmount() < 0) {
						error.add(details.get(i).getBook().getName());
					}
				}
				if(error.size() == 0) {
					int Stocknow;
					Book temp;
					response = ordenRepository.save(orden);
					for(int i = 0; i < details.size(); i++) {
						Stocknow = details.get(i).getBook().getStock() - details.get(i).getAmount();
						temp = details.get(i).getBook();
						temp.setStock(Stocknow);
						bookRepository.save(temp);
						details.get(i).setOrder(response);
						orderDetailsRepository.save(details.get(i));
					}
				}else {
					String errorMensaje = "¡Error cantidad: ";
					for(int i = 0; i < error.size(); i++) {
						errorMensaje += error.get(i) + " ";
					}
					errorMensaje += "!";
					return ResponseEntity.status(402).header("errorMessage", errorMensaje).build();
				}
			}else {
				return ResponseEntity.status(402).header("errorMessage", "¡No tiene tarjeta!").build();
			}
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(response);
	}
	
}
