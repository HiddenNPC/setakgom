package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.ReviewVO;

public interface ReviewMapper 
{
	
	
	public int reviewInsert(ReviewVO vo);
	public int getMaxNum();
	public ArrayList<ReviewVO> reviewList();
	
	
	public ArrayList<ReviewVO> reviewSearch(String keyfield, String keyword);

	
	public ArrayList<ReviewVO> reviewCondition(String re_condition);
	

	
	
	
	
}
