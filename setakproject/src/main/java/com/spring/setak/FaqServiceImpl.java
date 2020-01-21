package com.spring.setak;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.FaqMapper;

@Service("faqSeevice")
public class FaqServiceImpl implements FaqService 
{
	@Autowired(required = false) private SqlSession sqlSession;
	
	@Override public  ArrayList<FaqVO> faqList () throws Exception
	{
		FaqMapper faqMapper = sqlSession.getMapper(FaqMapper.class);
		ArrayList<FaqVO> vo  = new  ArrayList<FaqVO>();
		try
		{
			vo = faqMapper.getFaqList();
			return vo;
		}
		catch (Exception e)
		{
			throw new Exception("faq db에 뿌리기  실패", e);
		}
		

	}
	
	
}
