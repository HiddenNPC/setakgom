package com.spring.setak;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {	
	
	@Autowired
	private MileageService mileageService; 
	@Autowired
	private CouponService couponService; 
	@Autowired
	private OrderService orderService; 
	
	// 페이지	
	// 장바구니 
	@RequestMapping(value = "/cart.st")
	public String cart(Model model) {
		return "cart";	
	}

	// 주문결제 
	@RequestMapping(value = "/order.st")
	public String order(Model model) {
		String member_id = "bit"; 
		
		int havePoint = mileageService.getSum(member_id);
		
		ArrayList<CouponVO> couponList = couponService.getCouponList(member_id);
		int haveCoupon = couponService.getCouponCount(member_id);

		model.addAttribute("haveCoupon", haveCoupon);
		model.addAttribute("couponList", couponList);
		
		model.addAttribute("havePoint", havePoint);
		return "order";
	}
	
	// 주문완료
	@RequestMapping(value = "/orderSuccess.st")
	public String orderSuccess() {
		return "order_success";
		
		
	}
	
	// 주문 정보 입력
	@RequestMapping(value = "/insertOrder.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public String insertOrder(OrderVO ovo) {
		
		ovo.setOrder_num(111114);
		int res = orderService.insertOrder(ovo);
		
		return "order_success";
	}
	
}
