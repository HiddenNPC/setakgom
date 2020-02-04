package com.spring.admin_order;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.order.OrderVO;

@Controller
public class AdminOrderController {
	
	@Autowired
	private AdminOrderService adminOrderService; 
	
	//주문 관리자 페이지
	@RequestMapping(value = "/admin/order.do")
	public String adminOrder(Model model, HttpServletRequest request) {
		
		// 전체 주문 개수
		ArrayList<OrderVO> orderList = adminOrderService.getOrderList();
		int orderCount = adminOrderService.getOrderCount();
		
		// 페이지
		int page = 1;
	    int limit = 10;
	    
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
	    int startrow = (page-1)*10 +1;
	    int endrow = startrow + limit-1;

	    int maxpage = (int)((double)orderCount/limit+0.95);
	    int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
	    int endpage = startpage + 10-1;
	    
	    if(endpage > maxpage)
	    {
	      endpage = maxpage;
	         
	    }
	    
	    model.addAttribute("limit", limit);
	    model.addAttribute("page", page);
	    model.addAttribute("maxpage", maxpage);
	    model.addAttribute("startpage", startpage);
	    model.addAttribute("endpage", endpage);
	    model.addAttribute("listcount", orderCount);
		
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("orderList", orderList);
		
		return "/admin/order";
	}
	
	@RequestMapping(value = "/admin/orderSearch.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody 
	public ArrayList<OrderVO> orderSearch(@RequestParam(value="searchType") String searchType, @RequestParam(value="keyword") String keyword,
			String[] statusArr, @RequestParam(value="startDate") String startDate, @RequestParam(value="endDate") String endDate) {

		String start = startDate.replace("-", "/").substring(2, startDate.length());
		String end = endDate.replace("-", "/").substring(2, endDate.length());

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("statusArr", statusArr);
		
		ArrayList<OrderVO> orderSearchList = adminOrderService.orderSearch(map);
		
		System.out.println("orderSearchList size : " + orderSearchList.size());
		

		return orderSearchList;
		
	}

}
