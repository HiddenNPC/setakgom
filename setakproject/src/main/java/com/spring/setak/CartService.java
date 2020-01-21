package com.spring.setak;

import java.util.ArrayList;

public interface CartService {

	// 보관 장바구니 시퀀스 리스트
	public ArrayList<KeepCartVO> getKeepSeq(String member_id);
	
	// 보관 장바구니 값 읽어오기
	public ArrayList<KeepVO> getKeepList(int keep_seq); 
}
