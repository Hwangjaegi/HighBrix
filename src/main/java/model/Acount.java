package model;

import java.util.Date;

public class Acount {
	private int a_no;			//게시글번호
	private String a_title;		//게시글제목
	private String a_content;	//게시글내용
	private Date a_date;		//게시글작성일
	private int a_view;			//게시글조회수
	private String a_image;		//게시글이미지
	private String a_password;	//비회원암호
	private int a_ref;
	private int a_step;
	private int a_level;
	private String a_del;			//게시글삭제여부
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	public int getA_view() {
		return a_view;
	}
	public void setA_view(int a_view) {
		this.a_view = a_view;
	}
	public String getA_image() {
		return a_image;
	}
	public void setA_image(String a_image) {
		this.a_image = a_image;
	}
	
	public String getA_password() {
		return a_password;
	}
	public void setA_password(String a_password) {
		this.a_password = a_password;
	}
	public int getA_ref() {
		return a_ref;
	}
	public void setA_ref(int a_ref) {
		this.a_ref = a_ref;
	}
	public int getA_step() {
		return a_step;
	}
	public void setA_step(int a_step) {
		this.a_step = a_step;
	}
	public int getA_level() {
		return a_level;
	}
	public void setA_level(int a_level) {
		this.a_level = a_level;
	}
	public String getA_del() {
		return a_del;
	}
	public void setA_del(String a_del) {
		this.a_del = a_del;
	}
	
	
}
