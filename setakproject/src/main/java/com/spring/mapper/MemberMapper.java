package com.spring.mapper;

import com.spring.setak.MemberVO;

public interface MemberMapper {
	MemberVO member_list(MemberVO mo);
	String member_id(MemberVO mo);
	void member_insert(MemberVO mo);
	String member_password(MemberVO mo);
	void member_update(MemberVO mo);
	void member_delete(String member_id);
	
}
