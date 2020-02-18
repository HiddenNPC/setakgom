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
	<!-- 대시보드 타이틀 Div 시작 -->
	<div id = "title-div">
		<h2>DashBoard</h2>
	</div>
	<!-- 대시보드 타이틀 Div 끝 -->
	<!-- 대시보드 내용 Div 시작 -->
	<div id = "content-div">
		<!-- 대시보드 내용 상단 3개 Div 시작 -->
		<div class = "body-div">
			<div class = "body-header">
			</div>
			<div class = "body-content">
			1
			</div>
		</div>
		<div class = "body-div">
			<div class = "body-header">
			</div>
			<div class = "body-content">
			2
			</div>
		</div>
		<div class = "body-div">
			<div class = "body-header">
			</div>
			<div class = "body-content">
			3
			</div>
		</div>
		<!-- 대시보드 내용 상단 3개 Div 끝 -->
		
		<!-- 대시보드 내용 하단 3개 Div 시작 -->
		<div class = "body-div">
			<div class = "body-header">
			</div>
			<div class = "body-content">
			4
			</div>
		</div>
		<div class = "body-div">
			<div class = "body-header">
			</div>
			<div class = "body-content">
			5
			</div>
		</div>
		<div class = "body-div">
			<div class = "body-header">
			</div>
			<div class = "body-content">
			6
			</div>
		</div>
		<!-- 대시보드 내용 하단 3개 Div 끝-->
	</div>
	<!-- 대시보드 내용 Div 끝 -->
</div><!-- 지우지마세요 -->
</body>
</html>
