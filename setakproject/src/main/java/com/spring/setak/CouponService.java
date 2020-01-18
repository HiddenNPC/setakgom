package com.spring.setak;

import java.util.ArrayList;

public interface CouponService {

	// 쿠폰 리스트
	public ArrayList<CouponVO> getCouponList(String member_id);
}
