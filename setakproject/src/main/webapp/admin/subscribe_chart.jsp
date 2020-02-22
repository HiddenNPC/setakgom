<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	int[] subArr = (int[])request.getAttribute("subArr"); 
	int[] sub2Arr = (int[])request.getAttribute("sub2Arr"); 

	int[] allArr = (int[])request.getAttribute("allArr"); 
	int[] shirtsArr = (int[])request.getAttribute("shirtsArr"); 
	int[] dryArr = (int[])request.getAttribute("dryArr"); 
	int[] washArr = (int[])request.getAttribute("washArr"); 
	int[] washDryArr = (int[])request.getAttribute("washDryArr"); 

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel = "shortcut icon" href = "../favicon.ico">
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/>
	
	<!-- toast ui -->
    <link rel="stylesheet" type="text/css" href="./chart/tui-chart.css" />
    <link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.43.0/codemirror.css'/>
    <link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.43.0/addon/lint/lint.css'/>
    <link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.43.0/theme/neo.css'/>
    <link rel='stylesheet' type='text/css' href='./chart/example.css'/>
    
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/core-js/2.5.7/core.js'></script>
	<script type='text/javascript' src='https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.min.js'></script>
	<script type='text/javascript' src='https://uicdn.toast.com/tui.chart/latest/raphael.js'></script>
	<script src='./chart/tui-chart.js'></script>
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<!-- Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70=" crossorigin="anonymous"></script>
	<script src="./utils.js"></script>
	
		<script type="text/javascript" class='code-js' id='code-js'>
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
			
			// 정기구독 일 별 신청자 및 유형별 차트
			var today = new Date();
			var yesterday = new Date(Date.parse(today) - 1 * 1000 * 60 * 60 * 24);
 			var dayago2 = new Date(Date.parse(today) - 2 * 1000 * 60 * 60 * 24);
			var dayago3 = new Date(Date.parse(today) - 3 * 1000 * 60 * 60 * 24);
			var dayago4 = new Date(Date.parse(today) - 4 * 1000 * 60 * 60 * 24); 
			
			var barChartData = {
				labels: [timeSt(dayago4), timeSt(dayago3), timeSt(dayago2), timeSt(yesterday), timeSt(today)],
				datasets: [{
					label: '올인원',
					backgroundColor: window.chartColors.red,
					data: [
						<%=allArr[4]%>, <%=allArr[3]%>, <%=allArr[2]%>, <%=allArr[1]%>, <%=allArr[0]%>
					]
				}, {
					label: '와이셔츠',
					backgroundColor: window.chartColors.orange,
					data: [
						<%=shirtsArr[4]%>, <%=shirtsArr[3]%>, <%=shirtsArr[2]%>, <%=shirtsArr[1]%>, <%=shirtsArr[0]%>
					]
				}, {
					label: '드라이',
					backgroundColor: window.chartColors.yellow,
					data: [
						<%=dryArr[4]%>, <%=dryArr[3]%>, <%=dryArr[2]%>, <%=dryArr[1]%>, <%=dryArr[0]%>
					]
				}, {
					label: '물빨래',
					backgroundColor: window.chartColors.green,
					data: [
						<%=washArr[4]%>, <%=washArr[3]%>, <%=washArr[2]%>, <%=washArr[1]%>, <%=washArr[0]%>
					]
				}, {
					label: '물빨래&드라이',
					backgroundColor: window.chartColors.blue,
					data: [
						<%=washDryArr[4]%>, <%=washDryArr[3]%>, <%=washDryArr[2]%>, <%=washDryArr[1]%>, <%=washDryArr[0]%>
					]
				}]
	
			};

			window.onload = function() {
				
				var ctx2 = document.getElementById('canvas').getContext('2d');
				window.myBar = new Chart(ctx2, {
					type: 'bar',
					data: barChartData,
					options: {
						title: {
							display: true,
							text: '일별 정기구독 신청 및 유형 비율'
						},
						tooltips: {
							mode: 'index',
							intersect: false
						},
						responsive: true,
						scales: {
							xAxes: [{
								stacked: true,
							}],
							yAxes: [{
								stacked: true
							}]
						}
					}
				});
				
				var ctx = document.getElementById('chart-area').getContext('2d');
				window.myPie = new Chart(ctx, config);
				
			};
			
			var config = {
					type: 'pie',
					data: {
						datasets: [{
							data: [
								<%=sub2Arr[0]%>, <%=sub2Arr[1]%>, <%=sub2Arr[2]%>, <%=sub2Arr[3]%>, <%=sub2Arr[4]%>,
								<%=sub2Arr[5]%>, <%=sub2Arr[6]%>, <%=sub2Arr[7]%>, <%=sub2Arr[8]%>, <%=sub2Arr[9]%>,
								<%=sub2Arr[10]%>, <%=sub2Arr[11]%>, <%=sub2Arr[12]%>, <%=sub2Arr[13]%>, <%=sub2Arr[14]%>,
								<%=sub2Arr[15]%>, <%=sub2Arr[16]%>, <%=sub2Arr[17]%>, <%=sub2Arr[18]%>, <%=sub2Arr[19]%>,
								<%=sub2Arr[20]%>, <%=sub2Arr[21]%>
							],
							backgroundColor: [
								window.chartColors.red,
								window.chartColors.red2,
								window.chartColors.red3,
								window.chartColors.red4,
								window.chartColors.red5,
								window.chartColors.red6,
								window.chartColors.orange,
								window.chartColors.orange2,
								window.chartColors.orange3,
								window.chartColors.yellow,
								window.chartColors.yellow2,
								window.chartColors.yellow3,
								window.chartColors.green,
								window.chartColors.green2,
								window.chartColors.green3,
								window.chartColors.green4,
								window.chartColors.green5,
								window.chartColors.green6,
								window.chartColors.blue,
								window.chartColors.blue2,
								window.chartColors.blue3,
								window.chartColors.blue4
							],
							label: 'Dataset 1'
							
						}],
						labels: [
							"올인원59", "올인원74", "올인원89", "올인원104", "올인원119", "올인원134", 
							"와이29", "와이44", "와이55", "드라이44", "드라이59", "드라이74",
							"물빨래34", "물빨래49", "물빨래64", "물빨래79", "물빨래84", "물빨래99", "물드44", "물드59", "물드74", "물드89"
						]
					},
					options: {
						responsive: true,
				        legend: {
				            display: false,
				        }
					}
				};		
		});
		 
		//Date 개체를 입력받아 yyyy-MM-dd 형식으로 반환
		function timeSt(dt) {
		    var d = new Date(dt);
		    var MM = d.getMonth()+1;
		    var dd = d.getDate();

		    return (addzero(MM) + '/' + addzero(dd));
		}
		
		//Date 개체를 입력받아 yy-MM-dd 형식으로 반환
		function timeSt2(dt) {
		    var d = new Date(dt);
		    var yy = d.getFullYear().toString().substring(2,4);
		    var MM = d.getMonth()+1;
		    var dd = d.getDate();

		    return (yy + '/' + addzero(MM) + '/' + addzero(dd));
		}

		//10보다 작으면 앞에 0을 붙임
		function addzero(n) {
		    return n < 10 ? "0" + n : n;
		}		
			
	</script>
		
	</head>
	<body>
			<div id="admin"></div>
			<div class="content">
			
				<h1>기타정기구독관리</h1>
				
			<!-- 전체 차트 div 시작 -->
			<div id = "all-sub-chart-div" style = "display: inline-block;" >
				<p>올인원 와이셔츠 드라이 물빨래 물빨래&드라이</p>	  
	  			<div style = "display: inline-block; padding-bottom : 30px;">					
	  				<canvas id="chart-area" style = "width: 450px;height: 400px;"></canvas>
	  			</div>
				<div style = "display: inline-block">
					<canvas id="canvas" style = "width: 600px;height: 500px;"></canvas>
				</div>
			</div>
			<!-- 전체 차트 div 끝-->
			
			</div> <!-- content div 끝 -->
		</div><!-- 지우지마세요 -->
	</body>

	
</html>
