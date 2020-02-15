package com.spring.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Admin_C_M_Controller {
	
	@Autowired()
	private Admin_C_M_ServiceImpl admin_C_M_Service;
	
	@RequestMapping(value="/Admin_CouponList.do", produces = "application/json;charset=UTF-8")
	public List<Object> Admin_CouponList(){
		List<Object> list = admin_C_M_Service.Admin_CouponList();
		
		return list;
	}
	
	
}
