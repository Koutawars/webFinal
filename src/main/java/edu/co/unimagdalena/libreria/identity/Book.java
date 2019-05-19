package edu.co.unimagdalena.libreria.identity;

import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	private String description;
	private String ISBN;
	private long price;
	private int stock;
	
	@ManyToOne
	@JoinColumn(name = "author_id")
	private Author author;
	
	@ManyToOne
	@JoinColumn(name = "editorial_id")
	private Editorial editorial;
	
	@ManyToMany
	@JoinTable(
			name="libro_category", 
			joinColumns=@JoinColumn(name="book_id"), 
			inverseJoinColumns=@JoinColumn(name="category_id")
			)
	private ArrayList<Category> categorys;
	
	@ManyToOne
	@JoinColumn(name = "speciality_id")
	private Speciality speciality;

	public Book() {
		
	}
	
	public Book(long id, String name, String description, String iSBN, long price, int stock, Author author,
			Editorial editorial, ArrayList<Category> categorys, Speciality speciality) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		ISBN = iSBN;
		this.price = price;
		this.stock = stock;
		this.author = author;
		this.editorial = editorial;
		this.categorys = categorys;
		this.speciality = speciality;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Editorial getEditorial() {
		return editorial;
	}

	public void setEditorial(Editorial editorial) {
		this.editorial = editorial;
	}

	public ArrayList<Category> getCategory() {
		return categorys;
	}

	public void setCategory(ArrayList<Category> categorys) {
		this.categorys = categorys;
	}

	public Speciality getSpeciality() {
		return speciality;
	}

	public void setSpeciality(Speciality speciality) {
		this.speciality = speciality;
	}
	
	
}
