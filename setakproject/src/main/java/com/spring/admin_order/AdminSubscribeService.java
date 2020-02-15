package com.spring.admin_order;

import java.util.HashMap;
import java.util.List;

import com.spring.member.MemberSubVO;


public interface AdminSubscribeService {

	List<Object> getMemberSubList();
	List<Object> subMemberSearch(HashMap<String, Object> map);
	
	int updateMemberSubList(MemberSubVO msv);
	int deleteMemberSubList(String member_id);
	int updateSubNum(HashMap<String, Object> map);
	
	int getMemberSubCnt(String subsname);
	int getMemberDailySubCnt(HashMap<String, Object> map);
	
}
