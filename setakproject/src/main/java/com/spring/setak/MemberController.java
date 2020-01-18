package com.spring.setak;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired 
	private MemberService memberservice;
	
	//멤버 리스트
	
	//멤버 추가
	@RequestMapping(value="/insertMember.do", produces = "application/json; charset=utf-8")
	@ResponseBody //데이터를 전송(view가 아니다)
	public Map<String, Object>insertMember(MemberVO mo) {
		System.out.println(" gg");
		Map<String, Object> result = new HashMap <String, Object> (); 
			try {
				int res = memberservice.member_insert(mo);
				result.put("res","OK");
			} catch (Exception e) {
				result.put("res", "FAIL");
				result.put("message", "Failure");
			}
			return result;
	}
	
	//멤버 수정
	
	//멤버 삭제
	
	
}
