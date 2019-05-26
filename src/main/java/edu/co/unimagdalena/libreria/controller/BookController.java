package edu.co.unimagdalena.libreria.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.co.unimagdalena.libreria.repository.BookRepository;

@RestController
@RequestMapping("/api/book")
public class BookController {
	@Autowired
	BookRepository bookRepository;
	
}
