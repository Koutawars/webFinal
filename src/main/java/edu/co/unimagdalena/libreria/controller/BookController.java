package edu.co.unimagdalena.libreria.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Book;
import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.repository.BookRepository;
import edu.co.unimagdalena.libreria.repository.ClientRepository;

@RestController
@RequestMapping("/api/book")
public class BookController {
	@Autowired
	BookRepository bookRepository;
	
	@Autowired
	ClientRepository clientRepository;
	
	@GetMapping("/mySpeciality")
	ResponseEntity<List<Book>> getMySpeciality(HttpServletResponse res){
		List <Book> retornar = new ArrayList<>(); 
		Client client;
		String username = res.getHeader("Authorization");
		try {
			client = clientRepository.findByUsername(username);
			if(client.getSpeciality() == null) {
				retornar = bookRepository.findByCategorys_NameContaining("Best Seller");
				retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
			}else {
				retornar = bookRepository.findBySpeciality_id(client.getSpeciality().getId());
				retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
			}
			
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(retornar);
	}
	
	@GetMapping("/recommends")
	ResponseEntity<List<Book>> getRecomendado(){
		List <Book> retornar = new ArrayList<>(); 
		try {
			retornar = bookRepository.findByCategorys_NameContaining("Best Seller");
			retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
			
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(retornar);
	}
	
	@PostMapping("/search/name")
	ResponseEntity<List<Book>> searchByName(@RequestBody(required=false) String name){
		List <Book> retornar = new ArrayList<>(); 
		try {
			retornar = bookRepository.findByNameContaining(name);
			retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(retornar);
	}
	

	@PostMapping("/search/isbn")
	ResponseEntity<List<Book>> searchByIsbn(@RequestBody(required=false) String isbn){
		List <Book> retornar = new ArrayList<>();
		try {
			retornar = bookRepository.findByIsbnContaining(isbn);
			retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(retornar);
	}
	
	@PostMapping("/search/author")
	ResponseEntity<List<Book>> searchByAuthorName(@RequestBody(required=false) String name){
		List <Book> retornar = new ArrayList<>(); 
		try {
			retornar = bookRepository.findByAuthor_NameContaining(name);
			retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(retornar);
	}
}
