package com.spring.setak;

import java.util.ArrayList;

import com.spring.order.OrderVO;

public interface MypageService {
	public ArrayList<OrderVO> getOrderlist(OrderVO orderVO);

	public OrderVO selectOrder(long order_num);
	public int getOrdercount();
	public MendingVO selectMending(int repair_seq);
	public KeepVO selectKeep(int keep_seq);
}
