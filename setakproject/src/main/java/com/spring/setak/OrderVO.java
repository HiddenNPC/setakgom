package com.spring.setak;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderVO {

	private long order_num;
	private String member_id;
	private String order_date;
	private String order_phone;
	private int order_price;
	private String order_payment;
	private String order_delicode;
	private String order_cancel;
	private String order_status;
	private String order_pickup; 	
	private String order_name;
	private String order_address;
	private String order_request;	
	private String order_zipcode;
	
}
