package com.spring.mapper;

import java.util.HashMap;

public interface Admin_chart {
	
	// 세탁건수-하루단위 
	int wash_count(HashMap<String, Object> map);
	
	// 수선건수-하루단위 
	int repair_count(HashMap<String, Object> map);
	
	// 보관건수-하루단위 
	int keep_count(HashMap<String, Object> map);
	
	// 세탁건수-일주일단위
	int wash_count_week(HashMap<String, Object> map);

}
