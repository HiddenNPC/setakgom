package com.spring.setak;

import java.util.ArrayList;

public interface CartService {

	// 세탁 장바구니 시퀀스 리스트
	public ArrayList<WashingCartVO> getWashSeq(String member_id);
	// 수선 장바구니 시퀀스 리스트
	public ArrayList<MendingCartVO> getMendingSeq(String member_id);
	// 보관 장바구니 시퀀스 리스트
	public ArrayList<KeepCartVO> getKeepSeq(String member_id);
	
	// 세탁 장바구니 값 읽어오기
	public WashingVO getWashingList(int wash_seq); 
	// 수선 장바구니 값 읽어오기
	public MendingVO getMendingList(int repair_seq);
	// 보관 장바구니 값 읽어오기
	public KeepVO getKeepList(int keep_seq); 
	
	// 세탁 장바구니 비우기
	public int deleteWashCart(int wash_seq);	
	// 세탁 상품 비우기
	public int deleteWash(int wash_seq);
	
	// 수선 장바구니 비우기
	public int deleteMendingCart(int repair_seq);
	// 수선 상품 비우기
	public int deleteMending(int repair_seq);
	
	// 보관 장바구니 비우기
	public int deleteKeepCart(String member_id);
	// 보관 상품 비우기
	public int deleteKeep(int keep_seq); 
}
