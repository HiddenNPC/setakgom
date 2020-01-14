package com.spring.setak;

import java.util.ArrayList;


public interface QnaService 
{
	public int getListCount() throws Exception;
	public ArrayList<QnaVO> getQnaList(int startRow, int endRow) throws Exception;	
	public QnaVO getDetail(QnaVO vo) throws Exception;
	
	//관리자의 권한 (추가 , 수정 , 삭제 )
	public int qnaInsert(QnaVO vo) throws Exception;	
	public int qnaModify(QnaVO vo) throws Exception;
	public int qnaDelete(QnaVO vo) throws Exception;
	public int getMaxNum()throws Exception ;
	
	
	
	
	
	

}
