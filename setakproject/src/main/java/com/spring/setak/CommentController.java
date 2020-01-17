package com.spring.setak;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.spring.setak.CommentVO;


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
	
	@PostMapping(value="commentList.re", produces="application/json; charset=UTF-8")
	public  List<CommentVO> commentList(CommentVO vo) 
	{	
		System.out.println("컨트롤러,qnum="+ vo.getQna_num());
		List<CommentVO> list = commentService.commentList(vo);
		return list;

	}
	
	@PostMapping(value="commentInsert.re", produces="application/json; charset=UTF-8")
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
	
	@PostMapping(value="commentDelete.re", produces="application/json; charset=UTF-8")
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
	
	@PostMapping(value="/commentUpdate.re", produces="application/json; charset=UTF-8")
	public Map<String, Object> commentUpdate(CommentVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		/*
		 * System.out.println(vo.getQNA_SEQ()); System.out.println(vo.getQNA_NUM());
		 * System.out.println(vo.getQNA_CONTENT());
		 */
		
		
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
	
	
	
	
	
	
	
	
	
	
	

}
