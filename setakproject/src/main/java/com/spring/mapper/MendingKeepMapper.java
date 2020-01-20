package com.spring.mapper;

import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;

public interface MendingKeepMapper {
	void insertMending(MendingVO mending);
	void insertKeep(KeepVO keep);
}
