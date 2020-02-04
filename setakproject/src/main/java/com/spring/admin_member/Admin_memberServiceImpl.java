package com.spring.admin_member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.Admin_memberMapper;
import com.spring.mapper.MemberMapper;
import com.spring.member.MemberVO;

@Service
public class Admin_memberServiceImpl implements Admin_memberService{

	@Autowired
	private SqlSession sqlsession;

	
	//전체 회원리스트 출력 
	@Override
	public  ArrayList<MemberVO> adminlist(HashMap<String, Object> map) {
		  ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		 try {
			 Admin_memberMapper mapper = sqlsession.getMapper(Admin_memberMapper.class);
			 list = mapper.adminlist(map);
		 } catch(Exception e) {
				System.out.println("멤버 리스트 검색 실패" + e.getMessage());
		 }
		 
		 return list;
	}
	
	// 정기구독 리스트 갯수
		@Override
		public int adminlistcount() {
			int count = 0;

			Admin_memberMapper mapper = sqlsession.getMapper(Admin_memberMapper.class);
			count = mapper.adminlistcount();
			return count;
		}
		
	 //오늘 가입한 회원 수
	@Override
	public int todaycount() {
		int todaycount = 0;
		
		Admin_memberMapper mapper = sqlsession.getMapper(Admin_memberMapper.class);
		todaycount = mapper.todaycount();
		return todaycount;
	}
	
	//메모수정
	@Override
	public int update_memo(MemberVO mo) {
		System.out.println("Impl은?");
		int res = 0;
		try {
			Admin_memberMapper mapper = sqlsession.getMapper(Admin_memberMapper.class);
			mapper.update_memo(mo);
			res = 1;
		} catch(Exception e) {
			System.out.println("메모 수정 실패" + e.getMessage());
			 res = 0;
		}
		 return res;
	}
}
