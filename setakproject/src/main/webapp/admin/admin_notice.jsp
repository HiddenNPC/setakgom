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
			//목록 띄우기
			
			function selectData(){				
				$.ajax({
					url :'/setak/admin/ad_noticeList.do',
					type :'POST',
					dataType :'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var str = '';																					
							str += '<ul>';
							str += '<li class="listtd"><input type="checkbox"></li>';
							str += '<li class="listtd">'+item.notice_num+'</li>';
							str += '<li class="listtd"><input type="text" class="notice_title" value="'+item.notice_title +'"disabled></li>';
							str += '<li class="listtd"><input type="textr" class="notice_content" value="'+item.notice_content+'"disabled></li>';
							str += '<li class="listtd"><input type="date" class="notice_date" name="notice_date"  value="'+item.notice_date+'" disabled></li>';							
							str += '<li class="listtd"><a class="update">수정</a><a style="display: none;" value="" class="after">수정</a></li>';
							str += '</ul>';
							$(".ad_noticelist").append(str);
						});
						/* page(); */
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
			<h1>공지사항 관리</h1>
			<ul class="notice_title">
				<li><input type="checkbox" id = "allcheck"></li>
				<li>NO</li>
				<li>제목</li>
				<li>내용</li>
				<li>날짜</li>
				<li>수정</li>
			</ul>
			<form id="ad_notice_form">
				<div class="ad_noticelist">
					
					
					
					
					<input type="button" value="선택삭제" class="chkdelete">
				</div>
			</form>
		</div>
		
	

</div><!--지우지마세요 -->
</body>
</html>
