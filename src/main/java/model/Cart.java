package model;

public class Cart {
	private int c_no;
	private int c_count;
	private String id;
	private int cm_no;
	
	private String cm_name;
	private String cm_image;
	private int cm_price;
	private int cm_discount;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public String getCm_image() {
		return cm_image;
	}
	public void setCm_image(String cm_image) {
		this.cm_image = cm_image;
	}
	public int getCm_price() {
		return cm_price;
	}
	public void setCm_price(int cm_price) {
		this.cm_price = cm_price;
	}
	public int getCm_discount() {
		return cm_discount;
	}
	public void setCm_discount(int cm_discount) {
		this.cm_discount = cm_discount;
	}
}