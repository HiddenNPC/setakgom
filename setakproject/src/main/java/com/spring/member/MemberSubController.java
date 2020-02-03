package com.spring.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberSubController {

	@Autowired
	private MemberSubService membersubservice;
	
	@Autowired
	private MemberService memberservice;
	

	@RequestMapping(value="mysub.do", produces = "application/json; charset=utf-8")
	public String mysub(Model model, HttpSession session,HttpServletRequest request) {
		
		String member_id = (String)session.getAttribute("member_id");
		//System.out.println("member_id="+member_id);
		
		
		/*나의정기구독*/
		MemberSubVO sub_list = membersubservice.sub_list(member_id);
		model.addAttribute("sub_list", sub_list);
		
		/*해당 정기구독 리스트*/
		SubscribeVO subscribe = membersubservice.subscribe_list(member_id);
		model.addAttribute("subscribe", subscribe);
		
		/*멤버 이름*/
		MemberVO name1 = memberservice.name(member_id);
		model.addAttribute("name", name1);
		  
		/*정기구독 내역 리스트*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int page = 1;
	    int limit = 10;
	
	    if(request.getParameter("page") != null) {
	        page = Integer.parseInt(request.getParameter("page"));
	    }
	    
	    int startrow = (page-1)*10 +1;
	    int endrow = startrow + limit-1;
	    
	    int listcount = membersubservice.listcount(member_id); 
	   
	    
	    map.put("startrow", startrow);
	    map.put("endrow", endrow);
	    map.put("member_id", member_id);
	    
	    ArrayList<HistorySubVO> subhistory_list = membersubservice.subhistory_list(map);
	    
	      int maxpage = (int)((double)listcount/limit+0.95);
	      int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
	      int endpage = startpage + 10-1;
	      //System.out.println("max"+maxpage);
	      //System.out.println("start"+startpage);
	      //System.out.println("end"+endpage);
	      if(endpage > maxpage)
	      {
	         endpage = maxpage;
	         
	      }
	      
	      
	      model.addAttribute("subhistory_list", subhistory_list);
	      model.addAttribute("limit", limit);
	      model.addAttribute("page", page);
	      model.addAttribute("maxpage", maxpage);
	      model.addAttribute("startpage", startpage);
	      model.addAttribute("endpage", endpage);
	      model.addAttribute("listcount", listcount);
		
		/*
		for(int i = 0; i <subhistory_list.size(); i++) {
			System.out.println(subhistory_list.get(i).getHis_name());
		}
	*/
		return "mysub";
	}

}
