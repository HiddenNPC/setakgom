package com.spring.admin_chart;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminChartController {
	
	@Autowired
	private AdminChartService adminchartService; 
	
	@RequestMapping(value = "/admin/adminChart.do")
	public String adminOrder(Model model) {
	
		/*하루당 세탁, 수선, 보관 그래프*/
	      Calendar cal = Calendar.getInstance();
	      SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
	     
	      String today = sdf.format(cal.getTime());
	      String[] dateArr = new String[5];
	      dateArr[0] = today; 
	      for(int i = 1; i < 5; i++) {
	         cal.add(Calendar.DATE, -1);
	         dateArr[i] = sdf.format(cal.getTime());
	      }
	
	      
		HashMap<String, Object> map = new HashMap<String, Object>();

			// 하루당 기간별 배열 : 세탁
			int[] washArr = new int[5];
			int wash_dailyResult = 0; 
			
			// 하루당 기간별 배열 : 수선
			int[]repairArr = new int[5];
			int repair_dailyResult = 0;
			
			// 하루당 기간별 배열 : 보관
			int[] keepArr = new int[5];
			int keep_dailyResult = 0; 
			
			for(int j = 0;  j < dateArr.length; j++) {
				map.put("order_date", dateArr[j]);
										
				// 하루당 주문량 계산 : 세탁
				wash_dailyResult = adminchartService.wash_count(map);
				washArr[j] += wash_dailyResult; 
				
				// 하루당 주문량 계산 : 수선
				repair_dailyResult = adminchartService.repair_count(map);
				repairArr[j] += repair_dailyResult; 
				
				// 하루당 주문량 계산 : 보관
				keep_dailyResult = adminchartService.keep_count(map);
				keepArr[j] += keep_dailyResult; 
				
				//System.out.println(j+"번째  "+dateArr[j]+"----"+washArr[j]);
			}
			
			model.addAttribute("washArr", washArr);
			model.addAttribute("repairArr", repairArr);
			model.addAttribute("keepArr", keepArr);
			
			return "/admin/admin_chart";
		}
		

}
