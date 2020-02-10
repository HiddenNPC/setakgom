package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;
import com.spring.mypage.KeepReturnVO;
import com.spring.order.OrderListVO;
import com.spring.order.OrderVO;
import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;
import com.spring.setak.WashingVO;

public interface MypageMapper {
	ArrayList<OrderVO> getOrderlist(HashMap<String, Object> map);
	ArrayList<OrderListVO> getOrdernumlist(String member_id);
	ArrayList<KeepVO> selectMykeeplist(long order_num);
	int selectMykeep(long order_num);
	KeepVO getKeepSeq(int keep_seq);
	OrderVO selectOrder(long order_num);
	int getOrdercount();
	String selectOrderId(String member_id);
	MendingVO selectMending(int repair_seq);
	KeepVO selectKeep(int keep_seq);
	WashingVO selectWashing(int wash_seq);
	int getKeepcount();
	
	//보관연장
	int updateKeepMonth(HashMap<String, Object> map);
	int all_Return(HashMap<String, Object> map);
	int part_Return_now(HashMap<String, Object> map);
	//반환
	int part_Return(KeepReturnVO krvo);
	MemberVO getMember(String member_id);
	
}
