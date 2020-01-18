package com.spring.setak;

import java.sql.Timestamp;

public class MileageVO {
	private String member_id;
	private Timestamp mile_date;
	private int mile_price;
	private String mile_content;
	
	public String getMember_id() {
		return member_id;
	}
	public Timestamp getMile_date() {
		return mile_date;
	}
	public int getMile_price() {
		return mile_price;
	}
	public String getMile_content() {
		return mile_content;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setMile_date(Timestamp mile_date) {
		this.mile_date = mile_date;
	}
	public void setMile_price(int mile_price) {
		this.mile_price = mile_price;
	}
	public void setMile_content(String mile_content) {
		this.mile_content = mile_content;
	}
	
}
