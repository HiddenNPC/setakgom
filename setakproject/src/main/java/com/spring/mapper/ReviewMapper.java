package com.spring.mapper;

import java.util.ArrayList;



import com.spring.setak.ReviewVO;

public interface ReviewMapper 
{
	
	public String reviewDetail();
	public int reviewInsert(ReviewVO vo);
	public int getMaxNum();
	public ArrayList<ReviewVO> reviewList();

	
	
	
	
}
