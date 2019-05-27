package edu.co.unimagdalena.libreria.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.identity.Book;
import edu.co.unimagdalena.libreria.repository.BookRepository;

@RestController
@RequestMapping("/api/book")
public class BookController {
	@Autowired
	BookRepository bookRepository;
	
	@GetMapping("/recommends")
	ResponseEntity<List<Book>> getRecomendado(){
		List <Book> retornar = new ArrayList<>(); 
		try {
			retornar = bookRepository.findByCategorys_Name("Best Seller");
			retornar = retornar.stream().filter(x -> x.getStock() > 0 ).collect(Collectors.toList());
			
		}catch(Exception e) {
			return ResponseEntity.status(409).build();
		}
		return ResponseEntity.ok(retornar);
	}
}
