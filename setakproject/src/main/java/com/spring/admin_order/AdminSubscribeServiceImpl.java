package com.spring.admin_order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.Admin_subscribe;

@Service
public class AdminSubscribeServiceImpl implements AdminSubscribeService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Object> getMemberSubList() {
		List<Object> memberSubList = null;
		try {
			Admin_subscribe adminSubscribeMapper = sqlSession.getMapper(Admin_subscribe.class);
			memberSubList = adminSubscribeMapper.getMemberSubList();
		} catch(Exception e) {
			System.out.println("관리자 페이지 회원 목록 검색 실패" + e.getMessage());
		}
		
		return memberSubList;
	}

	@Override
	public List<Object> subMemberSearch(HashMap<String, Object> map) {
		List<Object> memberSubList = null;
		try {
			Admin_subscribe adminSubscribeMapper = sqlSession.getMapper(Admin_subscribe.class);
			memberSubList = adminSubscribeMapper.subMemberSearch(map);
		} catch(Exception e) {
			System.out.println("관리자 페이지 회원 검색 실패" + e.getMessage());
		}
		
		return memberSubList;
	}

}
