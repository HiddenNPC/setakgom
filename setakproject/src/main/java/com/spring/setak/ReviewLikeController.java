package com.spring.setak;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller public class ReviewLikeController 
{
	@Autowired private ReviewLikeService reviewLikeService;
	
	@RequestMapping(value = "read", method = RequestMethod.POST)
    public int read(int review_num, Model model, HttpServletRequest request ) throws Exception 
	{
        String member_id =  request.getParameter("member_id");
        System.out.println("member_id="+member_id);
        //int member_id = ((UserVO) httpRequest.getSession().getAttribute("login")).getUserId();
        review_num = Integer.parseInt(request.getParameter("review_num"));
        System.out.println("review_num="+review_num);
        ReviewLikeVO vo = new ReviewLikeVO();
        vo.setReview_num(review_num);
        vo.setMember_id(member_id);
        int reviewlike = reviewLikeService.getReviewLike(vo);
        System.out.println("좋아요 갯수는? ="+reviewlike);
        model.addAttribute("heart",reviewlike);
        return reviewlike;
    }

  
    @RequestMapping(value = "heart.do", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody public int heart(HttpServletRequest request) throws Exception {

        int heart = Integer.parseInt(request.getParameter("heart"));
        System.out.println("heart="+ heart);
        int review_num = Integer.parseInt(request.getParameter("review_num"));
        String member_id = request.getParameter("member_id");

        ReviewLikeVO vo = new ReviewLikeVO();
        vo.setReview_num(review_num);
        vo.setMember_id(member_id);

        
        if(heart >= 1) {
        	reviewLikeService.deleteReviewLike(vo);
            heart=0;
        } else {
        	reviewLikeService.insertReviewLike(vo);
            heart=1;
        }

        return heart;

    }
	
	
	
	
}
