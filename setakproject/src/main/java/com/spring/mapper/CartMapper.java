package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.KeepCartVO;
import com.spring.setak.KeepVO;
import com.spring.setak.MendingCartVO;
import com.spring.setak.MendingVO;
import com.spring.setak.WashingCartVO;
import com.spring.setak.WashingVO;

public interface CartMapper {
	
	// 시퀀스 읽기
	ArrayList<WashingCartVO> getWashSeq(String member_id);
	ArrayList<MendingCartVO> getMendingSeq(String member_id);
	ArrayList<KeepCartVO> getKeepSeq(String member_id);
	
	// 데이터 읽기
	WashingVO getWashingList(int wash_seq); 
	MendingVO getMendingList(int repair_seq);
	KeepVO getKeepList(int keep_seq);
	
	// 장바구니 비우기
	int deleteWashCart(int wash_seq);
	int deleteWash(int wash_seq); 

}
