package com.spring.community;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller public class ReviewLikeController 
{
	@Autowired private ReviewLikeService reviewLikeService;
	 
    @RequestMapping(value = "/heart.do", method = {RequestMethod.GET, RequestMethod.POST} , produces = "application/json")
    @ResponseBody public int heart(HttpServletRequest request, HttpSession session) throws Exception 
    {   
    	int review_num = Integer.parseInt(request.getParameter("review_num"));  
        System.out.println("review_num="+review_num);
        String review_like = request.getParameter("review_like"); 
        System.out.println("review_like="+review_like);
        String member_id = (String)session.getAttribute("member_id"); //좋아요 찍은놈 , 나중에 세션에서 받아와야 한다 .
        //ReviewVO reviewvo = news ReviewVO();
        //리뷰 DB에 임의로 설정한 좋아요 갯수의 값을 불러와서 +1 혹은 -1 을 해줘야 한다 .
        //좋아요 관리 테이블에 아이디를 조건문으로 검색하여 
        // 일치하는 아이디가 없으면 인설트 + (리뷰 카운트 +1) , 있으면 아이디 딜리트 +(리뷰카운트 -1)  
        
        ReviewVO reviewvo = new ReviewVO();
        reviewvo.setReview_like(review_like);// System.out.println("좋아요 잘 받음?="+reviewvo.getReview_like());
        int rlcnt = Integer.parseInt(reviewvo.getReview_like());
       
        ReviewLikeVO vo = new ReviewLikeVO();
		vo.setReview_num(review_num); 
		vo.setMember_id(member_id); 
		System.out.println("설정해준 ID 니가 로그인한 아이디가 나와야 한다.="+vo.getMember_id());
        int list =reviewLikeService.getReviewLike(vo);
        
        System.out.println("list가 0이면 +1 추가 아니면 -1 ="+list);
       
        if(list==0) {
        	reviewLikeService.insertReviewLike(vo);
        	reviewLikeService.updateReviewLike1(vo);
        	System.out.println("if 까지");
        	System.out.println("if return 직전 까지");
        	System.out.println("인설트 ,리턴값은?="+list);
        	return list;
        	
        	
        }else 
        	reviewLikeService.deleteReviewLike(vo);
        	reviewLikeService.updateReviewLike2(vo);
        	System.out.println("else 까지");
        	System.out.println("else return 직전까지");
        	System.out.println("딜리트 ,리턴값은?="+list);
        	return list;
           
    }
}


