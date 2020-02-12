package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.HistorySubVO;
import com.spring.member.MemberSubVO;
import com.spring.member.SubscribeVO;

public interface MemberSubMapper {
	
	 // 나의정기구독
	 MemberSubVO sub_list(String member_id);
	
	 // 해당 정기구독 리스트
	 SubscribeVO subscribe_list(String member_id);
	 
	 // 정기구독 내역 리스트
	 ArrayList<HistorySubVO>subhistory_list(HashMap<String, Object> map); 

	 // 정기구독 리스트 갯수
	 int listcount(String member_id);
	 
}
