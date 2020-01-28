package com.spring.setak;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CouponVO {
	
	private String member_id;
	private String coupon_name;
	private Timestamp coupon_start;
	private Timestamp coupon_end;
	private Timestamp coupon_useday;
	private String coupon_use;
	private int coupon_seq; 

}
