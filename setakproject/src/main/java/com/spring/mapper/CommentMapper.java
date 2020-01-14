package com.spring.mapper;

import java.util.List;

import com.spring.setak.CommentVO;

public interface CommentMapper 
{
	List<CommentVO> commentList(int i);
	int commentInsert(CommentVO vo);
	int commentDelete(CommentVO vo);
	int commentUpdate(CommentVO vo);	
	
	int cntListCount();
	int maxNum();

}