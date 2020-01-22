package com.spring.order;

import java.util.ArrayList;

public interface CartService {

	// 보관 장바구니 시퀀스 리스트
	public ArrayList<KeepCartVO> getKeepSeq(String member_id);
}
