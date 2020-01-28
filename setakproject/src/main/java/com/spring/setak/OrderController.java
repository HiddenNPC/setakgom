package com.spring.setak;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String cart(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
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
			
			int havePoint = mileageService.getSum(member_id);
			
			ArrayList<CouponVO> couponList = couponService.getAbleCouponList(member_id);
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
	public String orderSuccess(HttpServletRequest request, Model model) {
		
		String member_id = "bit"; 
		
		long order_num = Long.parseLong(request.getParameter("order_num"));

		OrderListVO olv = new OrderListVO();
		olv.setOrder_num(order_num);
		
		List<OrderListVO> orderList = orderService.getOrderList(olv);
		
		List<WashingVO> washingList = new ArrayList<WashingVO>();
		List<MendingVO> mendingList = new ArrayList<MendingVO>();
		List<KeepVO> keepList = new ArrayList<KeepVO>();
		
		List<WashingVO> washingList2 = new ArrayList<WashingVO>();
		List<MendingVO> mendingList2 = new ArrayList<MendingVO>();
		List<KeepVO> keepList2 = new ArrayList<KeepVO>();
		
		for(int i = 0; i < orderList.size(); i++) {
			
			OrderListVO ovo = orderList.get(i);
	
			
			if(ovo.getWash_seq() != 0) {
				WashingVO wvo = new WashingVO();
				wvo.setWash_seq(ovo.getWash_seq());
				washingList.add(wvo);
			}
			
			if(ovo.getRepair_seq() != 0) {
				MendingVO mvo = new MendingVO();
				mvo.setRepair_seq(ovo.getRepair_seq());
				mendingList.add(mvo);
			}
			
			if(ovo.getKeep_seq() != 0) {
				KeepVO kvo = new KeepVO();
				kvo.setKeep_seq(ovo.getKeep_seq());
				keepList.add(kvo);
			}
		}
		

		for(int i = 0; i < washingList.size(); i++) {
			int wash_seq = washingList.get(i).getWash_seq();
			WashingVO wvo = cartService.getWashingList(wash_seq);
			washingList2.add(wvo);
		}		
		
		for(int i = 0; i < mendingList.size(); i++) {
			int repair_seq = mendingList.get(i).getRepair_seq();
			MendingVO mvo = cartService.getMendingList(repair_seq);
			mendingList2.add(mvo);
		}		
	
		for(int i = 0; i < keepList.size(); i++) {
			int keep_seq = keepList.get(i).getKeep_seq();
			KeepVO kvo = cartService.getKeepList(keep_seq);
			keepList2.add(kvo);
		}				
		
		// 장바구니 비우기
		orderService.deleteWashCartbyID(member_id);
		orderService.deleteMendingCartbyID(member_id);
		orderService.deleteKeepCartbyID (member_id);
		
		int price = orderService.getOrderPrice(olv);
		
		model.addAttribute("washingList", washingList2);
		model.addAttribute("mendingList", mendingList2);
		model.addAttribute("keepList", keepList2);
		model.addAttribute("price", price);
		
		
		
		return "order_success";
		
	}
	
	// 주문 정보 입력
	@RequestMapping(value = "/insertOrder.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public OrderVO insertOrder(OrderVO ovo, @RequestParam(value="usePoint") String usePoint, String[] useCoupon) {
		
		
		String member_id = "bit"; 

		// 장바구니 시퀀스 값 읽기
		
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

		// 주문번호
		long order_num = System.currentTimeMillis();

		// 주문목록 DB 저장
		int wash_size = list3.size();
		int repair_size = list2.size();
		int keep_size = list.size();
		
		int big = (wash_size>repair_size)&&(wash_size>keep_size)?wash_size:(keep_size>repair_size?keep_size:repair_size);
		

		List<OrderListVO> orderList = new ArrayList<OrderListVO>();
		
		for(int i = 0; i < big; i++) {
			OrderListVO olv = new OrderListVO();
			// 주문번호 저장
			olv.setOrder_num(order_num);
			// 세탁 시퀀스 저장
			if(washingList.size() > i) {
				if(washingList.get(i) != null) {
					olv.setWash_seq(washingList.get(i).getWash_seq());
				}				
			}
			// 수선 시퀀스 저장
			if(mendingList.size() > i) {
				if(mendingList.get(i) != null) {
					olv.setRepair_seq(mendingList.get(i).getRepair_seq());
				}
			}
			
			// 보관 시퀀스 저장
			if(keepList.size() > i) {
				if(keepList.get(i) != null) {
					olv.setKeep_seq(keepList.get(i).getKeep_seq());
				}
			}
			
			orderList.add(olv);
		}
		

		// 주문날짜, 적립금 사용 날짜
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy/MM/dd"); 
		String date = sdf.format(today);
		String date2 = sdf2.format(today);
		
		ovo.setOrder_num(order_num);
		ovo.setOrder_date(date);
		ovo.setOrder_delete(0);
		
		
		// 주문 테이블 DB 추가
		int res = orderService.insertOrder(ovo);				

		for(int i = 0; i < orderList.size(); i++) {
			OrderListVO olv = orderList.get(i);
			orderService.insertOrderList(olv);
		}		

		// 사용 적립금 차감 
		if(usePoint != "") {
			MileageVO mvo = new MileageVO();
			int point = Integer.parseInt(usePoint) * (-1);
			mvo.setMember_id(member_id);
			mvo.setMile_date(date2);
			mvo.setMile_content("결제 차감");
			mvo.setMile_price(point);
			
			mileageService.useMileage(mvo);
			
		}
		
		// 사용 쿠폰 소멸 
		if(useCoupon != null) {
						
			for(int i = 0; i < useCoupon.length; i++) {
				int coupon_seq = Integer.parseInt(useCoupon[i]);
				couponService.useCoupon(coupon_seq);
			}
		}
		
		return ovo;
	}


	
}
