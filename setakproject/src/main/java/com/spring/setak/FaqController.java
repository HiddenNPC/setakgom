package com.spring.setak;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller public class FaqController 
{
	@Autowired private FaqService faqService;
	
	@RequestMapping("faqList.st") public String faqList(FaqVO vo, Model model) throws Exception 
	{
		vo = faqService.faqList();
		model.addAttribute("faqdata", vo);
		System.out.println("DB에 있는 faq값 =" + vo);
		return "faq_list";
		
	}
	
	
	
	
	
}
