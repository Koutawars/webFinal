package edu.co.unimagdalena.libreria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.co.unimagdalena.libreria.identity.Book;


public interface BookRepository  extends JpaRepository<Book, Long> {
	List<Book> findByNameContaining(String name);
	List<Book> findByIsbnContaining(String ISBN);
	
	@Query("SELECT u FROM Book u INNER JOIN u.author c where c.name LIKE %?1%")
	List<Book> findByAuthorName(String name);
}
