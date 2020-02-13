package com.spring.mapper;

import java.util.List;

import com.spring.setak.KeepVO;

public interface Admin_KeepMapper {
	List<Object> getKeepList();
	int updateKeep(KeepVO params);
	int keepImg(KeepVO keep);
}
