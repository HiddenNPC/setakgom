package com.spring.mapper;

import java.util.ArrayList;

import com.spring.order.OrderVO;


public interface Admin_order {

	// 전체 주문 리스트 뿌리기
	ArrayList<OrderVO> getOrderList();
	
}
