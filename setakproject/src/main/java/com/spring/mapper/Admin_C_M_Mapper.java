package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring.member.CouponVO;

public interface Admin_C_M_Mapper {
	//목록
	ArrayList<Object> Admin_CouponList();
	
	//검색
	ArrayList<Object> couponSerach (HashMap<String, Object> map);
	
	//쿠폰수 
	int getCouponCount();
	
	//쿠폰수정
	int updateCoupon(CouponVO params);
	
	//쿠폰입력
	int insertCoupon(CouponVO cvo);

	//쿠폰 삭제
	int deleteCoupon(int coupon);
	
}
