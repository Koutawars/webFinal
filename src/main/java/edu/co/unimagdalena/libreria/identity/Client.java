package edu.co.unimagdalena.libreria.identity;



import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="client")
public class Client {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String username;
	private String password;
	private String name;
	private String lastname;
	private String address;
	private Integer areacode;
	private long phone;
	private String email;
	private String shippingpreference;
	
	@ManyToOne
	@JoinColumn(name = "city_id")
	private City city;
	
	@ManyToOne
	private Speciality speciality;
	
	@JsonIgnoreProperties("client")
    @OneToOne(mappedBy = "client")
    private CreditCard creditCard;
    
    @OneToMany
    private Set<Orden> orders;
    
	public Client(){
		
	}
	
	

	@Override
	public String toString() {
		return "Client [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", lastname=" + lastname + ", address=" + address + ", areacode=" + areacode + ", phone=" + phone
				+ ", email=" + email + ", shippingpreference=" + shippingpreference + ", city=" + city + ", speciality="
				+ speciality + ", creditCard=" + creditCard + ", orders=" + orders + "]";
	}



	public Client(long id, String username, String password, String name, String lastname, String address, City city,
			Integer areacode, long phone, String email, String shippingpreference, Speciality speciality,
			CreditCard creditCard, Set<Orden> orders) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.lastname = lastname;
		this.address = address;
		this.city = city;
		this.areacode = areacode;
		this.phone = phone;
		this.email = email;
		this.shippingpreference = shippingpreference;
		this.speciality = speciality;
		this.creditCard = creditCard;
		this.orders = orders;
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


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Integer getAreacode() {
		return areacode;
	}


	public void setAreacode(Integer areacode) {
		this.areacode = areacode;
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


	public String getShippingpreference() {
		return shippingpreference;
	}


	public void setShippingpreference(String shippingpreference) {
		this.shippingpreference = shippingpreference;
	}


	public City getCity() {
		return city;
	}


	public void setCity(City city) {
		this.city = city;
	}


	public Speciality getSpeciality() {
		return speciality;
	}


	public void setSpeciality(Speciality speciality) {
		this.speciality = speciality;
	}


	public CreditCard getCreditCard() {
		return creditCard;
	}


	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}


	public Set<Orden> getOrders() {
		return orders;
	}


	public void setOrders(Set<Orden> orders) {
		this.orders = orders;
	}
	
	
}
