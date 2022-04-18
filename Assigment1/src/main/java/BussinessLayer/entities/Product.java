package BussinessLayer.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the products database table.
 * 
 */
@Entity
@Table(name="products")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
    
	@Column(name="masanpham")
	private String masanpham;
	
	private float dongia;

	private String images;

	private float kichthuoc;

	private String mausac;

	private Long soluong;

	private String ten;

	private Integer trangthai;

	//bi-directional many-to-one association to Bill
	@OneToMany(mappedBy="product")
	private List<Bill> bills;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="matheloai", referencedColumnName="matheloai")
	private Category category;

	public Product() {
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

	public String getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}

	public void setDongia(float dongia) {
		this.dongia = dongia;
	}

	public String getImages() {
		return this.images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public float getKichthuoc() {
		return this.kichthuoc;
	}

	public void setKichthuoc(float kichthuoc) {
		this.kichthuoc = kichthuoc;
	}

	public String getMausac() {
		return this.mausac;
	}

	public void setMausac(String mausac) {
		this.mausac = mausac;
	}

	public Long getSoluong() {
		return this.soluong;
	}

	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}

	public String getTen() {
		return this.ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public Integer getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(Integer trangthai) {
		this.trangthai = trangthai;
	}

	public List<Bill> getBills() {
		return this.bills;
	}

	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

	public Bill addBill(Bill bill) {
		getBills().add(bill);
		bill.setProduct(this);

		return bill;
	}

	public Bill removeBill(Bill bill) {
		getBills().remove(bill);
		bill.setProduct(null);

		return bill;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}