package com.spring.mapper;

import com.spring.setak.ReviewLikeVO;



public interface ReviewLikeMapper 
{
	public int getReviewLike (ReviewLikeVO vo);
	public void insertReviewLike(ReviewLikeVO vo);
    public void deleteReviewLike(ReviewLikeVO vo);
    public void updateReviewLike(int num);
	

}
