package edu.co.unimagdalena.libreria.identity;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="client")
public class Client {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String username;
	private String password;
	private String name;
	private String lastName;
	private String address;
	private String city;
	private int areaCode;
	private long phone;
	private String email;
	private String shippingPreference;
	
	
	@ManyToOne
	@JoinColumn(name = "speciality_id")
	private Speciality speciality;
	
	
    @OneToOne(mappedBy = "client")
	@JoinColumn
    private CreditCard creditCard;
    
    @OneToMany(mappedBy = "client")
	@JoinColumn
    private ArrayList<Order> orders;
    
    
	Client(){
		
	}



	public Client(long id, String username, String password, String name, String lastName, String address, String city,
			int areaCode, long phone, String email, String shippingPreference, Speciality speciality,
			CreditCard creditCard, ArrayList<Order> orders) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.lastName = lastName;
		this.address = address;
		this.city = city;
		this.areaCode = areaCode;
		this.phone = phone;
		this.email = email;
		this.shippingPreference = shippingPreference;
		this.speciality = speciality;
		this.creditCard = creditCard;
		this.orders = orders;
	}



	public Speciality getSpeciality() {
		return speciality;
	}



	public void setSpeciality(Speciality speciality) {
		this.speciality = speciality;
	}



	public ArrayList<Order> getOrders() {
		return orders;
	}



	public void setOrders(ArrayList<Order> orders) {
		this.orders = orders;
	}



	public CreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShippingPreference() {
		return shippingPreference;
	}
	public void setShippingPreference(String shippingPreference) {
		this.shippingPreference = shippingPreference;
	}
	public Speciality getSpecialty_id() {
		return speciality;
	}
	public void setSpecialty_id(Speciality specialty_id) {
		this.speciality = specialty_id;
	}
	
	
}
