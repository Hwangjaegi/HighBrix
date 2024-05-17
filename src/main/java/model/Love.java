package model;

public class Love {
	private int lcm_no;
	private String id;
	private int cm_no;
	private String cm_name;
	private String cm_image;
	private int cm_price;

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
	public int getLcm_no() {
		return lcm_no;
	}
	public void setLcm_no(int lcm_no) {
		this.lcm_no = lcm_no;
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
	
}
