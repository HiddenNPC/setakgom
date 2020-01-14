package com.spring.setak;

import java.util.List;

import com.spring.setak.CommentVO;

public interface CommentService 
{
	List<CommentVO> commentList(CommentVO vo);
	int commentInsert(CommentVO vo);	
	int commentDelete(CommentVO vo);
	int commentUpdate(CommentVO vo);
	
	
	
}
