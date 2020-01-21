package com.spring.mapper;

import java.util.ArrayList;

import com.spring.setak.KeepCartVO;
import com.spring.setak.KeepVO;

public interface CartMapper {
	
	ArrayList<KeepCartVO> getKeepSeq(String member_id);
	ArrayList<KeepVO> getKeepList(int keep_seq);

}
