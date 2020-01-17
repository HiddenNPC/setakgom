package com.spring.mapper;

import java.util.List;

import com.spring.setak.MemberVO;

public interface MemberMapper {
	List<MemberVO> member_list();
	void member_insert(MemberVO mo);
	String member_password(MemberVO mo);
	void member_update(MemberVO mo);
	void member_delete(String member_id);
}
