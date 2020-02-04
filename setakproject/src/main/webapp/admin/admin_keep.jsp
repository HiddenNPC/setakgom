<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/admin_keep.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")
			
			//목록
			function selectData(){
				//table 내부 내용 초기화
				$('#list').empty();
				
				$.ajax({
					url : '/setak/getKeepList.do',
					type : 'POST',
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var str = '';
							str += '<ul>'
							str += '<li><input type="checkbox"></li>';
							str += '<li>' + item.keep_rnum + '</li>';
							str += '<li>' + item.order_num + '</li>';
							str += '<li>' + item.member_id + '</li>';
							str += '<li>' + item.keep_kind + '(' + item.keep_count +')</li>';
							str += '<li>' + item.keep_box + '</li>';
							str += '<li>' + item.keep_start + '</li>';
							str += '<li>' + item.keep_end + '</li>';
							str += '<li>' + item.keep_now + '</li>';
							str += '<li>' + item.keep_file + '</li>';
							str += '<li><a href="/setak/updateKeep.do?">수정</a></li>';
							$(".keep_list").after(str);
						});
					},
					error:function(){
						alert("ajax통신 실패!!!");
					}
				});
			}
			
			
			selectData();
			
		});
	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>보관관리</h1>
			<ul class="keep_list">
				<li><input type="checkbox" id = "allcheck"></li>
				<li>주문번호</li>
				<li>아이디</li>
				<li>종류</li>
				<li>박스수량</li>
				<li>신청날짜</li>
				<li>반환날짜</li>
				<li>상황</li>
				<li>이미지</li>
				<li>수정 / 삭제</li>
			</ul>
			
			
		</div>
	</div><!-- 지우지마세요 -->
</body>
</html>
