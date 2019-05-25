package edu.co.unimagdalena.libreria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.co.unimagdalena.libreria.identity.CreditCard;

public interface CreditCardRepository extends JpaRepository <CreditCard, Long>{

}