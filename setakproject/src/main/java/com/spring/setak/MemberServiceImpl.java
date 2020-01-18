package com.spring.setak;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<MemberVO> member_list() {
		 List<MemberVO> memberList = null;
		 try {
			 MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			 memberList = mapper.member_list();
		 } catch(Exception e) {
				System.out.println("멤버 리스트 검색 실패" + e.getMessage());
		 }
		 
		 return memberList;
	}
	
	@Override
	public int member_insert(MemberVO mo) {
		 int res = 0;
		 try {
			 MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			 mapper.member_insert(mo);
			
		 } catch(Exception e) {
				System.out.println("멤버 추가 실패" + e.getMessage());
				res = 0;
		 }
		 
		 return res;
	}
	
	@Override
	public int member_update(MemberVO mo) {
		int res = 0;
		try {
			MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			mapper.member_update(mo);
			res = 1;
		} catch(Exception e) {
			System.out.println("멤버 수정 실패" + e.getMessage());
			 res = 0;
		}
		 return res;
	}
	
	@Override
	public int member_delete(String member_id) {
		int res = 0;
		try {
			MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
			mapper.member_delete(member_id);
			res = 1;
		} catch(Exception e) {
			System.out.println("멤버 삭제 실패" + e.getMessage());
			res = 0;
		}
		 return res;
	}
}