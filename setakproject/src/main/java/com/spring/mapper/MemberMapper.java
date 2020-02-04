package com.spring.mapper;

import com.spring.member.MemberVO;

public interface MemberMapper {
	
	//아이디 확인(중복여부)
	String member_id(MemberVO mo);
	
	//회원가입
	void member_insert(MemberVO mo);
	
	//비밀번호 확인
	String member_password(MemberVO mo);
	
	// 회원정보 출력
	MemberVO member_list(MemberVO mo);
	
	// 회원정보 수정
	void member_update(MemberVO mo);
	
	 // 멤버 이름
	 MemberVO name(String member_id);
	 
	//로그인 연동시 회원가입
	 void linkage(MemberVO mo);
	 
	//회원 삭제
	void member_delete(String member_id);
}
