package edu.co.unimagdalena.libreria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.co.unimagdalena.libreria.identity.Book;


public interface BookRepository  extends JpaRepository<Book, Long> {
	List<Book> findByNameContaining(String name);
	List<Book> findByIsbnContaining(String ISBN);
	List<Book> findByAuthor_NameContaining(String name);
	
	List<Book> findByCategorys_NameContaining(String name);
	
	List<Book> findByNameContainingAndSpeciality_id(String name, Long id);
	List<Book> findByIsbnContainingAndSpeciality_id(String ISBN, Long id);
	List<Book> findByAuthor_NameContainingAndSpeciality_id(String name, Long id);
	
	List<Book> findBySpeciality_id(Long id);
}
