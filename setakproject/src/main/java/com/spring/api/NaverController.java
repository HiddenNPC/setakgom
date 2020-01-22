package com.spring.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NaverController {
	
	@Autowired
	public Sens_sms_v2 sms;

	@RequestMapping(value="sendSMS.do")
    public @ResponseBody String sendsms() throws Exception {
		
		sms.setMsgtext("이걸로 내가 메세지를 정할 수 있음");
		sms.sendMessage();
		
		
		return "";
	}
}
