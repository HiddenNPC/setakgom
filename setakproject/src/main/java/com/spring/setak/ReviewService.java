package com.spring.setak;

public interface ReviewService 
{
	public int reviewInsert(ReviewVO vo) throws Exception;
	public int getMaxNum() throws Exception;

}
