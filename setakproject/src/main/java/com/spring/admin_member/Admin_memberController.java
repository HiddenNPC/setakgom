package com.spring.admin_member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.member.MemberVO;

@Controller
public class Admin_memberController {
	
	@Autowired
	private Admin_memberService admemberservice;
	
	/*회원관리 페이지로 이동*/
	@RequestMapping(value="/admin/member.do", produces = "application/json; charset=utf-8") 
	public String list(Model model, HttpServletRequest request) {
		
		//회원 리스트 출력
		HashMap<String, Object> map = new HashMap<String, Object>();
	   
		int page = 1;
	    int limit = 20; // 숫자를 바꿔요
	    
	    if(request.getParameter("page") != null) {
	        page = Integer.parseInt(request.getParameter("page"));
	    }
	    
	    int startrow = (page-1)*20 +1; // 이것도 숫자를 바꿔줘야합니다
	    int endrow = startrow + limit-1;
	    
	    map.put("startrow", startrow);
	    map.put("endrow", endrow);
	    ArrayList<MemberVO> list =  admemberservice.adminlist(map);
	    
	    
	    int listcount = admemberservice.adminlistcount();
	    int maxpage = (int)((double)listcount/limit+0.95);
	    int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
	    int endpage = startpage + 10-1;
	    if(endpage > maxpage)
	      {
	         endpage = maxpage;
	         
	      }
	    
	    //오늘 가입한 회원 수
	    int todaycount = admemberservice.todaycount();
	    
	  
	    model.addAttribute("page", page);
	    model.addAttribute("limit", limit);
	    model.addAttribute("list", list);
	    model.addAttribute("listcount", listcount);
	    model.addAttribute("maxpage", maxpage);
	    model.addAttribute("startpage",startpage);
	    model.addAttribute("endpage", endpage );
	    model.addAttribute("todaycount", todaycount);
		 
		return "/admin/member";
	}
	
	
	/*메모 수정*/
	@RequestMapping(value ="/admin/admin_update.do", produces = "application/json; charset=utf-8")
	@ResponseBody // 데이터를 전송(view가 아니다)
	public Map<String, Object> update_memo (MemberVO mo) {
		Map<String, Object> result = new HashMap<String, Object>();
		
			int res = admemberservice.update_memo(mo);
			if (res == 1) {
				result.put("res", "OK");
				System.out.println("메모수정 id="+mo.getMember_id());
			} else {
				result.put("res", "FAIL");
				result.put("message", "Failure");

			}
		return result;
	}
}
