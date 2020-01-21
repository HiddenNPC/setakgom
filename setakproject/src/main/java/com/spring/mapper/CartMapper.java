package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.KeepCartVO;

public interface CartMapper {
	
	ArrayList<KeepCartVO> getKeepSeq(String member_id);

}
