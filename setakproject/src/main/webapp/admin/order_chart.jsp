<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/example.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
		});
	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>기타주문관리</h1>
			
			<!-- 주문량 차트 div 시작 -->
			<div id = "chart-div">
			</div>
			<!-- 주문량 차트 div 끝 -->
			
			<!-- 처리해야할 주문 div 시작 -->
			<div id = "count-div">
				<h2>처리해야할 주문</h2>
				<table id = "count-table">
					<thead>
						<tr>
							<th>상태변경</th>
							<th>건수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>입금 > 수거</td>
							<td></td>
						</tr>
						<tr>
							<td>수거 > 서비스중</td>
							<td></td>
						</tr>
						<tr>
							<td>서비스중 > 배송중</td>
							<td></td>
						</tr>
						<tr>
							<td>배송중 > 완료</td>
							<td></td>
						</tr>						
					</tbody>
				</table>
			</div>
			<!-- 처리해야할 주문 div 끝-->
			
		</div>
	</div><!-- 지우지마세요 -->
</body>
</html>
