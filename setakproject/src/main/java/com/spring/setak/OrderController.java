package com.spring.setak;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {	
	
	@Autowired
	private MileageService mileageService; 
	@Autowired
	private CouponService couponService; 
	
	// 페이지	
	// 장바구니 
	@RequestMapping(value = "/cart.st")
	public String cart(Model model) {
		return "cart";	
	}

	// 주문결제 
	@RequestMapping(value = "/order.st")
	public String order(Model model) {
		String member_id = "minchoi"; 
		
		int havePoint = mileageService.getSum(member_id);
		ArrayList<CouponVO> couponList = couponService.getCouponList(member_id);
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("havePoint", havePoint);
		return "order";
	}
	
	// 주문완료
	@RequestMapping(value = "/orderSuccess.st")
	public String orderSuccess() {
		return "order_success";
		
	}
	
	// 결제
//	@RequestMapping(value = "/getPayInfo.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
//	@ResponseBody 
//	public AddressVO getPayInfo(AddressVO avo) {
//		
//	}
	
}
