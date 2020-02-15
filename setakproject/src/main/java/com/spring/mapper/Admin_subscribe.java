package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

public interface Admin_subscribe {

	// 정기구독 회원 리스트
	List<Object> getMemberSubList();
	
	// 정기구독 회원 검색
	List<Object> subMemberSearch(HashMap<String, Object> map);
	
}
