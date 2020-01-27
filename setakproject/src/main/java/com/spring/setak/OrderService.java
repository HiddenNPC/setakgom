package com.spring.setak;

public interface OrderService {

	// 결제 정보 추가
	public int insertOrder(OrderVO ovo); 
	
	public int deleteWashCartbyID(String member_id);
	public int deleteMendingCartbyID(String member_id);
	public int deleteKeepCartbyID(String member_id);
	
	public int insertOrderList(OrderListVO olv);
}
