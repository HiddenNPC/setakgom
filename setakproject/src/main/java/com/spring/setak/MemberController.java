package com.spring.setak;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	

	// 로그인버튼 클릭시 로그인페이지으로 이동
	@RequestMapping(value = "login.do", produces = "application/json; charset=utf-8")
	public String loginform() {
		return "loginform";
	}
	
	//로그인되면 메인으로 이동
	@RequestMapping(value = "main.do", produces = "application/json; charset=utf-8")
	public String main() {
		return "main";
	}

	// 회원가입 클릭 (메인, 로그인페이지)
	@RequestMapping(value = "join.do", produces = "application/json; charset=utf-8")
	public String join() {
		return "joinform";
	}

	// 멤버 추가
	@RequestMapping(value = "/insertMember.do", produces = "application/json; charset=utf-8")
	@ResponseBody // 데이터를 전송(view가 아니다)
	public Map<String, Object> insertMember(MemberVO mo) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int res = memberservice.member_insert(mo);
			result.put("res", "OK");
		} catch (Exception e) {
			result.put("res", "FAIL");
			result.put("message", "Failure");
		}
		return result;
	}

	// 로그인
	@RequestMapping(value = "logintest.do", produces = "application/json; charset=utf-8")
	public String logintest() {
		return "logintest";
	}

	// 개인정보 수정 클릭시 비밀번호 입력페이지로 이동
	@RequestMapping(value = "profile1.do", produces = "application/json; charset=utf-8")
	public String password() {
		return "password";
	}

	
	  //비밀번호 확인
	  @RequestMapping(value="password.do", produces = "application/json; charset=utf-8") 
	  @ResponseBody 
	  public Map<String, Object> chk_password(HttpServletRequest request,MemberVO mo) {
		  //System.out.println("컨트롤러mo="+mo.getMember_password());
		  Map<String, Object> result = new HashMap<String, Object>();
		  		
			    int res = memberservice.member_password(mo);
			    
			    if(res == 1) {
			    result.put("res", "OK");
			    } else {
				result.put("res", "FAIL");
				result.put("message", "Failure");
			
		  }
		  	return result;
	  }
	  
	 

	// 비밀번호 입력후 개인정보수정 페이지로 이동
		@RequestMapping(value = "profile2.do", produces = "application/json; charset=utf-8")
		public String profile(HttpServletRequest request, Model model) {
			
				HttpSession session = request.getSession();
				String ids = (String)session.getAttribute("id");
				//System.out.println("session="+ids);
				
				MemberVO mvo = new MemberVO();
				mvo.setMember_id(ids);
				
			try {
				MemberVO mo = memberservice.member_list(mvo);
				model.addAttribute("mo",mo);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
				
			return "profile";
		}

	// 멤버 수정
		@RequestMapping(value = "/updateMember.do", produces = "application/json; charset=utf-8")
		@ResponseBody // 데이터를 전송(view가 아니다)
		public Map<String, Object> updateMember(MemberVO mo) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {
				int res = memberservice.member_update(mo);
				result.put("res", "OK");
			} catch (Exception e) {
				result.put("res", "FAIL");
				result.put("message", "Failure");
			}
			return result;
		}	

	// 멤버 삭제

}
