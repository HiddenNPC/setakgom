package com.spring.setak;

import java.sql.Timestamp;

public class CouponVO {
	
	private String member_id;
	private String coupon_name;
	private Timestamp coupon_start;
	private Timestamp coupon_end;
	private Timestamp coupon_useday;
	private Timestamp coupon_use;
	
	public String getMember_id() {
		return member_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public Timestamp getCoupon_start() {
		return coupon_start;
	}
	public Timestamp getCoupon_end() {
		return coupon_end;
	}
	public Timestamp getCoupon_useday() {
		return coupon_useday;
	}
	public Timestamp getCoupon_use() {
		return coupon_use;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public void setCoupon_start(Timestamp coupon_start) {
		this.coupon_start = coupon_start;
	}
	public void setCoupon_end(Timestamp coupon_end) {
		this.coupon_end = coupon_end;
	}
	public void setCoupon_useday(Timestamp coupon_useday) {
		this.coupon_useday = coupon_useday;
	}
	public void setCoupon_use(Timestamp coupon_use) {
		this.coupon_use = coupon_use;
	}

}
