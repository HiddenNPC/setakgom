package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.MendingVO;
import com.spring.setak.OrderVO;

public interface MypageMapper {
	ArrayList<MendingVO> getMendinglist(MendingVO mendingVO);
	MendingVO selectMending(int repair_seq);
	OrderVO selectOrder(int order_num);
}
