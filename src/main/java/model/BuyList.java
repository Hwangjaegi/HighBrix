package model;

public class BuyList {
	private int bl_no;
	private int bl_count;
	private int bl_price;
	private String id;
	private int c_no;
	private int cm_no;
	private int db_no;
	
	// 추가
	private String cm_image;
	private String cm_name;
	
	public int getBl_no() {
		return bl_no;
	}
	public void setBl_no(int bl_no) {
		this.bl_no = bl_no;
	}
	public int getBl_count() {
		return bl_count;
	}
	public void setBl_count(int bl_count) {
		this.bl_count = bl_count;
	}
	public int getBl_price() {
		return bl_price;
	}
	public void setBl_price(int bl_price) {
		this.bl_price = bl_price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public int getDb_no() {
		return db_no;
	}
	public void setDb_no(int db_no) {
		this.db_no = db_no;
	}
	public String getCm_image() {
		return cm_image;
	}
	public void setCm_image(String cm_image) {
		this.cm_image = cm_image;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	
}
