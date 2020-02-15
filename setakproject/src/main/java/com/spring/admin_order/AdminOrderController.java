package com.spring.admin_order;

import java.util.ArrayList;
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

import com.spring.member.MemberSubService;
import com.spring.member.MemberSubVO;
import com.spring.order.OrderVO;

@Controller
public class AdminOrderController {
	
	@Autowired
	private AdminOrderService adminOrderService; 
	@Autowired
	private AdminSubscribeService adminMemberSubService; 
	
	//전체 주문 관리자 페이지
	@RequestMapping(value = "/admin/order.do")
	public String adminOrder(Model model, HttpServletRequest request) {
		
		// 전체 주문 개수
		ArrayList<OrderVO> orderList = adminOrderService.getOrderList();
		int orderCount = adminOrderService.getOrderCount();
		
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("orderList", orderList);
		
		return "/admin/order";
	}
	
	// 주문 검색 
	@RequestMapping(value = "/admin/orderSearch.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public Map<String, Object> orderSearch(@RequestParam(value="searchType") String searchType, @RequestParam(value="keyword") String keyword,
			String[] statusArr, @RequestParam(value="startDate") String startDate, @RequestParam(value="endDate") String endDate, 
			@RequestParam(value="orderBy") String orderBy) {
		
		String start = startDate.replace("-", "/").substring(2, startDate.length());
		String end = endDate.replace("-", "/").substring(2, endDate.length());

		// 검색어 설정 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("statusArr", statusArr);
		map.put("orderBy", orderBy);
		
		int orderSearchCount = adminOrderService.orderSearchCount(map);
		ArrayList<OrderVO> orderSearchList = adminOrderService.orderSearch(map);
		
		Map<String, Object> retVal = new HashMap<String, Object>();

	    retVal.put("orderSearchCount", orderSearchCount);
		retVal.put("orderSearchList", orderSearchList);

		return retVal;
		
	}
	
	// 주문 상세보기
	@RequestMapping(value = "/admin/orderSelect.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public OrderVO orderSelect(OrderVO ovo) {
		
		OrderVO orderVO = adminOrderService.getOrderInfo(ovo);		
		return orderVO; 
	}
	
	// 주문 상세정보 수정
	@RequestMapping(value = "/admin/orderUpdate.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public OrderVO orderUpdate(OrderVO ovo) {
		
		adminOrderService.updateOrderInfo(ovo);
		OrderVO orderVO = adminOrderService.getOrderInfo(ovo);

		return orderVO; 
	}
	
	// 주문 상태 수정 
	@RequestMapping(value = "/admin/statusUpdate.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public OrderVO statusUpdate(String[] orderNumArr, OrderVO ovo) {
		
		String order_status = ovo.getOrder_status();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderNumArr", orderNumArr);
		map.put("order_status", order_status);
		
		int res = adminOrderService.statusUpdate(map);

		return ovo; 
	}
	
	// 기타 주문관리
	@RequestMapping(value = "/admin/orderChart.do")
	public String adminOrder(Model model) {
		
		String[] statusArr = {"결제완료", "수거중", "서비스중", "배송중", "배송완료", "주문취소"};
		
//		 오늘 날짜를 기준으로 최근 5일간의 주문 상태변화  > 근데 테스트 해야되니까 일단 1/27~1/31 고정
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
//		
//		String today = sdf.format(cal.getTime());
//		String[] dateArr = new String[5];
//		dateArr[0] = today; 
//		for(int i = 1; i < 5; i++) {
//			cal.add(Calendar.DATE, -1);
//			dateArr[i] = sdf.format(cal.getTime());
//		}
		
		// weekArr 바뀌는거 안해놈.. 
		
		String[] dateArr = {"20/01/27", "20/01/28", "20/01/29", "20/01/30", "20/01/31"}; 
		String[] weekArr = {"20/01/27", "20/01/28", "20/01/28", "20/01/29", "20/01/29", "20/01/30", "20/01/30", "20/01/31", "20/01/31", "20/02/01"}; 
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 상태별 배열 
		int[] payArr = new int[5]; 
		int[] pickArr = new int[5]; 
		int[] serviceArr = new int[5]; 
		int[] deliveryArr = new int[5]; 
		int[] completeArr = new int[5]; 
		int[] cancleArr = new int[5]; 
		
		// 기간별 배열 : 일별, 주별 
		int[] dailyArr = new int[5];
		int[] weeklyArr = new int[5];
		
		int dailySum = 0; 
		int weeklySum = 0; 
		
		for(int i = 0; i < statusArr.length; i++) {
			String status = statusArr[i]; 
			map.put("order_status", status);
			int daily = 0; 
			
			for(int j = 0;  j < dateArr.length; j++) {
				map.put("order_date", dateArr[j]);
				int dailyResult = 0; 
				int result = adminOrderService.recentOrderStatusCnt(map);
				
				// 상태별 총 주문량 계산
				switch(i) {
				case 0 :
					payArr[j] = result; 
					break;
				case 1 :
					pickArr[j] = result; 
					break;
				case 2 :
					serviceArr[j] = result; 
					break;
				case 3 :
					deliveryArr[j] = result; 
					break;
				case 4 :
					completeArr[j] = result; 
					break;
				case 5 :
					cancleArr[j] = result; 
					break;
				}
				
				// 일별 총 주문량 계산
				if(i == statusArr.length - 1) {
					dailyResult = adminOrderService.recentOrderCnt(map);
					dailyArr[j] = dailyResult; 
					dailySum += dailyResult;
				}
			}
			
		}
				
		// 주별 총 주문량 계산 
		for(int i = 0; i < weekArr.length; i+=2) {
			String start = weekArr[i];
			String end = weekArr[i+1];
			
			map.put("startDate", start);
			map.put("endDate", end);
			
			int result = adminOrderService.recentOrderWeeklyCnt(map);
			weeklyArr[i/2] = result; 
			weeklySum += result;
		}

		model.addAttribute("payArr", payArr);
		model.addAttribute("pickArr", pickArr);
		model.addAttribute("serviceArr", serviceArr);
		model.addAttribute("deliveryArr", deliveryArr);
		model.addAttribute("completeArr", completeArr);
		model.addAttribute("cancleArr", cancleArr);
		
		model.addAttribute("dailyArr", dailyArr);
		model.addAttribute("weeklyArr", weeklyArr);
		model.addAttribute("dailySum", dailySum);
		model.addAttribute("weeklySum", weeklySum);
		
		return "/admin/order_chart";
	}
	
	// 정기구독 관리자 페이지
	@RequestMapping(value = "/admin/subscribe.do")
	public String subscribe() {
		
		return "/admin/subscribe";
		
	}
	
	// 정기구독 관리자 리스트 띄우기
	@RequestMapping(value = "/admin/getMemberSubList.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<Object> getMemberSubList() {
		
		List<Object> memberSubList = adminMemberSubService.getMemberSubList();
		return memberSubList;
		
	}
	
	@RequestMapping(value = "/admin/subMemberSearch.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<Object> subMemberSearch(@RequestParam(value="keyword") String keyword, String[] planArr, @RequestParam(value="orderBy") String orderBy) {
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderBy", orderBy);
		map.put("keyword", keyword);
		map.put("planArr", planArr);
		
		List<Object> memberSubList = adminMemberSubService.subMemberSearch(map);
		
		return memberSubList;
		
	}
		
		
	
}
