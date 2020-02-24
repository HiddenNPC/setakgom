package com.spring.admin_chart;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminChartController {
	
	@Autowired
	private AdminChartService adminchartService; 
	
	/*세탁, 수선, 보관 그래프*/
	@RequestMapping(value = "/admin/adminChart.do")
	public String adminChart(Model model) {
	
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
				
			}
			
			model.addAttribute("washArr", washArr);
			model.addAttribute("repairArr", repairArr);
			model.addAttribute("keepArr", keepArr);
			
			
			/*
			LocalDate nowDate = LocalDate.now(); //2020-02-19
			
			LocalDate startDay1 = nowDate.with(TemporalAdjusters.firstDayOfYear()); //2020-01-01
			LocalDate startDay2 = nowDate.with(TemporalAdjusters.firstDayOfYear()).plusMonths(0);  //2020-01-01
			
			LocalDate lastDay1 = startDay1.with(TemporalAdjusters.lastDayOfMonth()); //2020-01-31  
			LocalDate lastDay2 = nowDate.with(TemporalAdjusters.firstDayOfYear()).with(TemporalAdjusters.lastDayOfMonth()) ; //2020-01-31
			LocalDate lastDay3 = nowDate.with(TemporalAdjusters.firstDayOfYear()).with(TemporalAdjusters.lastDayOfMonth()).plusMonths(0); //2020-01-31
			
			LocalDate firstDay = nowDate.with(TemporalAdjusters.firstDayOfYear()).plusMonths(1); // 월 더하기  2020-02-01
			
			LocalDate endDay = startDay1.with(TemporalAdjusters.lastDayOfMonth()).plusMonths(1); // 2020-02-29
			LocalDate endDay2 = nowDate.with(TemporalAdjusters.firstDayOfYear()).with(TemporalAdjusters.lastDayOfMonth()).plusMonths(1); //2020-02-29
			
			*/
			
			/*한달 별 주문 상태 변화 그래프*/
			
			String[] startArr = new String[2];
			String[] endArr = new String[2];
			
			int[] washMonthArr = new int[2]; 
			int[] repairMonthArr = new int[2]; 
			int[] keepMonthArr = new int[2]; 
			
			int wash_MonthResult = 0;
			int repair_MonthResult = 0;
			int keep_MonthResult = 0;

			for(int i = 0; i < startArr.length; i++) {
				
				LocalDate nowDate = LocalDate.now();
				
				LocalDate start = nowDate.with(TemporalAdjusters.firstDayOfYear()).plusMonths(i);
				String a = start.toString().substring(2).replace("-","/");
				startArr[i] = a;
				
				LocalDate end = nowDate.with(TemporalAdjusters.firstDayOfYear()).with(TemporalAdjusters.lastDayOfMonth()).plusMonths(i);
				String b = end.toString().substring(2).replace("-","/");
				endArr[i] = b;
				
				map.put("startDate", startArr[i]);
				map.put("endDate", endArr[i]);
				
				
				// 한달간 주문량 계산 : 세탁
				wash_MonthResult = adminchartService.wash_count_month(map);
				washMonthArr[i] += wash_MonthResult; 
				
				// 한달간 주문량 계산 : 수선
				repair_MonthResult = adminchartService.repair_count_month(map);
				repairMonthArr[i] += repair_MonthResult; 
				
				// 한달간 주문량 계산 : 보관
				keep_MonthResult = adminchartService.keep_count_month(map);
				keepMonthArr[i] += keep_MonthResult; 
				
			}
					
						
			model.addAttribute("washMonthArr", washMonthArr);
			model.addAttribute("repairMonthArr", repairMonthArr);
			model.addAttribute("keepMonthArr", keepMonthArr);
			
			return "/admin/admin_chart";
		}
		
	// 수익 그래프
	@RequestMapping(value = "/admin/adminChart2.do")
	public String adminChart2 (Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		LocalDate basic = LocalDate.of(2020, 1, 28);
		LocalDate now = LocalDate.now();
		
		int a = (int)ChronoUnit.DAYS.between(basic, now);
		
		String[] profit_dateArr = new String[a];
		String[] dateArr2 = new String[a];
		
		//세수보 수익금액
		int[] ssbResultArr = new int[a];
		int ssbResult = 0;
		
		//정기결제 수익금액
		int[] subResultArr = new int[a];
		int subResult = 0;
		
		//총 수익금액
		int[] totalArr = new int[a];
		int total = 0;
		
		for(int i = 0; i < a ; i++) {
			
			basic.plusDays(i);
			String c = basic.plusDays(i).toString().substring(2).replace("-","/");
			
			profit_dateArr[i] = c;
			map.put("order_date", profit_dateArr[i]);
			map.put("his_date", profit_dateArr[i]);

			String d = basic.plusDays(i).toString();
			dateArr2[i] = d;
			
			//세수보 수익금액
			ssbResult = adminchartService.profit_ssb(map);
			ssbResultArr[i] += ssbResult; 
			
			//정기결제 수익금액
			subResult = adminchartService.profit_sub(map);
			subResultArr[i] += subResult; 
			
			total = ssbResult + subResult;
			totalArr[i] += total; 
		}
		model.addAttribute("num", a);
		model.addAttribute("dateArr2", dateArr2);
		
		model.addAttribute("ssbResultArr", ssbResultArr);
		model.addAttribute("subResultArr", subResultArr);
		
		model.addAttribute("totalArr", totalArr);
		
		return "/admin/admin_chart2";
	}

}
