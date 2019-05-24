package edu.co.unimagdalena.libreria.identity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="creditcard")
public class CreditCard {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
    @OneToOne
    private Client client;
    
	private String number;
	private String expiration;
	private String ccv;

	
	@ManyToOne
	@JoinColumn(name = "type_id")
	private Type type;
	
	public CreditCard() {
		
	}
	
	public CreditCard(long id, String number, String expiration, String ccv, Type type, Client client) {
		super();
		this.id = id;
		this.number = number;
		this.expiration = expiration;
		this.ccv = ccv;
		this.type = type;
		this.client = client;
	}


	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getExpiration() {
		return expiration;
	}
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}
	public String getCcv() {
		return ccv;
	}
	public void setCcv(String ccv) {
		this.ccv = ccv;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	
	
}
