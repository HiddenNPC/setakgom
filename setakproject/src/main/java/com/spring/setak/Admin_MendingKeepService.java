package com.spring.setak;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface Admin_MendingKeepService {
	List<Object> getKeepList();
	int updateKeep(KeepVO params);
	int keepImg(KeepVO keep);
	int deleteKeep(int keep);
	List<Object> keepSerach(HashMap<String, Object> map);
}
