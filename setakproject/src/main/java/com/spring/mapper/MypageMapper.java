package com.spring.mapper;

import java.util.ArrayList;

import com.spring.order.OrderVO;
import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;

public interface MypageMapper {
	ArrayList<OrderVO> getOrderlist(OrderVO orderVO);
	OrderVO selectOrder(long order_num);
	int getOrdercount();
	
	MendingVO selectMending(int repair_seq);
	KeepVO selectKeep(int keep_seq);
	
	
}
