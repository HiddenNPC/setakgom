package com.spring.admin_order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.spring.order.AddressService;

@Controller
public class AdminOrderController {
	
	@Autowired
	private AdminOrderService adminOrderService; 
	
	//주문 관리자 페이지
	@RequestMapping(value = "/admin/order.do")
	public String adminOrder(Model model) {
		
		System.out.println("들어와줘..");
		
		return "/admin/order";
	}

}
