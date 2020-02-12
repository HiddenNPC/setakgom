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
		
			// 목록 띄우기
			function getMemberList() {
				
			}
			
            // 엔터키가 눌렸을 때 실행할 내용
			function enterkey() {
		        if (window.event.keyCode == 13) {
		           
		        }
			}
		});
		
	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>정기구독 회원 관리</h1>

			<!--필터 div 시작 -->
			<div id = "search-div">
				<h2>회원검색</h2>
				<form id = "search-form" action = "">
					<table id = "search-table">
						<tr>
							<td>회원 아이디</td>
							<td>
								<input id = "keyword" type = "text" size = "40px" placeholder = "내용을 입력해주세요." onkeyup="enterkey();" /> 
							</td>
						</tr>
						<tr>
							<td>요금제</td>
							<td>
								<label for = ""><input id="" name = "check" value = "" type = "checkbox">올인원</label>
								<label for = ""><input id="" name = "check" value = "" type = "checkbox">와이셔츠</label>
								<label for = ""><input id="" name = "check" value = "" type = "checkbox">드라이</label>
								<label for = ""><input id="" name = "check" value = "" type = "checkbox">물빨래</label>
								<label for = ""><input id="" name = "check" value = "" type = "checkbox">물빨래&드라이</label>
							</td>
						</tr>
						<tr>
							<td>정렬</td>
							<td>
							<select id = "order-select">
								<option value = "byDate">구독신청순</option>
								<option value = "byDateReverse">구독신청역순</option>
							</select>
							</td>
						</tr>
					</table>
				</form>
				
				<div id="search-btn-div">
					<input type="button" id = "search-btn" value = "검색" onclick = "searchOrder();" />
					<button id = "reset-btn">초기화</button>
				</div>
			</div>
			<!--필터 div 끝 -->
			
			<ul class="example">
				<li>아이디</li>
				<li>요금제</li>
				<li>물빨래</li>
				<li>와이셔츠</li>
				<li>드라이클리닝</li>
				<li>이불</li>
				<li>배송</li>
				<li>구독신청일</li>
				<li>구독만료일</li>
				<li>수정삭제</li>
			</ul>
			<ul>
				<li>bit</li>
				<li>올인원59</li>
				<li>
					<input type = "text" style = "width:15px;" value ="" />
					/
					<span id = "wash_cnt">3</span>
				</li>
				<li>
					<input type = "text" style = "width:15px;" value ="" />
					/
					<span id = "shirt_cnt">15</span>
				</li>
				<li>
					<input type = "text" style = "width:15px;" value ="" />
					/
					<span id = "dry_cnt">3</span>
				</li>
				<li>-</li>
				<li>
					<input type = "text" style = "width:15px;" value ="" />
					/
					<span id = "wash_cnt">3</span>
				</li>
				<li><span id = "sub_start"></span></li>
				<li><span id = "sub_end"></span></li>
				<li>
					<input type = "button" value = "수정" />
					<input type = "button" value = "삭제" /> 			
				</li>
			</ul>


		</div>
	</div><!-- 지우지마세요 -->
</body>
</html>
