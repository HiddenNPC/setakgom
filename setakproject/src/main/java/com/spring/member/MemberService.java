package com.spring.member;

public interface MemberService {
	MemberVO member_list(MemberVO mo);
	
	//아이디 확인(중복여부)
	int member_id(MemberVO mo);
	
	//회원가입
	int member_insert(MemberVO mo);
	
	// 회원정보 수정
	int member_update(MemberVO mo);
	
	//비밀번호 확인
	int member_password(MemberVO mo);
	
	// 멤버 이름
	public MemberVO name(String member_id);

	//로그인 연동시 회원가입
	public int linkage(MemberVO mo);
	
	//회원 삭제
	int member_delete(String member_id);
	
}
