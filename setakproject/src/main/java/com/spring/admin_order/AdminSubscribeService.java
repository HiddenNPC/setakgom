package com.spring.admin_order;

import java.util.HashMap;
import java.util.List;


public interface AdminSubscribeService {

	List<Object> getMemberSubList();
	List<Object> subMemberSearch(HashMap<String, Object> map);
	
}
