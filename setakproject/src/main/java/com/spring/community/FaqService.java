package com.spring.community;

import java.util.ArrayList;



public interface FaqService 
{
	public ArrayList<FaqVO> getFaqList ()throws Exception;
	public void qnaInsert(FaqVO vo);
	public int getMaxNum();	
	public void qnaModify(FaqVO vo);
	public void qnaDelete(int num);
	
	
}
