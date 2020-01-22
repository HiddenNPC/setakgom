package com.spring.mapper;

import java.util.ArrayList;

import com.spring.community.QnaVO;

public interface QnaMapper 
{

	public int getListCount();
	
	public ArrayList<QnaVO> getQnaList(int startRow, int endRow);
	
	public QnaVO getDetail(int num) throws Exception;
		
	public int qnaInsert(QnaVO vo) throws Exception;
	
	public int getMaxNum() throws Exception;

	public int qnaModify(QnaVO vo);

	public int qnaDelete(int num);
	
	
	
	
	/*
	 * public int qnaModify(QnaVO vo) throws Exception;
	 * 
	 * public int qnaDelete(int num) throws Exception;
	 */
	

	
}
