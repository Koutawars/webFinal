package edu.co.unimagdalena.libreria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.co.unimagdalena.libreria.identity.OrderDetails;

public interface OrderDetailsRepository extends JpaRepository <OrderDetails, Long>{

}
