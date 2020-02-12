package com.spring.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.Admin_C_M_Mapper;

@Service("admin_C_M_Service")
public class Admin_C_M_ServiceImpl implements Admin_C_M_Service {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Object> Admin_CouponList(){
		List<Object> list = null;
		Admin_C_M_Mapper mapper = sqlSession.getMapper(Admin_C_M_Mapper.class);
		
		list = mapper.Admin_CouponList();
		
		return list;
	}
	
}
