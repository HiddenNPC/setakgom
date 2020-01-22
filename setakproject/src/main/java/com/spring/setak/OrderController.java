package com.spring.setak;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		// 세탁 장바구니 값 읽기
		List<WashingVO> washingList = new ArrayList<WashingVO>();
		List<WashingCartVO> list3 = cartService.getWashSeq(member_id);
				
		if(list3.size() == 0) {
			System.out.println("세탁 장바구니에 아무것도 없음");
		} else {
			for(int i = 0; i < list3.size(); i++) {
				
				int wash_seq = list3.get(i).getWash_seq();
				WashingVO wvo = new WashingVO(); 
				wvo = cartService.getWashingList(wash_seq);
				washingList.add(wvo); 
			}
		}		
		
		// 수선 장바구니 값 읽기 
		List<MendingVO> mendingList = new ArrayList<MendingVO>(); 
		List<MendingCartVO> list2 = cartService.getMendingSeq(member_id);
		if(list2.size() == 0) {
			System.out.println("수선 장바구니에 아무것도 없음");
		}else {
			for(int i = 0; i < list2.size(); i++) {
				
				int repair_seq = list2.get(i).getRepair_seq();
				MendingVO mvo = new MendingVO();
				mvo = cartService.getMendingList(repair_seq);
				mendingList.add(mvo); 
			}
		}
		

		// 보관 장바구니 값 읽기
		List<KeepVO> keepList = new ArrayList<KeepVO>(); 
		List<KeepCartVO> list = cartService.getKeepSeq(member_id);
		
		if(list.size() == 0) {
			System.out.println("보관 장바구니 아무것도 없음");
		} else {
			for(int i = 0; i < list.size(); i++) {
				
				int keep_seq = list.get(i).getKeep_seq();
				KeepVO kvo = new KeepVO();
				kvo = cartService.getKeepList(keep_seq);
				keepList.add(kvo);

			}	
		}
		
		model.addAttribute("washingList", washingList); 
		model.addAttribute("mendingList", mendingList);
		model.addAttribute("keepList", keepList);
		
		return "cart";	
	}
	
	// 장바구니 비우기
	@RequestMapping(value = "/cartDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cartDelete(@RequestParam(value="loc") String loc, String[] washSeqArr, String[] repairSeqArr) {
		
		System.out.println("컨트롤러");
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("제발 오류 어디야..");
		// 세탁 선택 시퀀스 
		ArrayList<WashingCartVO> washSeqList = new ArrayList<WashingCartVO>();
		
		System.out.println("값 들어왔나... 수선 : " + repairSeqArr[0]);
		System.out.println("값 들어왔나... 수선 : " + repairSeqArr[1]);
//		System.out.println("값 들어왔나... 보관 : " + keepSeqArr.get(0));
		
		try {
			for(int i = 0; i < washSeqArr.length; i++) {
				WashingCartVO wcv = new WashingCartVO();
				int wash_seq = Integer.parseInt(washSeqArr[i]);
				int res = cartService.deleteWashCart(wash_seq);
				
				if(loc.equals("cart")) {
					int res2 = cartService.deleteWash(wash_seq);
				}
			}

			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal; 
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
		
		ovo.setOrder_num(order_num);
		ovo.setOrder_date(date);
		
		int res = orderService.insertOrder(ovo);
		
		return ovo;
	}


	
}
