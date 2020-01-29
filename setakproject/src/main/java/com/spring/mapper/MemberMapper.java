package com.spring.mapper;

import com.spring.member.MemberVO;

public interface MemberMapper {
	MemberVO member_list(MemberVO mo);
	String member_id(MemberVO mo);
	void member_insert(MemberVO mo);
	String member_password(MemberVO mo);
	void member_update(MemberVO mo);
	void member_delete(String member_id);
	
	 // 멤버 이름
	 MemberVO name(String member_id);
	 
	//로그인 연동시 회원가입
	 void linkage(MemberVO mo);
}
