package BussinessLayer.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the categories database table.
 * 
 */
@Entity
@Table(name="categories")
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="matheloai")
	private String matheloai;
	
	private String tentheloai;

	private Integer trangthai;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="username", referencedColumnName="username")
	private User user;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="category")
	private List<Product> products;

	public Category() {
	}

	public String getMatheloai() {
		return matheloai;
	}

	public void setMatheloai(String matheloai) {
		this.matheloai = matheloai;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTentheloai() {
		return this.tentheloai;
	}

	public void setTentheloai(String tentheloai) {
		this.tentheloai = tentheloai;
	}

	public Integer getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(Integer trangthai) {
		this.trangthai = trangthai;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setCategory(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setCategory(null);

		return product;
	}

}