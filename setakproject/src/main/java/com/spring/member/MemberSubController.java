package com.spring.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class MemberSubController {

	@Autowired
	private MemberSubService mss;
	
	/*
	 * @RequestMapping(value="mysub.do",produces =
	 * "application/json; charset=utf-8"){ public String getMemberSublist(Model
	 * model) throws Exception { MemberSubVO msv = mss model.addAttribute("msv",
	 * msv);
	 * 
	 * }catch (Exception e) { e.printStackTrace(); } return "mysub"; }
	 */
}
