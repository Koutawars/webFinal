package edu.co.unimagdalena.libreria.identity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="orderDetails")
public class OrderDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private int amount;
	
	@ManyToOne
	private Order order;
	
	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;
	
	public OrderDetails() {
		
	}

	public OrderDetails(long id, int amount, Order order, Book book) {
		super();
		this.id = id;
		this.amount = amount;
		this.order = order;
		this.book = book;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	
}
