package com.spring.mypage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.community.QnaServiceImpl;
import com.spring.community.QnaVO;
import com.spring.member.CouponServiceImpl;
import com.spring.member.CouponVO;
import com.spring.member.MemberVO;
import com.spring.member.MileageServiceImpl;
import com.spring.member.MileageVO;
import com.spring.order.OrderListVO;
import com.spring.order.OrderVO;
import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;
import com.spring.setak.WashingVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageServiceImpl mypageService;
	
	@Autowired
	private CouponServiceImpl couponService;
	
	@Autowired
	private MileageServiceImpl mileageService;
	
	@Autowired
	private QnaServiceImpl qnaService;
	
	
//	@Autowired
//	SqlSession session; 
	
	@RequestMapping("/orderview.do")
	public String selectMending(HttpServletRequest request, Model model, HttpSession session) throws Exception{
		if(session.getAttribute("member_id")==null) {
	           return "redirect:/";
	      }
		ArrayList<OrderVO> orderlist = new ArrayList<OrderVO>();
		   
		String member_id = (String) session.getAttribute("member_id");
		OrderVO orderVO = new OrderVO();
		ArrayList<MendingVO> mendingVO = new ArrayList<MendingVO>();
		ArrayList<ArrayList<MendingVO>> mendingVO2 = new ArrayList<ArrayList<MendingVO>>();
		ArrayList<WashingVO> washVO = new ArrayList<WashingVO>();
		ArrayList<ArrayList<WashingVO>> washVO2 = new ArrayList<ArrayList<WashingVO>>();
		ArrayList<KeepVO> keepVO = new ArrayList<KeepVO>();
		ArrayList<ArrayList<KeepVO>> keepVO2 = new ArrayList<ArrayList<KeepVO>>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page-1)*10 +1;
		int endrow = startrow + limit-1;
		int listcount = mypageService.getOrdercount();
		
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("member_id", member_id);
		
		orderlist = mypageService.getOrderlist(map);
		
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
		int endpage = startpage + 10-1;
		
		if(endpage > maxpage)
		{
			endpage = maxpage;
			
		}
		
		long order_num = 0;
		
		
		for (int i = 0; i < orderlist.size(); i++) {
			OrderVO ovo = (OrderVO)orderlist.get(i);
			
			order_num = ovo.getOrder_num();
			mendingVO = mypageService.selectMending(order_num);
			washVO = mypageService.selectWashing(order_num);
			keepVO = mypageService.selectKeep(order_num);
			
			mendingVO2.add(mendingVO);
			washVO2.add(washVO);
			keepVO2.add(keepVO);
			
		}

		model.addAttribute("orderlist", orderlist);
		model.addAttribute("mendingVO2", mendingVO2);
		model.addAttribute("washVO2", washVO2);
		model.addAttribute("keepVO2", keepVO2);
		model.addAttribute("limit", limit);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		
		return "orderview";
	}	
	
	@RequestMapping("/mykeep.do")
	public String selectKeep (Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		if(session.getAttribute("member_id")==null) {
	           return "redirect:/";
	      }	
		
		ArrayList<OrderListVO> ordernumlist = new ArrayList<OrderListVO>();
		ArrayList<KeepVO> keeplist = new ArrayList<KeepVO>();
		ArrayList<ArrayList<KeepVO>> keeplist2 = new ArrayList<ArrayList<KeepVO>>();
		ArrayList<KeepPhotoVO> kpvolist = new ArrayList<KeepPhotoVO>();
		
		ArrayList<ArrayList<KeepPhotoVO>> kpvolist2 = new ArrayList<ArrayList<KeepPhotoVO>>();
		
		String member_id = (String) session.getAttribute("member_id");
		MemberVO memberVO = new MemberVO();
			
			
		ordernumlist = mypageService.getOrdernumlist(member_id);
		
		long order_num = 0;
		int keep_seq = 0;
		List<Integer> seq_count = new ArrayList<Integer>(); 
		memberVO = mypageService.getMember(member_id);
		
			for(int i = 0; i < ordernumlist.size(); i++) {
				OrderListVO olvo = (OrderListVO)ordernumlist.get(i);
				
				order_num = olvo.getOrder_num();
				keeplist = mypageService.selectMykeeplist(order_num);
				
				keep_seq = mypageService.selectMykeep(order_num);
				
				kpvolist = mypageService.selectPhoto(order_num);
				
				seq_count.add(keep_seq);
				keeplist2.add(keeplist);
				
				kpvolist2.add(kpvolist);
			}
			
		model.addAttribute("seq_count", seq_count);
		model.addAttribute("keeplist2", keeplist2);
		model.addAttribute("kpvolist2", kpvolist2);
		model.addAttribute("ordernumlist", ordernumlist);
		model.addAttribute("memberVO", memberVO);
		
			
		return "mykeep";
	}
	
	
	@RequestMapping("/myqna.do")
	public String selectQnalist (Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		if(session.getAttribute("member_id")==null) {
	           return "redirect:/";
	      }
		
		// 멤버 아이디 구분해서 member_name, phone, loc 값 공백 
		
		String member_id = (String) session.getAttribute("member_id");

		ArrayList<QnaVO> qnalist = new ArrayList<QnaVO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page-1)*10 +1;
		int endrow = startrow + limit-1;
		int listcount = qnaService.getListCount();
		
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("member_id", member_id);
		
		qnalist = qnaService.selectQnalist(map);
		
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
		int endpage = startpage + 10-1;
		
		if(endpage > maxpage)
		{
			endpage = maxpage;
			
		}
		
		model.addAttribute("limit", limit);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("qnalist", qnalist);
		
		return "myqna";
	}
	
	@RequestMapping("/mysavings.do")
	public String selectSaving (Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		if(session.getAttribute("member_id")==null) {
	           return "redirect:/";
	      }
		
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<MileageVO> mile_list = new ArrayList<MileageVO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page-1)*10 +1;
		int endrow = startrow + limit-1;
		int listcount = mileageService.getListCount();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("member_id", member_id);
		
		
		mile_list = mileageService.getMileagelist(map);
		
		int maxpage = (int)((double)listcount/limit+0.95);
		int startpage=(((int) ((double)page/10+0.9))-1)*10+1;
		int endpage = startpage + 10-1;
		
		if(endpage > maxpage)
		{
			endpage = maxpage;
			
		}
		
		int havePoint = mileageService.getSum(member_id);
		int totPoint = mileageService.totSum(member_id);
		int usePoint = mileageService.useSum(member_id);
		
		model.addAttribute("havePoint", havePoint);
		model.addAttribute("totPoint", totPoint);
		model.addAttribute("usePoint", usePoint);
		model.addAttribute("limit", limit);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("mile_list", mile_list);
		
		return "mysavings";
	}

	@RequestMapping("/mycoupon.do")
	public String getCouponList(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		if(session.getAttribute("member_id")==null) {
	           return "redirect:/";
	      }
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			ArrayList<CouponVO> couponlist = null;
			String member_id = (String) session.getAttribute("member_id");
			couponlist = couponService.getCouponList(member_id);
			for (int i = 0; i < couponlist.size(); i++) {
				System.out.println(couponlist.get(i).getCoupon_start());
				System.out.println(couponlist.get(i).getCoupon_end());
				System.out.println(couponlist.get(i).getCoupon_useday());
			}

			
			model.addAttribute("couponlist", couponlist);
		return "mycoupon";
	}
	
}

