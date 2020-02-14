package com.spring.setak;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public int updateKeep(KeepVO params){
		Admin_KeepMapper keepMapper = sqlSession.getMapper(Admin_KeepMapper.class);
		int res = keepMapper.updateKeep(params);
		return res;
	}
	
	@Override
	public int keepImg(KeepVO keep) {
		Admin_KeepMapper keepMapper = sqlSession.getMapper(Admin_KeepMapper.class);
		int res = keepMapper.keepImg(keep);
		return res;
	}

	@Override
	public int deleteKeep(int keep) {
		Admin_KeepMapper keepMapper = sqlSession.getMapper(Admin_KeepMapper.class);
		int res = keepMapper.deleteKeep(keep);
		return res;
	}
	
	@Override
	public List<Object> keepSerach(HashMap<String, Object> map){
		List<Object> keeplist = null;
		Admin_KeepMapper keepMapper = sqlSession.getMapper(Admin_KeepMapper.class);
		keeplist = keepMapper.keepSerach(map);
		
		return keeplist;
	}
}
