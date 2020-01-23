package com.spring.setak;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		
	// 장바구니 
	@RequestMapping(value = "/order.do")
	public String cart(Model model, HttpServletRequest request) {
				
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
		
		
		String type = request.getParameter("type");
		
		if(type == null) {
			return "cart";
		} else {
			
			if(washingList.size() == 0 && mendingList.size() == 0 && keepList.size() == 0) {
				return "cart"; 
			}
			
			int havePoint = mileageService.getSum(member_id);
			
			ArrayList<CouponVO> couponList = couponService.getCouponList(member_id);
			int haveCoupon = couponService.getCouponCount(member_id);

			model.addAttribute("haveCoupon", haveCoupon);
			model.addAttribute("couponList", couponList);
			
			model.addAttribute("havePoint", havePoint);
			
			return "order"; 
		}
	}
		
	
	// 장바구니 비우기
	@RequestMapping(value = "/cartDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cartDelete(@RequestParam(value="loc") String loc, 
			String[] washSeqArr, String[] repairSeqArr, String[] keepSeqArr) {
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		// 세탁 선택 시퀀스 
		ArrayList<WashingCartVO> washSeqList = new ArrayList<WashingCartVO>();
		// 수선 선택 시퀀스
		ArrayList<MendingCartVO> mendingSeqList = new ArrayList<MendingCartVO>(); 
		
		try {
			
			if(washSeqArr != null) {
				for(int i = 0; i < washSeqArr.length; i++) {
					WashingCartVO wcv = new WashingCartVO();
					int wash_seq = Integer.parseInt(washSeqArr[i]);
					int res = cartService.deleteWashCart(wash_seq);
					
					if(loc.equals("cart")) {
						int res2 = cartService.deleteWash(wash_seq);
					}
				}
			}
			
			if(repairSeqArr != null) {
				for(int i = 0; i < repairSeqArr.length; i++) {
					MendingCartVO mcv = new MendingCartVO();
					int repair_seq = Integer.parseInt(repairSeqArr[i]);
					int res = cartService.deleteMendingCart(repair_seq); 
					
					if(loc.equals("cart")) {
						int res2 = cartService.deleteMending(repair_seq);
					}
				}
			}
			
			if(keepSeqArr != null) {
				String member_id = "bit"; 
				List<KeepCartVO> list = cartService.getKeepSeq(member_id);
				int res = cartService.deleteKeepCart(member_id);
				
				if(loc.equals("cart")) {
					for(int i = 0; i < list.size(); i++) {
						int keep_seq = list.get(i).getKeep_seq();
						int res2 = cartService.deleteKeep(keep_seq);
					}					
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


	// 주문완료
	@RequestMapping(value = "/orderSuccess.do")
	public String orderSuccess() {
		
		return "order_success";
		
	}
	
	// 주문 정보 입력
	@RequestMapping(value = "/insertOrder.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public OrderVO insertOrder(OrderVO ovo, @RequestParam(value="usePoint") String usePoint) {
		
		System.out.println(usePoint + " usePoint");
		String member_id = "bit"; 
		long order_num = System.currentTimeMillis();
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		String date = sdf.format(today);
		
		ovo.setOrder_num(order_num);
		ovo.setOrder_date(date);
		
		int res = orderService.insertOrder(ovo);

		orderService.deleteWashCartbyID(member_id);
		orderService.deleteMendingCartbyID(member_id);
		orderService.deleteKeepCartbyID (member_id);

		return ovo;
	}


	
}
