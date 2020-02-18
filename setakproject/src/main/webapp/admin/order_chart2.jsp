<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String[] dateArr = (String[])request.getAttribute("dateArr");
	int[] washArr = (int[])request.getAttribute("washArr");
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
</head>

<body>
			<div id="admin"></div>
			<div class="content">
				<div style="width:75%;">
					<canvas id="canvas"></canvas>
				</div>
			</div><!-- 지우지마세요 -->

		<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
	
			
			/*일주일 차트*/ 			
			var dayDataset = {
					label: '최근 5일간 어짜구저짜구',
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [<%=washArr[4]%>,<%=washArr[3]%>,<%=washArr[2]%>,<%=washArr[1]%>,<%=washArr[0]%>],
					fill: false
				};
			
			var label_0 = <%=dateArr[0] %>;
			var label_1 = <%=dateArr[1] %>;
			var label_2 = <%=dateArr[2] %>;
			var label_3 = <%=dateArr[3] %>;
			var label_4 = <%=dateArr[4] %>;
			
			var config = {
				data: {
					labels: [label_4, label_3, label_2, label_1, label_0 ],
					datasets: [] // 데이터 값 쓸게 많아서 아래에서 
				},
				
				
				options: {
					responsive: true, 
					title: {
						display: true,
						text: 'Chart.js Line Chart'  //타이틀 
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

			
			
			window.onload = function() {
				
				/*최근 일주일, 하루 차트*/ 
				ctx = document.getElementById('canvas2');  // canvas2 2d는 바꾸지 말공
				config.data.datasets.push(dayDataset);
				myLine = new Chart(ctx, config);		

			};
			
			
			
			
			
		});
		
			
	</script>
		
	
</body>
		
	
</html>
