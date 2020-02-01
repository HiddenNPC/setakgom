<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/adminorder.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
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
			<h1>전체주문관리</h1>
			
			<!-- 필터 -->
			<div id = "search-div">
				<h2>전체주문검색</h2>
				<form id = "search-form" action = "">
					<table id = "search-table">
						<tr>
							<td>주문검색</td>
							<td>
								<select id = "search-cate">
									<option>주문 번호</option>
									<option>회원 아이디</option>
								</select>
								<input type = "text" size = "40px" placeholder = "내용을 입력해주세요." /> 
							</td>
						</tr>
						<tr>
							<td>주문상태</td>
							<td>
								<label for = ""><input type = "checkbox">결제완료</label>
								<label for = ""><input type = "checkbox">수거중</label>
								<label for = ""><input type = "checkbox">서비스중</label>
								<label for = ""><input type = "checkbox">배송중</label>
								<label for = ""><input type = "checkbox">배송완료</label>
								<label for = ""><input type = "checkbox">주문취소</label>
							</td>
						</tr>
						<tr>
							<td>주문일자</td>
							<td>
								<input type = "text" size = "15px"/>
								~
								<input type = "text" size = "15px"/>
								<button class = "search-date-btn" id = "today">오늘</button>
								<button class = "search-date-btn" id = "oneweek">일주일</button>
								<button class = "search-date-btn" id = "onemonth">1개월</button>
								<button class = "search-date-btn" id = "threemonth">3개월</button>
								<button class = "search-date-btn" id = "sixmonth">6개월</button>
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<button id = "search-btn">검색</button>
					<button id = "reset-btn">초기화</button>
				</div>
			</div>
			
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
