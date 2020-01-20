package com.spring.setak;

import java.util.ArrayList;

public interface ReviewService 
{
	ArrayList<ReviewVO> reviewList() throws Exception;
	int reviewInsert(ReviewVO vo) throws Exception;
	int getMaxNum() throws Exception;
	public String reviewDetail();
}
