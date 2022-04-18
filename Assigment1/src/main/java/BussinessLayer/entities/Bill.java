package BussinessLayer.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bills database table.
 * 
 */
@Entity
@Table(name="bills")
@NamedQuery(name="Bill.findAll", query="SELECT b FROM Bill b")
public class Bill implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	private float dongia;

	private String mota;

	private Long soluong;

	private Integer trangthai;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="masanpham", referencedColumnName="masanpham")
	private Product product;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="username", referencedColumnName="username")
	private User user;

	public Bill() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public float getDongia() {
		return this.dongia;
	}

	public void setDongia(float dongia) {
		this.dongia = dongia;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public Long getSoluong() {
		return this.soluong;
	}

	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}

	public Integer getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(Integer trangthai) {
		this.trangthai = trangthai;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}