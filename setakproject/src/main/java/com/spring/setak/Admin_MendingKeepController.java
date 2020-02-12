package com.spring.setak;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Admin_MendingKeepController {

	@Autowired()
	private Admin_MendingKeepService mendingKeepService;
		
	@RequestMapping(value="/getKeepList.do", produces="application/json;charset=UTF-8")
	public List<Object> getKeepList() {
		List<Object> list = mendingKeepService.getKeepList();
		
		return list;
	}
	
	@RequestMapping(value="/updateKeep.do", produces="application/json;charset=UTF-8")
	public Map<String, Object> updateKeep(KeepVO params){
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = mendingKeepService.updateKeep(params);
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@RequestMapping(value="/keepImg.do")
	public String keepImg(HttpSession session , HttpServletRequest request, HttpServletResponse response) throws Exception {
		String keep_file[] = request.getParameterValues("keep_file");
		
		KeepVO keep = new KeepVO();
		for(int i =0; i<keep_file.length; i++) {
			System.out.println(keep_file[i]);
		}
		keep.setKeep_seq(Integer.parseInt(request.getParameter("keep_seq")));
		keep.setKeep_file(request.getParameter("keep_file"));

		System.out.println(request.getParameter("keep_file"));
		System.out.println(request.getParameter("keep_seq"));
		
		int res = mendingKeepService.keepImg(keep);
		
		if(res ==0 ) 
		{
			System.out.println("실패");
		}
		if(res==1) {
			System.out.println("디비 넣기 성공!!");
		}
		return null;
	}
}
