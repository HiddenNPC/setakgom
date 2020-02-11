<!doctype html>
<html>

<head>
	<title>세탁곰 기타주문관리</title>
	
	<!-- Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
	<script src="./utils.js"></script>
	
	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	
	</style>
</head>

<body>
	<div id="container" style="width: 75%;">
		<canvas id="canvas"></canvas>
	</div>
<!-- 	<button id="randomizeData">Randomize Data</button> -->	
	<button id="weekDataset">Dataset 11111</button>
	<button id="dayDataset">Dataset 22222</button>
	
</body>

	<script>
	
		
		var weekDataset = {
				label: '최근 5주간 어짜구저짜구',
				backgroundColor: window.chartColors.red,
				borderColor: window.chartColors.red,
				data: [10,	50, 30, 70, 40],
				fill: false
			};
		
		var dayDataset = {
				label: '최근 5일간 어짜구저짜구',
				backgroundColor: window.chartColors.blue,
				borderColor: window.chartColors.blue,
				data: [70, 80, 20, 100, 50],
				fill: false
			};		
	
		
		var config = {
			type: 'line',
			data: {
				labels: ['January', 'February', 'March', 'April', 'May'],
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
		
		var myLine = ""; 
		var ctx = "";
		
		window.onload = function() {
			ctx = document.getElementById('canvas').getContext('2d');
			// 기본으로 일주일 보여줌 
			config.data.datasets.push(weekDataset);
			myLine = new Chart(ctx, config);			
		};
		
		
		// 일주일 버튼
		document.getElementById('weekDataset').addEventListener('click', function() {
			myLine.destroy(); 
 			config.data.datasets.splice(0, 1);
			config.data.labels = ['January11', 'February11', 'March11', 'April11', 'May11'];
			config.data.datasets.push(weekDataset);
			myLine = new Chart(ctx, config);		
		});
		
		// 하루 버튼 
		document.getElementById('dayDataset').addEventListener('click', function() {
			myLine.destroy(); 
			config.data.datasets.splice(0, 1);
			config.data.labels = ['January22', 'February22', 'March22', 'April22', 'May22'];
			config.data.datasets.push(dayDataset);
			myLine = new Chart(ctx, config);
		});

	</script>
	
</html>