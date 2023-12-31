package com.springproj.biz.domain;

import java.sql.Date;

public class AskRvVO {

	private String ar_no;
	private String a_no;
	private String um_no;
	private String bm_no;
	private String ar_content;
	private Date ar_date;
	private String ar_status;
	private String name;
	private String ar_id;
	private String ar_view_yn;
	
	public String getAr_no() {
		return ar_no;
	}
	public void setAr_no(String ar_no) {
		this.ar_no = ar_no;
	}
	public String getA_no() {
		return a_no;
	}
	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	public String getUm_no() {
		return um_no;
	}
	public void setUm_no(String um_no) {
		this.um_no = um_no;
	}
	public String getBm_no() {
		return bm_no;
	}
	public void setBm_no(String bm_no) {
		this.bm_no = bm_no;
	}
	public String getAr_content() {
		return ar_content;
	}
	public void setAr_content(String ar_content) {
		this.ar_content = ar_content;
	}
	public Date getAr_date() {
		return ar_date;
	}
	public void setAr_date(Date ar_date) {
		this.ar_date = ar_date;
	}
	public String getAr_status() {
		return ar_status;
	}
	public void setAr_status(String ar_status) {
		this.ar_status = ar_status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAr_id() {
		return ar_id;
	}
	public void setAr_id(String ar_id) {
		this.ar_id = ar_id;
	}
	public String getAr_view_yn() {
		return ar_view_yn;
	}
	public void setAr_view_yn(String ar_view_yn) {
		this.ar_view_yn = ar_view_yn;
	}
	
	@Override
	public String toString() {
		return "AskRvVO [ar_no=" + ar_no + ", a_no=" + a_no + ", um_no=" + um_no + ", bm_no=" + bm_no + ", ar_content="
				+ ar_content + ", ar_date=" + ar_date + ", ar_status=" + ar_status + ", name=" + name + ", ar_id="
				+ ar_id + ", ar_view_yn=" + ar_view_yn + "]";
	}
	
}
