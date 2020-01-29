package com.spring.member;

public interface MemberService {
	MemberVO member_list(MemberVO mo);
	int member_insert(MemberVO mo);
	int member_update(MemberVO mo);
	int member_delete(String member_id);
	int member_password(MemberVO mo);
	int member_id(MemberVO mo);
	
	// 멤버 이름
	public MemberVO name(String member_id);

	//로그인 연동시 회원가입
	public int linkage(MemberVO mo);
}
