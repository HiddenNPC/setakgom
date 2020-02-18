package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public String qnaPassChk(int num) throws Exception;
	public ArrayList<QnaVO> onList (String loginId); 
	
	public List<Object> ad_qnalist();	
	public int ad_qnaModify(QnaVO vo); 
	
	
	
	
	
	//기응
	public ArrayList<QnaVO> selectQnalist(HashMap<String, Object> map);



	
}