package com.spring.mapper;

import com.spring.setak.KeepCartVO;
import com.spring.setak.KeepVO;
import com.spring.setak.MendingCartVO;
import com.spring.setak.MendingVO;
import com.spring.setak.WashingCartVO;
import com.spring.setak.WashingVO;

public interface MendingKeepMapper {
	int insertMending(MendingVO mending);
	void insertMendingCart(MendingCartVO mendingcart);
	int insertKeep(KeepVO keep);
	void insertKeepCart(KeepCartVO keepcart);
	int insertWash(WashingVO washing);
	void insertWashingCart(WashingCartVO washingcart);
}
