<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
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
			<h1>전체쿠폰관리</h1>
			<ul class="coupon_title">
				<li><input type="checkbox" id="allcheck"></li>
				<li>회원아이디</li>
				<li>쿠폰혜택</li>
				<li>쿠폰발행일</li>
				<li>사용기간</li>
			</ul>
			<form id="coupon_form">
				<div class="coupon_list paginated">
					<input type="button" value="선택삭제" class="checkdelete">
				</div>
			</form>
			</div>
		<!-- 결과  div 끝-->
	<!-- 지우지마세요 -->
</body>
</html>
