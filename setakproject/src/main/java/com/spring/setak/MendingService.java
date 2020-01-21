package com.spring.setak;

import java.util.ArrayList;

public interface MendingService {
	public ArrayList<MendingVO> getMendinglist(MendingVO mendingVO);
	public MendingVO selectMending(int repair_seq);
	public OrderVO selectOrder(int order_num);
}
