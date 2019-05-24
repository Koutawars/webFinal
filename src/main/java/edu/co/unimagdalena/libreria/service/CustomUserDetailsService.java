package edu.co.unimagdalena.libreria.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.co.unimagdalena.libreria.identity.Client;
import edu.co.unimagdalena.libreria.repository.ClientRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private ClientRepository repository;
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Client cliente = repository.findByUsername(username);
		CustomUserDetails userDetails = null;
		if (cliente != null) {
			userDetails = new CustomUserDetails();
			userDetails.setCliente(cliente);
			
		} else {
			throw new UsernameNotFoundException("User not exist with name : " + username);
		}
		return userDetails;

	}

}