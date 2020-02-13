<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int[] payArr = (int[])request.getAttribute("payArr"); 
	int[] pickArr = (int[])request.getAttribute("pickArr"); 
	int[] serviceArr = (int[])request.getAttribute("serviceArr"); 
	int[] deliveryArr = (int[])request.getAttribute("deliveryArr"); 
	int[] completeArr = (int[])request.getAttribute("completeArr"); 
	int[] cancleArr = (int[])request.getAttribute("cancleArr"); 
	
	int[] dailyArr = (int[])request.getAttribute("dailyArr"); 
	int[] weeklyArr = (int[])request.getAttribute("weeklyArr");
	
	int dailySum = (int)request.getAttribute("dailySum"); 
	int weeklySum = (int)request.getAttribute("weeklySum"); 
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
		

			/* 최근 5일 주문 상태  */
			var today = new Date();
			var yesterday = new Date(Date.parse(today) - 1 * 1000 * 60 * 60 * 24);
 			var dayago2 = new Date(Date.parse(today) - 2 * 1000 * 60 * 60 * 24);
			var dayago3 = new Date(Date.parse(today) - 3 * 1000 * 60 * 60 * 24);
			var dayago4 = new Date(Date.parse(today) - 4 * 1000 * 60 * 60 * 24); 
				
			var color = Chart.helpers.color;
			var barChartData = {
				labels: [timeSt(dayago4), timeSt(dayago3), timeSt(dayago2), timeSt(yesterday), timeSt(today)],
				datasets: [{
					label: '결제완료',
					backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
					borderColor: window.chartColors.red,
					borderWidth: 1,
					data: [
						// 5일간의 결제완료 수 
						<%=payArr[0]%>, <%=payArr[1]%>, <%=payArr[2]%>, <%=payArr[3]%>, <%=payArr[4]%>
					]
				}, {
					label: '수거중',
					backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
					borderColor: window.chartColors.blue,
					borderWidth: 1,
					data: [
						<%=pickArr[0]%>, <%=pickArr[1]%>, <%=pickArr[2]%>, <%=pickArr[3]%>, <%=pickArr[4]%>
					]
				}, {
					label: '서비스중',
					backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
					borderColor: window.chartColors.yellow,
					borderWidth: 1,
					data: [
						<%=serviceArr[0]%>, <%=serviceArr[1]%>, <%=serviceArr[2]%>, <%=serviceArr[3]%>, <%=serviceArr[4]%>
					]
				}, {
					label: '배송중',
					backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
					borderColor: window.chartColors.green,
					borderWidth: 1,
					data: [
						<%=deliveryArr[0]%>, <%=deliveryArr[1]%>, <%=deliveryArr[2]%>, <%=deliveryArr[3]%>, <%=deliveryArr[4]%>
					]
				}, {
					label: '배송완료',
					backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
					borderColor: window.chartColors.orange,
					borderWidth: 1,
					data: [
						<%=completeArr[0]%>, <%=completeArr[1]%>, <%=completeArr[2]%>, <%=completeArr[3]%>, <%=completeArr[4]%>
					]
				}, {
					label: '주문취소',
					backgroundColor: color(window.chartColors.grey).alpha(0.5).rgbString(),
					borderColor: window.chartColors.grey,
					borderWidth: 1,
					data: [
						<%=cancleArr[0]%>, <%=cancleArr[1]%>, <%=cancleArr[2]%>, <%=cancleArr[3]%>, <%=cancleArr[4]%>
					]
				}]

			};
			
			
			/*일주일 차트*/ 			
			var weekDataset = {
					label: '최근 5주간 어짜구저짜구',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [<%=weeklyArr[0]%>, <%=weeklyArr[1]%>, <%=weeklyArr[2]%>, <%=weeklyArr[3]%>, <%=weeklyArr[4]%>],
					fill: false
				};
			
			var dayDataset = {
					label: '최근 5일간 어짜구저짜구',
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [<%=dailyArr[0]%>, <%=dailyArr[1]%>, <%=dailyArr[2]%>, <%=dailyArr[3]%>, <%=dailyArr[4]%>],
					fill: false
				};		
		
			//  x1 : 첫날, x2 : 마지막날
			var weekago11 = new Date(Date.parse(today) - 6 * 1000 * 60 * 60 * 24);
			var weekago22 = new Date(Date.parse(today) - 7 * 1000 * 60 * 60 * 24);
			var weekago21 = new Date(Date.parse(today) - 13 * 1000 * 60 * 60 * 24);
			var weekago32 = new Date(Date.parse(today) - 14 * 1000 * 60 * 60 * 24);
			var weekago31 = new Date(Date.parse(today) - 20 * 1000 * 60 * 60 * 24);
			var weekago42 = new Date(Date.parse(today) - 21 * 1000 * 60 * 60 * 24);
			var weekago41 = new Date(Date.parse(today) - 27 * 1000 * 60 * 60 * 24);
			var weekago52 = new Date(Date.parse(today) - 28 * 1000 * 60 * 60 * 24);
			var weekago51 = new Date(Date.parse(today) - 34 * 1000 * 60 * 60 * 24);
			
			var config = {
				type: 'line',
				data: {
					labels: [[timeSt2(weekago51), '~', timeSt2(weekago52)], 
							 [timeSt2(weekago41), '~', timeSt2(weekago42)], 
							 [timeSt2(weekago31), '~', timeSt2(weekago32)], 
							 [timeSt2(weekago21), '~', timeSt2(weekago22)], 
							 [timeSt2(weekago11), '~', timeSt2(today)]
							],
					datasets: []
				},
				options: {
					responsive: true,
					title: {
						display: true,
						text: 'Chart.js Line Chart'
					},
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						x: {
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Month',
							}
						},
						y: {
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Value',
							}
						}, xAxes: [{
				            ticks: {
				                fontSize: 12
				            }
				        }], yAxes: [{
				            ticks: {
				                fontSize: 14
				            }
				        }]
					}
				}
			};


			var ctx2 = "";
			var myLine = ""; 
			
			window.onload = function() {
				/*최근 5일 상태 차트*/
				var ctx = document.getElementById('canvas').getContext('2d');
				window.myBar = new Chart(ctx, {
					type: 'bar',
					data: barChartData,
					options: {
						responsive: true,
						legend: {
							position: 'top',
						},
						title: {
							display: true,
							text: '최근 5일 주문 상태'
						},
						scales: {
							xAxes: [{
					            ticks: {
					                fontSize: 16
					            }
					        }], yAxes: [{
					            ticks: {
					                fontSize: 14
					            }
					        }]
						}
					}
				});
				
				/*최근 일주일, 하루 차트*/ 
				ctx2 = document.getElementById('canvas2').getContext('2d');
				config.data.datasets.push(weekDataset);
				myLine = new Chart(ctx2, config);		

			};
			
			
			// 일주일 버튼
			document.getElementById('weekDataset').addEventListener('click', function() {
				myLine.destroy(); 
				config.data.datasets.splice(0, 1);
								
				config.data.labels = [[timeSt2(weekago51), '~', timeSt2(weekago52)], 
					 [timeSt2(weekago41), '~', timeSt2(weekago42)], 
					 [timeSt2(weekago31), '~', timeSt2(weekago32)], 
					 [timeSt2(weekago21), '~', timeSt2(weekago22)], 
					 [timeSt2(weekago11), '~', timeSt2(today)]
					],
				config.data.datasets.push(weekDataset);
				myLine = new Chart(ctx2, config);		
			});
			
			// 하루 버튼 
			document.getElementById('dayDataset').addEventListener('click', function() {
				myLine.destroy(); 
				config.data.datasets.splice(0, 1);
				config.data.labels = [timeSt(dayago4), timeSt(dayago3), timeSt(dayago2), timeSt(yesterday), timeSt(today)];
				config.data.datasets.push(dayDataset);
				myLine = new Chart(ctx2, config);
			});
			
			
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
				<h1>기타주문관리</h1>
				<!-- chart.js : 최근 5일 주문 상태 -->
				<div id="recent5Days-div">
					<canvas id="canvas"></canvas>
				</div>
				
				<!-- 최근  일주일 혹은 하루 총 주문량-->
				<div id = "recentAll-div">					
					<div id = "recentAll-num">
						<div id = "recentAll5days-num">
							총 &nbsp;<span id = "dailySum" class = "sum"><%=dailySum %></span>&nbsp;건
							<br/>
							<span>5일간 주문</span>							
						</div>
						
						<div id = "recentAll5weeks-num">
							총 &nbsp;<span  id = "dailySum" class = "sum"><%=weeklySum %></span>&nbsp;건
							<br/>
							<span>5주간 주문</span>							
						</div>						
					</div>
					<div id = "recentAll-btn">
						<button id="weekDataset" class = "chartBtn">주별</button>
						<button id="dayDataset" class = "chartBtn">일별</button>
					</div>
							
					<canvas id="canvas2"></canvas>
			
				</div>

			</div> <!-- content div 끝 -->
		</div><!-- 지우지마세요 -->
	</body>

	
</html>
