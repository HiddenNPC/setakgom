package com.spring.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private MemberService memberservice;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
/*로그인 이동 */
		@RequestMapping(value = "/login.do", produces = "application/json; charset=utf-8", method = {RequestMethod.GET, RequestMethod.POST })
		public String login(Model model, HttpSession session, HttpServletRequest request) {

			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			model.addAttribute("naver_url", naverAuthUrl);

			
			//카카오 로그인 인증 URL을 생성하기 위해 getAuthorizetaionUrl 호출 
			String kakaoUrl = KakaoLoginBO.getAuthorizationUrl(session); 
			model.addAttribute("kakao_url", kakaoUrl);
			model.addAttribute("backurl", request.getHeader("referer"));
			
			
			return "loginform";
		}
		
/* 일반로그인 */
		@RequestMapping(value="/loginpro.do",produces = "application/json; charset=utf-8")
		public String loginpro(HttpSession session, MemberVO mo, HttpServletResponse response, String backurl) throws Exception  {
		
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			
			 int res = memberservice.member_password(mo);
			
			 if(res == 1) {
				 session.setAttribute("member_id", mo.getMember_id());
//				 writer.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
//				 writer.flush();
//				 writer.println("<script type = 'text/javascript'>");
//				 writer.println("Swal.fire('하하하');");
//				 writer.println("</script>");
//				 writer.flush();
				 writer.write("<script>alert('로그인 성공!!'); location.href='"+backurl+"'; </script>");
			 } else {
				 writer.write("<script>alert('로그인 실패!! 아이디와 비밀번호를 확인해주세요'); location.href='javascript:history.back()';</script>");
			 }
			 
			 return null;
			}

	/*네이버 로그인 연동 */
	@RequestMapping(value = "/naver",produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam(required = false, defaultValue = "0") String code,
			@RequestParam String state, HttpSession session, HttpServletResponse response)
			throws IOException, ParseException {
		
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html; charset=utf-8"); PrintWriter writer =
		 response.getWriter();
		 
		 // 정보동의 취소시 이전페이지로 이동 
		 if (code.equals("0")) { 
			 writer.write("<script>alert('정보동의에 취소하셨습니다..');location.href='./login.do';</script>"); 
		 }
		 

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response시 값 가져오는 것

		String bid = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");
		String id = bid + "_N";
		//System.out.println(id + "/" + name + "/" + email);

		/* 4. 데이터 DB에 저장 */
		MemberVO mo = new MemberVO();
		mo.setMember_id(id);

		int res = memberservice.member_id(mo);
		if (res == 1) { // DB에 id가 있는경우
			session.setAttribute("name", name);
			session.setAttribute("member_id", id);
			System.out.println("네이버아이디로 로그인" + id);
			return "redirect:login.do";

		} else { // 등록되지 않은 회원이면 DB에 저장
			mo.setMember_id(id);
			mo.setMember_name(name);
			mo.setMember_email(email);

			int res2 = memberservice.linkage(mo);
			if (res2 == 1) { // 이미 네이버로 로그인 한 경우
				session.setAttribute("name", name);
				session.setAttribute("member_id", id);
				System.out.println("네이버아이디로 로그인" + id);
				
			} else {
				System.out.println("등록실패");
				return "redirect:login.do";
			}
			
		}
		return "redirect:login.do";
	}

	/* 카카오 로그인 연동 */
	@RequestMapping(value = "/kakao", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakao(Model model, @RequestParam("code") String code, HttpSession session, HttpServletResponse response) throws Exception {
		
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html; charset=utf-8"); PrintWriter writer =
		 response.getWriter();
		 
		 // 정보동의 취소시 이전페이지로 이동 
		 if (code.equals("0")) { 
			 writer.write("<script>alert('정보동의에 취소하셨습니다..');location.href='./login.do';</script>"); 
		 }
		
		// 결과값을 node에 담아줌
		JsonNode node = KakaoLoginBO.getKakaoAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있다
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = KakaoLoginBO.getKakaoUserInfo(accessToken);
		// DB에 맞게 받을 정보이름 수정
		String email = null;
		String nickname = null;
		String bid = null;

		// 유저정보 카카오에서 가져오기
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		bid = userInfo.path("id").asText();
		email = kakao_account.path("email").asText();
		nickname = properties.path("nickname").asText();
		String id = bid + "_K";
		//System.out.println(nickname + "/" + id + "/" + email);

		/* 4. 데이터 DB에 저장 */
		MemberVO mo = new MemberVO();
		mo.setMember_id(id);

		int res = memberservice.member_id(mo);
		if (res == 1) { // DB에 id확인
			session.setAttribute("name", nickname);
			session.setAttribute("member_id", id);
			System.out.println("카카오아이디로 로그인 "+id);

		} else { // 등록되지 않은 회원이면 DB에 저장
			mo.setMember_id(id);
			mo.setMember_email(email);
			mo.setMember_name(nickname);

			int res2 = memberservice.linkage(mo);
			if (res2 == 1) { // 이미 카카오로 회원가입 경우
				session.setAttribute("name", nickname);
				session.setAttribute("member_id", id);
				System.out.println("카카오아이디로 로그인 "+id);
			} else {
				System.out.println("등록실패");
				return "redirect:login.do";
			}
		}
		return "redirect:login.do";
	}

	/* 구글로그인 연동 */
	@RequestMapping(value = "/google.do",  produces = "application/json; charset=utf-8") 
	@ResponseBody
	public Map<String, Object> google (MemberVO mo, HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		String g_id = mo.getMember_id();
		String g_name = mo.getMember_name();
		String g_email = mo.getMember_email();

		// DB에 아이디가 있는지 확인
		int res = memberservice.member_id(mo); 
		if (res == 1 ) { // DB에 id가 있어요
			result.put("res", "OK");
			session.setAttribute("name", g_name);
			session.setAttribute("member_id", g_id);
			System.out.println("구글아이디로 로그인"+g_id);

		} else { // 등록되지 않은 회원이면 DB에 저장
			mo.setMember_id(g_id);
			mo.setMember_name(g_name);
			mo.setMember_email(g_email);

			int res2 = memberservice.linkage(mo);
			if (res2 == 1) { 
				result.put("res", "OK");
				session.setAttribute("name",  g_name);
				session.setAttribute("member_id", g_id);
				System.out.println("구글아이디로 로그인"+g_id);
				
			} else {
				result.put("res", "FAIL");
				result.put("message", "Failure");
			}
		}
		
		return result;
	}
		
	//로그아웃
	@RequestMapping(value="/logout.do", produces = "application/json; charset=utf-8")
	public String logout(HttpSession session, MemberVO mo) throws Exception {

		session.removeAttribute("member_id");
		session.removeAttribute("name");
		return "redirect:login.do";
		
	}

}