package com.spring.setak;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mapper.MypageMapper;
import com.spring.order.OrderVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageServiceImpl mypageService;
	
	/*
	@RequestMapping("/orderview.do")
	public String list(HttpServletRequest request, Model model) throws Exception{
		
		MendingVO mendingVO = new MendingVO();
		
		ArrayList<MendingVO> mendinglist = null;
		mendinglist = mypageService.getMendinglist(mendingVO);
		
		model.addAttribute("mendinglist", mendinglist);
		
		return "orderview";
	}
	
	*/
	
	@RequestMapping("/orderview.do")
	public String selectMending(HttpServletRequest request, Model model) throws Exception{
		
		ArrayList<OrderVO> orderlist = null;
		MendingVO mendingVO = new MendingVO();
		OrderVO orderVO = new OrderVO();
		KeepVO keepVO = new KeepVO();
		
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum ="1";
		}
		
		int count = mypageService.getOrdercount();
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		if (count < startRow) {
			currentPage = currentPage - 1;
			startRow = (currentPage - 1) * pageSize + 1;
			endRow = startRow + pageSize - 1;
		}
		if (count > 0) {
			orderVO.setStartRow(startRow);
			orderVO.setEndRow(endRow);
			orderlist = mypageService.getOrderlist(orderVO);
		}
		
		int number = count - (currentPage - 1) * pageSize;
		int pageCount = ((count - 1) / pageSize) + 1;
		int startPage = -1;
		
		int pageBlock = 10;
		if(currentPage%pageBlock != 0)
			startPage = (int)(currentPage/pageBlock)*pageBlock +1;
		else startPage = currentPage - 9;
		
		
		int repair_seq = 51;
		int keep_seq= 26;
		long order_num = orderVO.getOrder_num();
		
		mendingVO = mypageService.selectMending(repair_seq);
		orderVO = mypageService.selectOrder(order_num);
		keepVO = mypageService.selectKeep(keep_seq);
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("mendingVO", mendingVO);
		model.addAttribute("orderVO", orderVO);
		model.addAttribute("count", count);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("number", number);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("keepVO", keepVO);
		
		return "orderview";
	}	
	
	@RequestMapping("/mykeep.do")
	public String selectKeep (HttpServletRequest request, Model model) throws Exception{
		
		
		return "mykeep";
	}
	
	@RequestMapping("/qnainquiry.do")
	public String selectQnainquiry () throws Exception{
		
		return "qnainquiry";
	}
	
	@RequestMapping("/mysavings.do")
	public String selectSaving () throws Exception{
		
		return "mysavings";
	}

	@RequestMapping("/mycoupon.do")
	public String selectMycoupon() throws Exception{
		
		return "mycoupon";
	}
}

