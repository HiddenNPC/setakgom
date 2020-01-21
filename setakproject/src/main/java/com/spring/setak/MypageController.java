package com.spring.setak;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mapper.MypageMapper;

@Controller
public class MypageController {
	
	@Autowired
	private MendingServiceImpl mendingService;
	
	/*
	@RequestMapping("/orderview.do")
	public String list(HttpServletRequest request, Model model) throws Exception{
		
		MendingVO mendingVO = new MendingVO();
		
		ArrayList<MendingVO> mendinglist = null;
		mendinglist = mendingService.getMendinglist(mendingVO);
		
		model.addAttribute("mendinglist", mendinglist);
		
		return "orderview";
	}
	
	*/
	
	@RequestMapping("/orderview.do")
	public String selectMending(HttpServletRequest request, Model model) throws Exception{
		
		MendingVO mendingVO = new MendingVO();
		OrderVO orderVO = new OrderVO();
		int repair_seq = 26;
		int order_num = 111117;
		mendingVO = mendingService.selectMending(repair_seq);
		orderVO = mendingService.selectOrder(order_num);
		model.addAttribute("mendingVO", mendingVO);
		model.addAttribute("orderVO", orderVO);
		
		return "orderview";
	}	
	
	@RequestMapping("/mykeep.do")
	public String selectKeep () throws Exception{
		
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

