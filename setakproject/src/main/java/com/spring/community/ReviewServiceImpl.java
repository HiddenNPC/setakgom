package com.spring.community;


import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ReviewMapper;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService 
{
	@Autowired (required = false) private SqlSession sqlSession;
	
	@Override
	public String reviewDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ReviewVO> reviewList() throws Exception 
	{
		
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);			
		ArrayList<ReviewVO> list = reviewMapper.reviewList(); 
		return list; 
	}

	@Override
	public int reviewInsert(ReviewVO vo) throws Exception 
	{
		int res=0;
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		try
		{
			res = reviewMapper.reviewInsert(vo);
			
		}
		catch (Exception e)
		{
			throw new Exception(" 원글 쓰기  실패", e);
		}
		
		return res;
	}

	@Override
	public int getMaxNum() throws Exception 
	{
		int res;
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		try
		{
			 res=reviewMapper.getMaxNum();
			
		}
		catch (Exception e)
		{
			throw new Exception("리뷰 maxnum 구하기  실패", e);
		}
		
		return res;
	}

	

	
	
	

}
