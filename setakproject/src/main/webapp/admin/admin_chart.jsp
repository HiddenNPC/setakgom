<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int[] washArr = (int[])request.getAttribute("washArr");
	int[] repairArr = (int[])request.getAttribute("repairArr");
	int[] keepArr = (int[])request.getAttribute("keepArr");
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
	
	<!-- toast chart -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
	<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>	

</head>

<body>
	<div id="admin"></div>
	<div class="content">
		<div style="width:70%;">
			<canvas id="canvas"></canvas>
		</div>
	</div><!-- 지우지마세요 -->
	
<script type="text/javascript">
		//헤더, 푸터연결
		$("#admin").load("./admin.jsp")
		
			/*x축 날짜*/
			var today = new Date();
			var yesterday = new Date(Date.parse(today) - 1 * 1000 * 60 * 60 * 24);
 			var dayago2 = new Date(Date.parse(today) - 2 * 1000 * 60 * 60 * 24);
			var dayago3 = new Date(Date.parse(today) - 3 * 1000 * 60 * 60 * 24);
			var dayago4 = new Date(Date.parse(today) - 4 * 1000 * 60 * 60 * 24); 
			
			/*데이터*/
			var config = {
				type: 'bar',
				data: {
					labels: [timeSt(dayago4), timeSt(dayago3), timeSt(dayago2), timeSt(yesterday), timeSt(today)],
					datasets: [{
						label: '세탁량',
						fill: false,
						backgroundColor: window.chartColors.red,
						borderColor: window.chartColors.red,
						data: [<%=washArr[4]%>,<%=washArr[3]%>,<%=washArr[2]%>,<%=washArr[1]%>,<%=washArr[0]%>],
					}, {
						label: '수선량',
						fill: false,
						backgroundColor: window.chartColors.blue,
						borderColor: window.chartColors.blue,
						data: [<%=repairArr[4]%>,<%=repairArr[3]%>,<%=repairArr[2]%>,<%=repairArr[1]%>,<%=repairArr[0]%>],
					}, {
						label: '보관량',
						fill: false,
						backgroundColor: window.chartColors.yellow,
						borderColor: window.chartColors.yellow,
						data: [<%=keepArr[4]%>,<%=keepArr[3]%>,<%=keepArr[2]%>,<%=keepArr[1]%>,<%=keepArr[0]%>],
					}]
				},
				options: {
					responsive: true,
					title: {
						display: true,
						text: '일별 주문 상태 변화'
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
								labelString: 'Month'
							}
						},
						y: {
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Value'
							}
						}
					}
				}
			};
			
			
		
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myLine = new Chart(ctx, config);
		};
	
		//Date 개체를 입력받아 yyyy-MM-dd 형식으로 반환
		function timeSt(dt) {
		    var d = new Date(dt);
		    var MM = d.getMonth()+1;
		    var dd = d.getDate();

		    return (addzero(MM) + '/' + addzero(dd));
		}
		
		//10보다 작으면 앞에 0을 붙임
		function addzero(n) {
		    return n < 10 ? "0" + n : n;
		}		
	</script>
</body>

</html>