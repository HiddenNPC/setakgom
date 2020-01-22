package com.spring.community;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller public class FaqController 
{
	@Autowired private FaqService faqService;
	
	@RequestMapping("faqList.do") public String faqList(FaqVO vo, Model model) throws Exception 
	{	
		ArrayList<FaqVO> faqlist = new ArrayList<FaqVO>();
		faqlist = faqService.faqList();	
		System.out.println("DB에 있는 faq값 =" + faqlist);
		model.addAttribute("faqdata", faqlist);
		
		return "faq_list";
		
	}
	
	
	
	
	
}
