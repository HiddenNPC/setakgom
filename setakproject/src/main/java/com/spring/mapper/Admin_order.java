package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.order.OrderVO;


public interface Admin_order {

	// 전체 주문 리스트 뿌리기
	ArrayList<OrderVO> getOrderList();
	// 전체 주문 개수
	int getOrderCount();
	
	// 주문 검색
	ArrayList<OrderVO> orderSearch(HashMap<String, Object> map);
	
}
