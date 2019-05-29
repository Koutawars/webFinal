package edu.co.unimagdalena.libreria.identity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="orden")
public class Orden {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String date;
	private long total;
	
	@ManyToOne
	private Client client;
	
	@JsonIgnoreProperties("order")
	@OneToMany(mappedBy="order")
	private List<OrderDetails> details;
	
	public Orden() {
		
	}

	public Orden(long id, String date, long total, Client client, List<OrderDetails> details) {
		super();
		this.id = id;
		this.date = date;
		this.total = total;
		this.client = client;
		this.details = details;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
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

	public List<OrderDetails> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetails> details) {
		this.details = details;
	}
	
	
}
