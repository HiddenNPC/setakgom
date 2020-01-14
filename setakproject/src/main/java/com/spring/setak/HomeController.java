package com.spring.setak;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/setak.st")
	public String washing() {
		
		return "washing";
	}
	
	@RequestMapping(value = "/washmending.st")
	public ModelAndView washmending(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String a[] = request.getParameterValues("category");
		String b[] = request.getParameterValues("test");
		
		for(int i = 0; i <a.length; i++) {
			System.out.println(a[i]);
			System.out.println(b[i]);
		}
		
		
		return mav;
	}
	
}
