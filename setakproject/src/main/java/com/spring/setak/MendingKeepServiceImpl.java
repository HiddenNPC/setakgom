package com.spring.setak;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MendingKeepMapper;

@Service
public class MendingKeepServiceImpl implements MendingKeepService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertMending(MendingVO mending) {
		MendingKeepMapper mendingmapper = sqlSession.getMapper(MendingKeepMapper.class);
		mendingmapper.insertMending(mending);
	}
}
