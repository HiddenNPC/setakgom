package com.spring.setak;

import java.util.ArrayList;

public interface ReviewService 
{
	ArrayList<ReviewVO> reviewList() throws Exception;
	int reviewInsert(ReviewVO vo) throws Exception;
	int getMaxNum() throws Exception;

	ArrayList<ReviewVO> reviewSearch(String keyfield, String keyword);

	
	ArrayList<ReviewVO> reviewCondition(String re_condition);
	
}
