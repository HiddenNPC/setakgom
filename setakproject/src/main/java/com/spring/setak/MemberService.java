package com.spring.setak;

public interface MemberService {
	MemberVO member_list(MemberVO mo);
	int member_insert(MemberVO mo);
	int member_update(MemberVO mo);
	int member_delete(String member_id);
	int member_password(MemberVO mo);
}
