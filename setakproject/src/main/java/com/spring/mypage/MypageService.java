package com.spring.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.order.OrderListVO;
import com.spring.order.OrderVO;
import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;
import com.spring.setak.WashingVO;

public interface MypageService {
	public ArrayList<OrderVO> getOrderlist(HashMap<String, Object> map);
	public ArrayList<OrderListVO> getOrdernumlist(String member_id);
	public ArrayList<KeepVO> selectMykeeplist(long order_num);
	public KeepVO getKeepSeq(int keep_seq);
	public OrderVO selectOrder(long order_num);
	public String selectOrderId(String member_id);
	public int getOrdercount();
	public int getKeepcount();
	public MendingVO selectMending(int repair_seq);
	public KeepVO selectKeep(int keep_seq);
	public WashingVO selectWashing(int wash_seq);
}
