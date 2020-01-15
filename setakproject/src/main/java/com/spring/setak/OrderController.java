package com.spring.setak;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	// 장바구니 
	@RequestMapping(value = "/cart.st")
	public String cart(Model model) {
		
		return "cart";	
	}

	// 주문결제 
	@RequestMapping(value = "/order.st")
	public String order() {
		
		return "order";
	}
	
	// 주문완료
	@RequestMapping(value = "/orderSuccess.st")
	public String orderSuccess() {
		
		return "order_success";
		
	}
	
	
}
