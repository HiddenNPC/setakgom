package com.spring.mapper;

import java.util.ArrayList;
import com.spring.community.FaqVO;

public interface FaqMapper 
{
	public ArrayList<FaqVO> getFaqList();
	public void qnaInsert(FaqVO vo);	
	public int getMaxNum();	
	public void qnaModify(FaqVO vo);
	public void qnaDelete(int num);
}
