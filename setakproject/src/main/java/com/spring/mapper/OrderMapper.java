package com.spring.mapper;

import com.spring.setak.OrderListVO;
import com.spring.setak.OrderVO;

public interface OrderMapper {

	// 결제 정보 추가
	int insertOrder(OrderVO ovo);
	
	// 결제 이후 장바구니 비우기
	int deleteWashCartbyID(String member_id);
	int deleteMendingCartbyID(String member_id);
	int deleteKeepCartbyID(String member_id);
	
	// 주문 목록 추가
	int insertOrderList(OrderListVO olv);

}
