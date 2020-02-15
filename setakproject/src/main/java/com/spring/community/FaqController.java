package com.spring.community;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller public class FaqController 
{
	@Autowired private FaqService faqService;
	
	@RequestMapping(value = "/faqList.do") public String faqList(FaqVO vo, Model model) throws Exception 
	{	
		ArrayList<FaqVO> faqlist = new ArrayList<FaqVO>();
		faqlist = faqService.getFaqList();	
		System.out.println("DB에 있는 faq값 =" + faqlist);
		model.addAttribute("faqdata", faqlist);
		
		return "faq_list";
		
	}
	
	@RequestMapping(value = "admin/admin_faq.do")public String adminFaqList(Model model) throws Exception 
	{	
		ArrayList<FaqVO> faqlist = new ArrayList<FaqVO>();
		faqlist = faqService.getFaqList();
		
		model.addAttribute("faqdata", faqlist);		
		
		return "admin/admin_faq";		
	}
	
	@RequestMapping(value = "admin/admin_faqInsert.do")public String adminFaqInsert(FaqVO vo,Model model) throws Exception 
	{	
		faqService.qnaInsert(vo);
		ArrayList<FaqVO> faqlist = new ArrayList<FaqVO>();
		faqlist = faqService.getFaqList();		
		model.addAttribute("faqdata", faqlist);				
		return "admin/admin_faq";		
	}
	@RequestMapping(value = "admin/admin_faqUpdate.do")public String adminFaqUpdate(Model model) throws Exception 
	{	
		//System.out.println(" =" + );
		ArrayList<FaqVO> faqlist = new ArrayList<FaqVO>();
		faqlist = faqService.getFaqList();
		
		model.addAttribute("faqdata", faqlist);		
		
		return "admin/admin_faq";		
	}
	@RequestMapping(value = "admin/admin_faqDelete.do")public String adminFaqDelete(Model model) throws Exception 
	{	
		//System.out.println(" =" + );
		ArrayList<FaqVO> faqlist = new ArrayList<FaqVO>();
		faqlist = faqService.getFaqList();
		
		model.addAttribute("faqdata", faqlist);		
		
		return "admin/admin_faq";		
	}


	
}
