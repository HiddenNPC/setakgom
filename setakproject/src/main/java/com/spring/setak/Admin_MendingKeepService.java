package com.spring.setak;

import java.util.List;
import java.util.Map;

public interface Admin_MendingKeepService {
	List<Object> getKeepList();
	int updateKeep(KeepVO params);
}
