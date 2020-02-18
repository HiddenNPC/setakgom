package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.setak.KeepVO;
import com.spring.setak.MendingVO;

public interface Admin_MendingMapper {
	List<Object> getMendingList();
	int updateMending(MendingVO params);
	int deleteMending(int mending);
	List<Object> mendingSearch(HashMap<String, Object> map);

//	int keepImg(HashMap<String, Object> map);
//	void deleteImg(String keep_path);
//	List<Object> loadImg(HashMap<String, Object> map);
}
