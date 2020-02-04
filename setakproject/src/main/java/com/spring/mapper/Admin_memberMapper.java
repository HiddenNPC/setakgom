package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;

public interface Admin_memberMapper {

	//전체 회원리스트 출력
	 ArrayList<MemberVO> adminlist(HashMap<String, Object> map); 
	 
	 //전체 회원리스트 갯수
	 int adminlistcount();
	 
	 //오늘 가입한 회원 수
	 int todaycount();
	 
	 //메모수정
	 int update_memo(MemberVO mo);
}
