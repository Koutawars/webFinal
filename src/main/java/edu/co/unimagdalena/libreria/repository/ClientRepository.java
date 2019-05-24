package edu.co.unimagdalena.libreria.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import edu.co.unimagdalena.libreria.identity.Client;

public interface ClientRepository extends JpaRepository<Client, Long>{
	Client findByUsername(String username);
}

