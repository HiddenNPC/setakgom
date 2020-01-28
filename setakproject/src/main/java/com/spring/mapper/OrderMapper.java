package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.OrderListVO;
import com.spring.setak.OrderVO;
import com.spring.setak.WashingCartVO;

public interface OrderMapper {

	// 결제 정보 추가
	int insertOrder(OrderVO ovo);
	
	// 결제 이후 장바구니 비우기
	int deleteWashCartbyID(String member_id);
	int deleteMendingCartbyID(String member_id);
	int deleteKeepCartbyID(String member_id);
	
	// 주문 목록 추가
	int insertOrderList(OrderListVO olv);
	// 주문 목록 시퀀스 읽기
	ArrayList<OrderListVO> getOrderList(OrderListVO olv);
	// 결제 금액 
	int getOrderPrice(OrderListVO olv); 

}
