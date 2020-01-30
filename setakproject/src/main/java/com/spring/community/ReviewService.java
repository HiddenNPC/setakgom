package com.spring.community;

import java.util.ArrayList;

public interface ReviewService 
{
	ArrayList<ReviewVO> reviewList() throws Exception;
	int reviewInsert(ReviewVO vo) throws Exception;
	int getMaxNum() throws Exception;

	ArrayList<ReviewVO> reviewSearch(String keyfield, String keyword);

	
	ArrayList<ReviewVO> reviewCondition1(String re_condition);
	ArrayList<ReviewVO> reviewCondition2(String re_condition);
	ArrayList<ReviewVO> reviewCondition3(String re_condition);
	
}