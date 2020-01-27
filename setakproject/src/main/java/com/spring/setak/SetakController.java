package com.spring.setak;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SetakController {
	
	@RequestMapping(value = "/setak.do")
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
		String price[] = request.getParameterValues("wash_price");
		
		
		for(int i = 0; i <cate.length; i++) {
			WashingVO wvo = new WashingVO();
			wvo.setWash_cate(cate[i]);
			wvo.setWash_kind(kind[i]);
			wvo.setWash_method(method[i]);
			wvo.setWash_count(Integer.parseInt(count[i]));
			wvo.setWash_price(Integer.parseInt(price[i]));
			list.add(wvo);
		}
		
		mav.addObject("list", list);
		mav.setViewName("washingMending");
		
		return mav;
	}
}
