package com.spring.setak;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MendingKeepController {
	
	@Autowired()//required = false
	private MendingKeepService mendingKeepService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "main";
	}
	
	@RequestMapping("/history.do")
	public String history() {
		
		return "history";
	}

	@RequestMapping("/mendingform.do")
	public String mendingform() {
		
		return "mending";
	}
	
	@RequestMapping("/mending.do")
	public String insertMending(MultipartHttpServletRequest request) throws Exception{
		String repair_cate[] = request.getParameterValues("repair_cate");
		String repair_kind[] = request.getParameterValues("repair_kind");
		String repair_var1[] = request.getParameterValues("repair_var1");
		String repair_var2[] = request.getParameterValues("repair_var2");
		String repair_var3[] = request.getParameterValues("repair_var3");
		String repair_content[] = request.getParameterValues("repair_content");
		String repair_code[] = request.getParameterValues("repair_code");
		String repair_count[] = request.getParameterValues("repair_count");
		String repair_price[] = request.getParameterValues("repair_price");
		List<MultipartFile> repair_file = request.getFiles("repair_file");
		
		String uploadPath = "C:\\Project138\\upload\\"; // 직접 업로드 될 위치 지정
		
		MendingVO mending = new MendingVO();
		for(int i =0; i<repair_cate.length; i++) {
			String kind[] = repair_kind[i].split(",");
			for(String ki : kind) {
				mending.setRepair_kind(ki);
				mending.setRepair_cate(repair_cate[i]);
				mending.setRepair_var1(Integer.parseInt(repair_var1[i]));
				mending.setRepair_var2(Integer.parseInt(repair_var2[i]));
				mending.setRepair_var3(Integer.parseInt(repair_var3[i]));
				mending.setRepair_content(repair_content[i]);
				mending.setRepair_code(repair_code[i]);
				mending.setRepair_count(Integer.parseInt(repair_count[i]));
				mending.setRepair_price(Integer.parseInt(repair_price[i]));		
					
				mendingKeepService.insertMending(mending);
			}
		
			/*String originalFileExtension = repair_file.get(i).getOriginalFilename().substring(repair_file.get(i).getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			mending.setRepair_file(repair_file.get(i).getOriginalFilename());
			
			if (repair_file.get(i).getSize() != 0)
				repair_file.get(i).transferTo(new File(uploadPath + storedFileName));
			*/
		
		}
		return "order";
	}
	
	@RequestMapping("/keepform.do")
	public String keepform() {
		
		return "keep";
	}
	
	@RequestMapping("/keep.do")
	public String insertkeep(HttpServletRequest request) throws Exception{
		String keep_cate[] = request.getParameterValues("keep_cate");
		String keep_kind[] = request.getParameterValues("keep_kind");
		String keep_count[] = request.getParameterValues("keep_count");
		String keep_month = request.getParameter("keep_month");
		String keep_box = request.getParameter("keep_box");
		String keep_price = request.getParameter("keep_price");
		
		KeepVO keep = new KeepVO();
		for(int i = 0; i<keep_cate.length; i++) {
			keep.setKeep_cate(keep_cate[i]);
			keep.setKeep_kind(keep_kind[i]);
			keep.setKeep_count(Integer.parseInt(keep_count[i]));
			keep.setKeep_month(Integer.parseInt(keep_month));
			keep.setKeep_box(Integer.parseInt(keep_box));
			keep.setKeep_price(Integer.parseInt(keep_price));
			
			mendingKeepService.insertKeep(keep);
		}
		return "order";
	}
}