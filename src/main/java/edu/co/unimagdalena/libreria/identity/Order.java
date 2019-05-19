package edu.co.unimagdalena.libreria.identity;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String date;
	private long total;
	
	@OneToMany(mappedBy="order")
	private ArrayList<OrderDetails> details;
	
	public Order() {
		
	}
	
	public Order(long id, String date, long total, ArrayList<OrderDetails> details) {
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

	public ArrayList<OrderDetails> getDetails() {
		return details;
	}

	public void setDetails(ArrayList<OrderDetails> details) {
		this.details = details;
	}
	
	
}
