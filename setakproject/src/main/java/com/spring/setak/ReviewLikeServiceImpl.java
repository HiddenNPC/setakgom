package com.spring.setak;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ReviewLikeMapper;


@Service("reviewLikeService")
public class ReviewLikeServiceImpl implements ReviewLikeService
{
	@Autowired (required = false) private SqlSession sqlSession;

	public int getReviewLike (ReviewLikeVO vo) 
	{
		ReviewLikeMapper reviewLikeMapper = sqlSession.getMapper(ReviewLikeMapper.class);
		return reviewLikeMapper.getReviewLike(vo);
				
	}
	public void insertReviewLike(ReviewLikeVO vo) 
	{
		ReviewLikeMapper reviewLikeMapper = sqlSession.getMapper(ReviewLikeMapper.class);
		reviewLikeMapper.insertReviewLike(vo);
		reviewLikeMapper.updateReviewLike(vo.getReview_num());
	}
    public void deleteReviewLike(ReviewLikeVO vo)
    {
    	ReviewLikeMapper reviewLikeMapper = sqlSession.getMapper(ReviewLikeMapper.class);
    	reviewLikeMapper.deleteReviewLike(vo);
		reviewLikeMapper.updateReviewLike(vo.getReview_num());
    	
    	
	}

	
}
