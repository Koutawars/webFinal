package edu.co.unimagdalena.libreria.identity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	private long specialty_id;
	
	
	
	Client(){
		
	}
	
	public Client(long id, String username, String password, String name, String lastName, String address, String city,
			int areaCode, long phone, String email, String shippingPreference, long specialty_id) {
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
		this.specialty_id = specialty_id;
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
	public long getSpecialty_id() {
		return specialty_id;
	}
	public void setSpecialty_id(long specialty_id) {
		this.specialty_id = specialty_id;
	}
	
	
}
