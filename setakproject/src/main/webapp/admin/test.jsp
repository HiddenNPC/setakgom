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
			<h1>회원관리</h1>
			<ul class="example">
				<li>전체선택</li>
				<li>아이디</li>
				<li>이름</li>
				<li>가입일</li>
				<li>메모</li>
				<li>관리</li>
			</ul>
			<ul>
				<li>체크</li>
				<li>bit</li>
				<li>박비트</li>
				<li>2020-01-30</li>
				<li>박비트는 최민경이 만들었다</li>
				<li>창조자네 창조자야</li>
			</ul>
			<ul>
				<li>체크</li>
				<li>bit</li>
				<li>박비트</li>
				<li>2020-01-30</li>
				<li>박비트는 최민경이 만들었다</li>
				<li>창조자네 창조자야</li>
			</ul>
			<ul>
				<li>체크</li>
				<li>bit</li>
				<li>박비트</li>
				<li>2020-01-30</li>
				<li>박비트는 최민경이 만들었다</li>
				<li>창조자네 창조자야</li>
			</ul>
		</div>
	</div><!-- 지우지마세요 -->
</body>
</html>
