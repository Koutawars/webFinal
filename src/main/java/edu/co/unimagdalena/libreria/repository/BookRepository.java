package edu.co.unimagdalena.libreria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.co.unimagdalena.libreria.identity.Book;


public interface BookRepository  extends JpaRepository<Book, Long> {
	List<Book> findByNameContaining(String name);
	List<Book> findByIsbnContaining(String ISBN);
	List<Book> findByAuthor_Name(String name);
	
	List<Book> findByCategorys_Name(String name);
}
