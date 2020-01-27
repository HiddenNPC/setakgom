package com.spring.mapper;

import com.spring.setak.MileageVO;

public interface MileageMapper {
	
	int getSum(String member_id); 
	int useMileage(MileageVO mvo); 
	
}
