package com.spring.setak;

import java.util.ArrayList;

public interface CouponService {

	// 쿠폰 리스트
	public ArrayList<CouponVO> getCouponList(String member_id);
	// 쿠폰 갯수
	public int getCouponCount(String member_id);
}
