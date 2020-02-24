package com.spring.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.community.CommentVO;


/*
 * @RestController는 Spring MVC Controller에 @ResponseBody가 추가된 것입니다. 
 * 주용도는 Json/Xml 형태로 객체 데이터를 반환하는 것입니다. 
 * 개인적으로는 VueJS + Spring boot 프로젝트를 진행할 때 Spring boot를 API 서버로 활용할 때 사용하였습니다.
 * Client는 URI 형식으로 웹 서비스에 요청을 보낸다. 
 * Mapping되는 Handler와 그 Type을 찾는 DispatcherServlet이 요청을 인터셉트한다. 
 * RestController는 해당 요청을 처리하고 데이터를 반환한다.
 */
@RestController
public class CommentController 
{
	@Autowired CommentService commentService;
	@Autowired QnaService qnaService;
	
	@PostMapping(value="/commentList.do", produces="application/json; charset=UTF-8")
	public  List<CommentVO> commentList(CommentVO vo) 
	{	
		System.out.println("컨트롤러,qnum="+ vo.getQna_num());
		List<CommentVO> list = commentService.commentList(vo);
		return list;

	}
	
	@PostMapping(value="/commentInsert.do", produces="application/json; charset=UTF-8")
	public Map<String, Object> commentInsert(CommentVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = commentService.commentInsert(vo);
			
			retVal.put("res", "OK");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	@PostMapping(value="/commentDelete.do", produces="application/json; charset=UTF-8")
	public Map<String, Object> commentDelete(CommentVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = commentService.commentDelete(vo);		
			if (res==1)
				retVal.put("res", "OK");
			else
				retVal.put("res", "Err");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	@PostMapping(value="/commentUpdate.do", produces="application/json; charset=UTF-8")
	public Map<String, Object> commentUpdate(CommentVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		
		try {
			int res = commentService.commentUpdate(vo);			
			if (res==1)
				retVal.put("res", "OK");
			else if (res==-1)
				retVal.put("res", "PassErr");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	@RequestMapping(value="admin/ad_commentList.do", produces="application/json; charset=UTF-8",  method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody public List<CommentVO> ad_commentList(CommentVO vo) 
	{	
		List<CommentVO> list = commentService.ad_commentList(vo);	
		return list;

	}
	
	@PostMapping(value="admin/commentInsert.do", produces="application/json; charset=UTF-8")
	public Map<String, Object> ad_commentInsert(CommentVO vo, QnaVO qvo, HttpServletRequest request) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		vo.setQna_num(Integer.parseInt(request.getParameter("qna_num")));
		vo.setQna_content(request.getParameter("qna_content"));
		vo.setMember_id("관리자");
		qvo.setQna_check(request.getParameter("qna_check"));
		qvo.setQna_num(Integer.parseInt(request.getParameter("qna_num")));
		
		try {
			int res = commentService.commentInsert(vo);
			int res2 = qnaService.ad_qnaModify(qvo);
			
			retVal.put("res", "OK");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	@PostMapping(value="admin/commentUpdate.do", produces="application/json; charset=UTF-8")
	public Map<String, Object> ad_commentUpdate(CommentVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = commentService.commentUpdate(vo);	
			
			if (res==1) {
				retVal.put("res", "OK");
				
			}else {
				retVal.put("res", "Err");}
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	
	@PostMapping(value="admin/commentDelete.do", produces="application/json; charset=UTF-8")
	public Map<String, Object> ad_commentDelete(CommentVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = commentService.commentDelete(vo);		
			if (res==1)
				retVal.put("res", "OK");
			else
				retVal.put("res", "Err");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
	
	
	

}
