package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;
import com.spring.setak.OrderVO;

public interface MypageMapper {
	ArrayList<OrderVO> getOrderlist(OrderVO orderVO);
	OrderVO selectOrder(long order_num);
	int getOrdercount();
	
	MendingVO selectMending(int repair_seq);
	KeepVO selectKeep(int keep_seq);
	
	
}
