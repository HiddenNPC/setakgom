package com.spring.setak;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderVO {

   private int order_num;
   private String member_id;
   private Date order_date;
   private String order_phone;
   private int order_price;
   private String order_payment;
   private String order_delicode;
   private String order_cancel;
   
   public int getOrder_num() {
	return order_num;
}
public void setOrder_num(int order_num) {
	this.order_num = order_num;
}
public String getMember_id() {
	return member_id;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public Date getOrder_date() {
	return order_date;
}
public void setOrder_date(Date order_date) {
	this.order_date = order_date;
}
public String getOrder_phone() {
	return order_phone;
}
public void setOrder_phone(String order_phone) {
	this.order_phone = order_phone;
}
public int getOrder_price() {
	return order_price;
}
public void setOrder_price(int order_price) {
	this.order_price = order_price;
}
public String getOrder_payment() {
	return order_payment;
}
public void setOrder_payment(String order_payment) {
	this.order_payment = order_payment;
}
public String getOrder_delicode() {
	return order_delicode;
}
public void setOrder_delicode(String order_delicode) {
	this.order_delicode = order_delicode;
}
public String getOrder_cancel() {
	return order_cancel;
}
public void setOrder_cancel(String order_cancel) {
	this.order_cancel = order_cancel;
}
public String getOrder_status() {
	return order_status;
}
public void setOrder_status(String order_status) {
	this.order_status = order_status;
}
public Date getOrder_pickup() {
	return order_pickup;
}
public void setOrder_pickup(Date order_pickup) {
	this.order_pickup = order_pickup;
}
public String getOrder_name() {
	return order_name;
}
public void setOrder_name(String order_name) {
	this.order_name = order_name;
}
public String getOrder_address() {
	return order_address;
}
public void setOrder_address(String order_address) {
	this.order_address = order_address;
}
public String getOrder_request() {
	return order_request;
}
public void setOrder_request(String order_request) {
	this.order_request = order_request;
}
public String getOrder_zipcode() {
	return order_zipcode;
}
public void setOrder_zipcode(String order_zipcode) {
	this.order_zipcode = order_zipcode;
}
private String order_status;
   private Date order_pickup;    
   private String order_name;
   private String order_address;
   private String order_request;   
   private String order_zipcode;
   
}