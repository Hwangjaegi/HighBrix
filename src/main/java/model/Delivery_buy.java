package model;

import java.sql.Date;

public class Delivery_buy {
	private int db_no;
	private String db_name;
	private String db_address;
	private String db_tel;
	private String db_request;
	private Date db_date;
	private String id;
	private int c_no;
	private int cm_no;
	//추가
	private String cm_image;
	private String cm_name;
	private int cm_price;
	private int bl_count;
	
	public int getBl_count() {
		return bl_count;
	}
	public void setBl_count(int bl_count) {
		this.bl_count = bl_count;
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
	public int getCm_price() {
		return cm_price;
	}
	public void setCm_price(int cm_price) {
		this.cm_price = cm_price;
	}
	public int getDb_no() {
		return db_no;
	}
	public void setDb_no(int db_no) {
		this.db_no = db_no;
	}
	public String getDb_name() {
		return db_name;
	}
	public void setDb_name(String db_name) {
		this.db_name = db_name;
	}
	public String getDb_address() {
		return db_address;
	}
	public void setDb_address(String db_address) {
		this.db_address = db_address;
	}
	public String getDb_tel() {
		return db_tel;
	}
	public void setDb_tel(String db_tel) {
		this.db_tel = db_tel;
	}
	public String getDb_request() {
		return db_request;
	}
	public void setDb_request(String db_request) {
		this.db_request = db_request;
	}
	public Date getDb_date() {
		return db_date;
	}
	public void setDb_date(Date db_date) {
		this.db_date = db_date;
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
	
}
