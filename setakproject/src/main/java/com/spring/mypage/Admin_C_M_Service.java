package com.spring.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.CouponVO;

public interface Admin_C_M_Service {
	//일반 리스트
	public ArrayList<Object> Admin_CouponList();
	
	//검색
	public ArrayList<Object> couponSerach (HashMap<String, Object> map);
	
	//쿠폰수
	public int getCouponCount();
	
	//쿠폰 수정
	public int updateCoupon(CouponVO params);
	
	//쿠폰 입력
	public int insertCoupon(CouponVO cvo);
	
	//쿠폰삭제
	public int deleteCoupon(int coupon);
}
