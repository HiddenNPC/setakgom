package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;
import com.spring.setak.OrderListVO;
import com.spring.setak.OrderVO;
import com.spring.setak.WashingVO;

public interface MypageMapper {
	ArrayList<OrderVO> getOrderlist(HashMap<String, Object> map);
	ArrayList<OrderListVO> getOrdernumlist(String member_id);
	ArrayList<KeepVO> selectMykeeplist(long order_num);
	KeepVO getKeepSeq(int keep_seq);
	OrderVO selectOrder(long order_num);
	int getOrdercount();
	String selectOrderId(String member_id);
	MendingVO selectMending(int repair_seq);
	KeepVO selectKeep(int keep_seq);
	WashingVO selectWashing(int wash_seq);
	int getKeepcount();
	
	
	
}
