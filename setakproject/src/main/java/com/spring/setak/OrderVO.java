package com.spring.setak;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderVO {

	private int order_num; 
	private String member_id;
	private Timestamp order_date;
	private String order_phone;
	private int order_price; 
	private String order_payment;
	private String order_delcode;
	private String order_cancel;
	private String order_status;
	private Timestamp order_pickup;
	
}
