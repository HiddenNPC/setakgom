package com.spring.setak;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	

	   //다중파일 업로드 됨!!!
	   @RequestMapping(value="/review_insert.do",  produces="application/json;charset=UTF-8")
	   public String insert_review(MultipartHttpServletRequest request, HttpSession session) throws Exception {
	      System.out.println("컨트롤러 왔다");
	      KeepVO keep = new KeepVO();
	      
	      //////////////////////////////////////////////////////////////
	      String str = "";
	      if(!request.getFiles("keep_file").isEmpty()) {
	         List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
	         
	         // input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
	         if(request.getFiles("keep_file").get(0).getSize() != 0) { 
	            fileList = request.getFiles("keep_file"); 
	         } 
	   
	         System.out.println("파일 없을 때 2");
	         
	     
	         String path =  "https://kr.object.ncloudstorage.com";
	         File fileDir = new File(path); 
	         if (!fileDir.exists()) { 
	            fileDir.mkdirs(); 
	         } 
	         
	         long time = System.currentTimeMillis(); 
	         
	         for (MultipartFile mf : fileList) { 
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
	            String saveFileName = String.format("%d_%s", time, originFileName);
	   
	            try { // 파일생성
	               mf.transferTo(new File(path, saveFileName)); 
	               str += saveFileName + ",";
	            } catch (Exception e) { 
	               e.printStackTrace(); 
	               } 
	            }
	         System.out.println("파일 없을 때 6");
	   
	         System.out.println("str = " + str);
	         
	         if(str.length() != 0) {
	            str = str.substring(0, str.length()-1);
	         } else {
	            str = "#";
	         }
	         
	         /*
	          if (str.length() > 0 && str.charAt(str.length()-1)==',') {
	              str = str.substring(0, str.length()-1);
	            }
	         */
	         
	         
	          System.out.println("str 2 = " + str);
	      } else {
	         str = "#";
	      }

	      //reviewVO.setREVIEW_NUM(0); //시퀀스 이용
	      keep.setKeep_file(str);
	      

	      
	   
	      ObjectMapper mapper = new ObjectMapper();
	      try {
	         str = mapper.writeValueAsString(keep);
	         System.out.println(str);
	      }catch(Exception e) {
	         System.out.println("first() mapper : " + e.getMessage());
	      }
	      
	      return str;
	      
	   }      
	
}
