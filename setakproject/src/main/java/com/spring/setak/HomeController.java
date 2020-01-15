package com.spring.setak;

import java.util.ArrayList;
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
		ArrayList<WashingVO> list = new ArrayList<WashingVO>();
		
		String cate[] = request.getParameterValues("wash_cate");
		String kind[] = request.getParameterValues("wash_kind");
		String method[] = request.getParameterValues("wash_method");
		String count[] = request.getParameterValues("wash_count");
		
		for(int i = 0; i <cate.length; i++) {
			WashingVO wvo = new WashingVO();
			wvo.setWash_cate(cate[i]);
			wvo.setWash_kind(kind[i]);
			wvo.setWash_method(method[i]);
			int count2[] = new int[cate.length];
			count2[i] = Integer.parseInt(count[i]);
			wvo.setWash_count(count2[i]);
			list.add(wvo);
		}
		
		mav.addObject("list", list);
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
	
	@RequestMapping(value = "/order.st")
	public String order() {
		
		return "order";
	}
	
}
