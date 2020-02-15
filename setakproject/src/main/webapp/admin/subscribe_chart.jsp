<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	int[] subArr = (int[])request.getAttribute("subArr"); 

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
	<title>세탁곰 기타주문관리</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<!-- Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70=" crossorigin="anonymous"></script>
	<script src="./utils.js"></script>
	
		<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
		
			// 정기구독 유형별 차트
			var config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: [
							<%=subArr[0]%>, <%=subArr[1]%>, <%=subArr[2]%>, <%=subArr[3]%>, <%=subArr[4]%>
						],
						backgroundColor: [
							window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow,
							window.chartColors.green,
							window.chartColors.blue,
						],
						label: 'Dataset 1'
					}],
					labels: [
						'올인원', '와이셔츠', '드라이', '물빨래', '물빨래&드라이'
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'left',
					},
					title: {
						display: true,
						text: '정기구독 신청 유형 비율'
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};
			
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
						// 02/09~02/13
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
				var ctx = document.getElementById('chart-area').getContext('2d');
				window.myDoughnut = new Chart(ctx, config);
				
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
			<div id = "all-sub-chart-div">
			<div id="canvas-holder" style="display : inline-block; width:40%">
				<canvas id="chart-area"></canvas>
			</div>
			<div style="display : inline-block; width: 50%">
				<canvas id="canvas"></canvas>
			</div>
			</div>
			<!-- 전체 차트 div 끝-->
			
			</div> <!-- content div 끝 -->
		</div><!-- 지우지마세요 -->
	</body>

	
</html>
