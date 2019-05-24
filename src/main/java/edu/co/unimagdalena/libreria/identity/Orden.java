package edu.co.unimagdalena.libreria.identity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="orden")
public class Orden {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String date;
	private long total;
	
	@OneToMany(mappedBy="order")
	private Set<OrderDetails> details;
	
	public Orden() {
		
	}
	
	public Orden(long id, String date, long total, Set<OrderDetails> details) {
		super();
		this.id = id;
		this.date = date;
		this.total = total;
		this.details = details;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public Set<OrderDetails> getDetails() {
		return details;
	}

	public void setDetails(Set<OrderDetails> details) {
		this.details = details;
	}
	
	
}
