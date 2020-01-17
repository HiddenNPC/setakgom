package com.spring.setak;

public interface MemberService {
	<List>MemberVO member_list();
	int member_insert(MemberVO mo);
	int member_update(MemberVO mo);
	int member_delete(String member_id);
}
