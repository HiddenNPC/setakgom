package com.spring.member;

public interface MemberService {
	
	//아이디 확인(중복여부)
	public int member_id(MemberVO mo);
	
	//회원가입
	public int member_insert(MemberVO mo);
	
	//비밀번호 확인
	public int member_password(MemberVO mo);
	
	// 회원정보 출력
	public MemberVO member_list(MemberVO mo);
	
	// 회원정보 수정
	public int member_update(MemberVO mo);
	
	// 멤버 이름
	public MemberVO name(String member_id);

	//로그인 연동시 회원가입
	public int linkage(MemberVO mo);
	
	//회원 삭제
	public int member_delete(String member_id);
	
}
