package com.spring.setak;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
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
			writer.write("<script>alert('사진 업로드 실패!'); location.href='javascript:history.back()';</script>");
		}
		if(res==1) {
			writer.write("<script>alert('사진 업로드가 정상적으로 이루어 졌습니다.'); location.href='javascript:history.back()'; </script>");
		}
		return null;
	}
	
	@RequestMapping(value = "/admin/deleteKeep.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> deletekeep(@RequestParam(value = "keep_seq") List<Integer> keep) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			ArrayList<Integer> keeplist = new ArrayList<Integer>();
			for (int i = 0; i < keep.size(); i++) {
				keeplist.add(keep.get(i));
			}
			
			for (int j = 0; j < keeplist.size(); j++) {
				mendingKeepService.deleteKeep(keeplist.get(j));
			}
			retVal.put("res", "OK");
		} catch (Exception e) {
			retVal.put("res", "fail");
			retVal.put("message", "fail");
		}
		return retVal;
	}
	
	@RequestMapping(value="/admin/keepSearch.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> keepSearch(@RequestParam(value="keyword") String keyword){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		List<Object> keeplist = mendingKeepService.keepSerach(map); 
		
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("keeplist", keeplist);
	
		return res;
	}
	
}
