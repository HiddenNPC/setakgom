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
		
		mav.setViewName("washingMending");
		
		return mav;
	}
	
	@RequestMapping(value = "/washkeep.st")
	public String washkeep() {
		
		return "washingKeep";
	}
	
	@RequestMapping(value = "/mending.st")
	public String mending() {
		
		return "mending";
	}
	
	@RequestMapping(value = "/keep.st")
	public String keep() {
		
		return "keep";
	}
	
	@RequestMapping(value = "/subscribe.st")
	public String subs() {
		
		return "subscribe";
	}
	
	@RequestMapping(value = "/hist.st")
	public String hist() {
		
		return "history";
	}
	
	@RequestMapping(value = "/review.st")
	public String review() {
		
		return "review_list";
	}
	
	@RequestMapping(value = "/faq.st")
	public String faq() {
		
		return "faq_list";
	}
	
	@RequestMapping(value = "/login.st")
	public String login() {
		
		return "loginform";
	}
	
	@RequestMapping(value = "/join.st")
	public String join() {
		
		return "joinform";
	}
	
	@RequestMapping(value = "/cart.st")
	public String cart() {
		
		return "cart";
	}
}
