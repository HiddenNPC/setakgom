package com.spring.setak;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.Admin_KeepMapper;

@Service("Admin_MendingKeepService")
public class Admin_MendingKeepServiceImpl implements Admin_MendingKeepService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Object> getKeepList(){
		List<Object> result = null;
		Admin_KeepMapper keepMapper = sqlSession.getMapper(Admin_KeepMapper.class);
		result = keepMapper.getKeepList();
		
		return result;
	}

}
