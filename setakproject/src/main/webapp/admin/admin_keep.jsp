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
					url : '/setak/getKeepList.do',
					type : 'POST',
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var str = '';
							
							str += '<ul>'
							str += '<li class="listtd"><input type="checkbox"></li>';
							str += '<li class="listtd">' + item.keep_rnum + '</li>';
							str += '<li class="listtd">' + item.order_num + '</li>';
							str += '<li class="listtd">' + item.member_id + '</li>';
							str += '<li class="listtd">' + item.keep_kind + '(' + item.keep_count +')</li>';
							str += '<li class="listtd">' + item.keep_box + '</li>';
							str += '<li class="listtd">' + item.keep_start + '</li>';
							str += '<li class="listtd">' + item.keep_end + '</li>';
							str += '<li class="listtd"><select class="keep_now" name="keep_now" disabled>';
							str += '<option value=' + item.keep_now + '>'+ item.keep_now +'</option>';
							str += '<option value="보관중">보관중</option>';
							str += '<option value="부분반환">부분반환</option>';
							str += '<option value="전체반환">전체반환</option>';
							str += '</select></li>';
							str += '<li class="listtd">' + item.keep_file + '</li>';
							str += '<li class="listtd"><a href="" class="update">수정</a></li>';
							str += '</ul>';
							$(".keep_list").append(str);
						});						
						page();
					},
					error:function(){
						alert("ajax통신 실패!!!");
					}
				});
			}
			
			selectData();
			
			//수정 눌렀을 때
			$(document).on('click','.update',function(event) {
				event.preventDefault();
				$(".update").removeClass("after");
				$(".update").attr("href","");
				$(".keep_now").attr("disabled","disabled");
				$(".keep_now").removeClass("upadte_select");
				
				$(this).addClass("after");
				$(this).attr("href","/setak/updateKeep.do?");
				$($(this).parent().parent().children().children('.keep_now')).removeAttr("disabled");
				$($(this).parent().parent().children().children('.keep_now')).addClass("upadte_select");
			});

			
			//페이징 작업
			function page(){ 
				$('div.paginated').each(function() {
					var pagesu = 10;  //페이지 번호 갯수
					var currentPage = 0;
					var numPerPage = 10;  //목록의 수
					var $table = $(this);    
					  
					//length로 원래 리스트의 전체길이구함
					var numRows = $table.find('ul').length;
					//Math.ceil를 이용하여 반올림
					var numPages = Math.ceil(numRows / numPerPage);
					//리스트가 없으면 종료
					if (numPages==0) return;
					//pager라는 클래스의 div엘리먼트 작성
					var $pager = $('<div id="remo"></div>');
					 
					var nowp = currentPage;
					var endp = nowp+10;
				  
					//페이지를 클릭하면 다시 셋팅
					$table.bind('repaginate', function() {
					//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
						$table.find('ul').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
						$("#remo").html("");
						
						if (numPages > 1) {     // 한페이지 이상이면
							if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
								nowp = 0;     // 1부터 
								endp = pagesu;    // 10까지
							}else{
								nowp = currentPage -5;  // 6넘어가면 2부터 찍고
								endp = nowp+pagesu;   // 10까지
								pi = 1;
							}
							if (numPages < endp) {   // 10페이지가 안되면
								endp = numPages;   // 마지막페이지를 갯수 만큼
								nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
							}
							if (nowp < 1) {     // 시작이 음수 or 0 이면
								nowp = 0;     // 1페이지부터 시작
							}
						}else{       // 한페이지 이하이면
							nowp = 0;      // 한번만 페이징 생성
							endp = numPages;
						}
						
						// [<<]
						$('<span class="page-number" cursor: "pointer"><<</span>').bind('click', {newPage: page},function(event) {
							currentPage = 0;
							$table.trigger('repaginate');  
							$($(".page-number")[2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
						// [<]
						$('<span class="page-number" cursor: "pointer"><</span>').bind('click', {newPage: page},function(event) {
							if(currentPage == 0) return;
							currentPage = currentPage-1;
							$table.trigger('repaginate');
							$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
						// [1,2,3,4,5,6,7,8]
						for (var page = nowp ; page < endp; page++) {
							$('<span class="page-number" cursor: "pointer"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
								currentPage = event.data['newPage'];
								$table.trigger('repaginate');
								$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
							}).appendTo($pager).addClass('clickable');
						}
						// [>]
						$('<span class="page-number" cursor: "pointer">></span>').bind('click', {newPage: page},function(event) {
							if(currentPage == numPages-1) return;
							currentPage = currentPage+1;
							$table.trigger('repaginate'); 
							$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
						// [>>]
						$('<span class="page-number" cursor: "pointer">>></span>').bind('click', {newPage: page},function(event) {
							currentPage = numPages-1;
							$table.trigger('repaginate');
							$($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
						$($(".page-number")[2]).addClass('active');
					});
					$pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active'); 
					$pager.appendTo($table);
					$table.trigger('repaginate');
				});
			}
		});
	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>보관관리</h1>
			<ul class="keep_title">
				<li><input type="checkbox" id = "allcheck"></li>
				<li>NO</li>
				<li>주문번호</li>
				<li>아이디</li>
				<li>종류</li>
				<li>박스수량</li>
				<li>신청날짜</li>
				<li>반환날짜</li>
				<li>상황</li>
				<li>이미지</li>
				<li>수정</li>
			</ul>
			<div class="keep_list paginated">
				<input type="button" value="선택삭제" class="chkdelete">
			</div>
		</div>
	</div><!-- 지우지마세요 -->
</body>
</html>
