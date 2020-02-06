package com.spring.admin_order;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.order.OrderVO;

public interface AdminOrderService {

	public ArrayList<OrderVO> getOrderList();
	public ArrayList<OrderVO> getOrderList2(HashMap<String, Object> map);
	public int getOrderCount();
	
	public ArrayList<OrderVO> orderSearch(HashMap<String, Object> map);
	public int orderSearchCount(HashMap<String, Object> map);
	
	public OrderVO getOrderInfo(OrderVO ovo);
	public int updateOrderInfo(OrderVO ov);
	public int statusUpdate(HashMap<String, Object> map);
}
