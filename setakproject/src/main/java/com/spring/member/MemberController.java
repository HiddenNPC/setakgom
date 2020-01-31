package com.spring.member;

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

	    
	// 회원가입 클릭 (메인, 로그인페이지)
	@RequestMapping(value = "join.do", produces = "application/json; charset=utf-8")
	public String join() {
		return "joinform";
	}

	
	  //아이디 중복확인
	  
	  @RequestMapping(value="chk_id.do", produces = "application/json; charset=utf-8")
	  @ResponseBody 
	  public Map<String, Object> check_id(HttpServletRequest request,MemberVO mo) {
	  //	 System.out.println("컨트롤러mo="+mo.getMember_id());
	  Map<String,Object> result = new HashMap<String, Object>(); 

		  int res = memberservice.member_id(mo);
		 
		  if (res == 1) {
				result.put("res", "OK");
			} else {
				result.put("res", "FAIL");
				result.put("message", "Failure");

			}
			return result;
		}
	 
	
	// 멤버 추가
	@RequestMapping(value = "insertMember.do", produces = "application/json; charset=utf-8")
	@ResponseBody // 데이터를 전송(view가 아니다)
	public Map<String, Object> insertMember(MemberVO mo) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int res = memberservice.member_insert(mo);
			System.out.println("회원가입성공 id="+mo.getMember_id());
			result.put("res", "OK");
		} catch (Exception e) {
			result.put("res", "FAIL");
			result.put("message", "Failure");
		}
		return result;
	}

	
	// 개인정보 수정 클릭시 비밀번호 입력페이지로 이동
	@RequestMapping(value = "profile1.do", produces = "application/json; charset=utf-8")
	public String password() {
		return "password";
	}

	// 비밀번호 확인
	@RequestMapping(value = "chk_pw.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> chk_password(HttpServletRequest request, MemberVO mo) {
		System.out.println("컨트롤러mo="+mo.getMember_password());
		Map<String, Object> result = new HashMap<String, Object>();

		int res = memberservice.member_password(mo);

		if (res == 1) {
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
		String ids = (String) session.getAttribute("member_id");
		// System.out.println("session="+ids);

		MemberVO mvo = new MemberVO();
		mvo.setMember_id(ids);

		try {
			MemberVO mo = memberservice.member_list(mvo);
			model.addAttribute("mo", mo);

		} catch (Exception e) {
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


	// 회원탈퇴 클릭시
	@RequestMapping(value = "withdraw.do", produces = "application/json; charset=utf-8")
	public String withdraw() {
		return "withdraw";
	}

	// 탈퇴시 비밀번호 입력
	 @RequestMapping(value="withdraw_pass.do", produces = "application/json; charset=utf-8")
	 @ResponseBody 
	 public Map<String, Object> withdraw(HttpServletRequest request,MemberVO mo) {
	  //System.out.println("컨트롤러mo="+mo.getMember_password()); Map<String, Object>
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
	 
	 //비밀번호 일치하면 탈퇴 페이지로 이동
	 @RequestMapping(value = "withdrawform.do", produces = "application/json; charset=utf-8")
		public String withdrawform() {
			return "withdrawform";
	 }

	 
	/*
	 * //회원삭제
	 * 
	 * @RequestMapping(value = "deleteMember.do", produces =
	 * "application/json; charset=utf-8")
	 * 
	 * @ResponseBody public Map<String, Object> deleteMember(MemberVO mo) { //
	 * System.out.println("컨트롤러mo="+mo.getMember_password()); Map<String, Object>
	 * result = new HashMap<String, Object>();
	 * 
	 * int res = memberservice.member_delete(mo.getMember_id());
	 * 
	 * if (res == 1) { result.put("res", "OK"); } else { result.put("res", "FAIL");
	 * result.put("message", "Failure");
	 * 
	 * } return result; }
	 */
	 
}
