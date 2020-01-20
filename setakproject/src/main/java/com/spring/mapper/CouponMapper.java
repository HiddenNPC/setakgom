package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.CouponVO;

public interface CouponMapper {

	// 쿠폰 리스트
	ArrayList<CouponVO> getCouponList(String member_id);
	
	// 쿠폰 개수
	int getCouponCount(String member_id);
}
