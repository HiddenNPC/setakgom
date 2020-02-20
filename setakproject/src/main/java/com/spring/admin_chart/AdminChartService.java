package com.spring.admin_chart;

import java.util.HashMap;

public interface AdminChartService {
	
	// 세탁건수-하루단위  
	public int wash_count(HashMap<String, Object> map);
	
	// 세탁건수-하루단위  
	public int repair_count(HashMap<String, Object> map);
	
	// 세탁건수-하루단위  
	public int keep_count(HashMap<String, Object> map);
		
	// 세탁건수-한달단위
	public	int wash_count_month(HashMap<String, Object> map);
	
	// 수선건수-한달단위
	public int repair_count_month(HashMap<String, Object> map);
		
	// 보관건수-한달단위
	public	int keep_count_month(HashMap<String, Object> map);	
}
