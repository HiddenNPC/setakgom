package com.spring.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.setak.CouponService;
import com.spring.setak.CouponVO;
import com.spring.setak.MileageService;

@Controller
public class OrderController {	
	
	@Autowired
	private MileageService mileageService; 
	@Autowired
	private CouponService couponService; 
	@Autowired
	private OrderService orderService; 
	@Autowired
	private CartService cartService; 
	
	// 페이지	
	// 장바구니 
	@RequestMapping(value = "/cart.do")
	public String cart(Model model) {
		
		String member_id = "bit"; 
		List<KeepCartVO> list = cartService.getKeepSeq(member_id);
		for(int i = 0; i < list.size(); i++) {
			System.out.println("keepSeq : " + list.get(i).getKeep_seq());
		}
		return "cart";	
	}
	
	// 정기구독
	@RequestMapping(value = "/subscribe.do")
	public String subscribe(Model model) {
		return "subscribe";	
	}

	// 주문결제 
	@RequestMapping(value = "/order.do")
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
	@RequestMapping(value = "/orderSuccess.do")
	public String orderSuccess() {
		
		return "order_success";
		
	}
	
	// 주문 정보 입력
	@RequestMapping(value = "/insertOrder.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public OrderVO insertOrder(OrderVO ovo) {
		
		long order_num = System.currentTimeMillis();
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		String date = sdf.format(today);
		System.out.println("date : " + date);
		
		ovo.setOrder_num(order_num);
		ovo.setOrder_date(date);
		
		int res = orderService.insertOrder(ovo);
		
		return ovo;
	}


	
}
