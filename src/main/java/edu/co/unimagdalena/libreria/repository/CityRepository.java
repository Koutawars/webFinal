package edu.co.unimagdalena.libreria.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.co.unimagdalena.libreria.identity.City;

public interface CityRepository extends JpaRepository<City, Long>{

}
