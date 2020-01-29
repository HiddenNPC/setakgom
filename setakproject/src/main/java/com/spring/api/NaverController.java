package com.spring.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NaverController {
	
	@Autowired
	public Sens_sms_v2 sms;

	@RequestMapping(value="sendSMS.do")
    public @ResponseBody String sendsms(String pn, HttpServletRequest request) throws Exception {
		
		String ip = request.getRemoteAddr();
		System.out.println(ip);
		String r = request.getParameter("randomnum");
		System.out.println(r);
		
		sms.setPhonenumber(request.getParameter("pn"));
		sms.setMsgtext("인증번호는 " + request.getParameter("randomnum") + " 입니다.");
		//sms.sendMessage();
		
		return "";
	}
	
}
