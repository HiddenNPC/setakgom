<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.setak.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/admin_qna.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp")	
			
			//class="a-q-reply" value="답변"  class="a-q-delete" value="삭제"
			$(document).on('click', 'li .a-q-delete', function () { 
				var num = $(this).parent().parent().find('.qna_num').val();	
				var param = {"qna_num": num}
				jQuery.ajax({
					url : './ad_qnaDelete.do', 
					type : 'post',
					data : param,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : "json", //서버에서 보내줄 데이터 타입
					success:function(retVal){
						if(retVal.res == "OK"){
							$('.ad_qnalist').empty();
							selectData();	
						}
					},
					error:function(){
						alert("ajax통신 실패");
					}
				});
				event.preventDefault();
			}); 
			
			//추가버튼 누르면 
			$(document).on('click', '.a-q-reply', function () { 			
				var rnum = $(this).parent().parent().children().children().val();
				var rcontent = 
				if(!$(this).hasClass("active")){					
					$(this).attr('value', '답변 등록');
					$(this).addClass("active");	
					$(this).parent().parent().after('<ul id="test1"><li> 글번호: <input id="a-q-rnum" type="text" disabled="disabled" value=""> 내용: <textarea value="안녕하세요 세탁곰입니다."></textarea></li></ul>');			
					$('#a-q-rnum').attr('value',rnum);									
					$('#ad_qna_form').attr('action', './admin/commentInsert.do');
						
				}else{
					$(this).removeClass("active");
					$(this).attr('value','답변');
					$('#ad_qna_form').attr('action', '');
					$('#test1').detach();			

				}
				var params = {"qna_num": rnum, "qna_content" : rcontent}
				jQuery.ajax({
					url : './noticeUpdate.do', 
					type : 'post',
					data : params,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : "json", //서버에서 보내줄 데이터 타입
					success:function(retVal){
						if(retVal.res == "OK"){
							$('.ad_noticelist').empty()
							selectData();
						} else {
							alert("수정 실패");
						}
					},
					error:function(){
						alert("ajax통신 실패");
					}
				});
				event.preventDefault();
			}); 
				
				
				
				
				
				
				
			});
			
			
			
			
			
			
			/*
			//수정버튼 누르면					
			$(document).on('click', 'li .update', function () { 
				 if(!$(this).hasClass("active")){
					$(this).attr('value', '수정 확인 ');
					$(this).addClass("active");
					$('#ad_notice_form').attr('action', "./admin_noticeUpdate.do");					
					$(this).parent().prev().children().attr('disabled',false).css({'background':'#e1e4e4', 'border' : '1px solid #444'});
					$(this).parent().prev().prev().children().attr('disabled',false).css({'background':'#e1e4e4', 'border' : '1px solid #444'});
					$(this).parent().prev().prev().prev().children().attr('disabled',false).css({'background':'#e1e4e4', 'border' : '1px solid #444'});										
				 }else{
					$(this).attr('value','수정');
					$(this).removeClass("active");
					$('#ad_notice_form').attr('action', "");		
					$(this).parent().prev().children().attr('disabled',true).css({'background':'none', 'border' : 'none'});
					$(this).parent().prev().prev().children().attr('disabled',true).css({'background':'none', 'border' : 'none'});
					$(this).parent().prev().prev().prev().children().attr('disabled',true).css({'background':'none', 'border' : 'none'});
										
				 }				
				
			});
			
			//추가버튼 누르면 
			$(document).on('click', '#ad-notice-insert-btn', function () { 			
				if(!$(this).hasClass("active")){					
					$(this).attr('value', '추가 취소');
					$(this).addClass("active");
					$('#ad-notice-insert').show();
					$('#ad-notice-insert-form').attr('action', './noticeInsert.do');
					
				}else{
					$(this).removeClass("active");
					$(this).attr('value','추가');
					$('#ad-notice-insert-form').attr('action', '');
					$('#ad-notice-insert').hide();					

				}
				
			});
			*/
			
			/*
			$(document).on('click','.update.active', function(event){
				var num = $(this).parent().parent().find('.notice_num').val();
				var title = $(this).parent().parent().find('.notice_title').val();
				var content = $(this).parent().parent().find('.notice_content').val();
				var date = $(this).parent().parent().find('.notice_date').val();								
				var params = {"notice_num": num, "notice_title" : title, "notice_content" : content, "notice_date" : date }				
				jQuery.ajax({
					url : './noticeUpdate.do', 
					type : 'post',
					data : params,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : "json", //서버에서 보내줄 데이터 타입
					success:function(retVal){
						if(retVal.res == "OK"){
							$('.ad_noticelist').empty()
							selectData();
						} else {
							alert("수정 실패");
						}
					},
					error:function(){
						alert("ajax통신 실패");
					}
				});
				event.preventDefault();
			}); 
			
			$(document).on('click','.a-n-delete', function(event){
				var num = $(this).parent().parent().find('.notice_num').val();	
				var param = {"notice_num": num}
				jQuery.ajax({
					url : './noticeDelete.do', 
					type : 'post',
					data : param,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : "json", //서버에서 보내줄 데이터 타입
					success:function(retVal){
						if(retVal.res == "OK"){
							$('.ad_noticelist').empty()
							selectData();
						} else {
							alert("삭제 실패");
						}
					},
					error:function(){
						alert("ajax통신 실패");
					}
				});
				event.preventDefault();
			}); 
			*/
			
			//목록 띄우기
			function selectData(){				
				$.ajax({
					url :'/setak/admin/ad_qnalist.do',
					type :'POST',
					dataType :'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var qna_d =JSON.stringify(item.qna_date);					
							var qdate= qna_d.substring(1 , 11).trim();
							var str = '';																					
							str += '<ul>';
							str += '<li><input type="text" class="qna_num" value="'+item.qna_num+'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="member_id" value="'+item.member_id +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_type" value="'+item.qna_type +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="order_num" value="'+item.order_num +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_title" value="'+item.qna_title +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_content" value="'+item.qna_content +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_date"  value="'+ qdate +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_file" value="'+item.qna_file +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_check" value="'+item.qna_check+'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_scr" value="'+item.qna_scr+'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="qna_pass" value="'+item.qna_pass+'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="button" class="a-q-reply" value="답변"></li>';
							str += '<li class="listtd"><input type="button" class="a-q-delete" value="삭제"></li>';
							str += '</ul>';
							$(".ad_qnalist").append(str);
						});
						page();
					},
					error:function(){
						alert("ajax통신 실패!!!");
					}
				});
			}
			
			selectData();
						
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
			
			function replylist(){				
				$.ajax({
					url :'/setak/admin/ad_commentList.do',
					type :'POST',
					dataType :'json',
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success:function(data){
						$.each(data, function(index, item){
							var str = '';																					
							str += '<ul>';
							str += '<li class="listtd"><input type="text" class="r-qna_seq" value="'+item.qna_seq+'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="r-qna_num" value="'+item.qna_num+'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="text" class="r-qna_content" value="'+item.qna_content +'" disabled="disabled"></li>';
							str += '<li class="listtd"><input type="button" class="a-q-rupdate" value="수정"></li>';
							str += '<li class="listtd"><input type="button" class="a-q-rdelete" value="삭제"></li>';
							str += '</ul>';
							$(".ad_q_relist").append(str);
						});
						page();
					},
					error:function(){
						alert("ajax통신 실패!!!");
					}
				});
			}
			replylist();
			

		});

	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>QNA 관리</h1>
			<h4>qna 문의 내역</h4>
			<ul class="ad-qna-title">
				<li>NO</li><!-- x -->
				<li>아이디</li><!-- x -->
				<li>문의유형</li><!-- 셀섹트 옵션 -->
				<li>주문번호</li><!--셀섹트 옵션 -->
				<li>제목</li><!-- 텍스트 -->
				<li>내용</li><!--에어리어  -->
				<li>작성날짜</li><!-- 텍스트 -->
				<li>파일</li><!-- 파일수정 -->
				<li>답변유무</li><!-- 셀옵 -->
				<li>공개설정</li><!-- 셀옵 -->
				<li>비밀번호</li><!-- 텍스트 -->
				<li>답글</li><!-- 텍스트 -->
				<li>삭제</li><!-- 텍스트 -->
			</ul>
			<form id="ad_qna_form" action="">
				<div class="ad_qnalist paginated"></div>
				
			</form>
			
			<h4>qna 답변</h4>
			<ul class="ad-q-r-title">
				<li>시퀀스</li><!-- x -->
				<li>번호</li><!-- x -->
				<li>내용</li><!-- 셀섹트 옵션 -->				
				<li>수정</li><!-- 텍스트 -->
				<li>삭제</li><!-- 텍스트 -->
			</ul>
			<form id="ad_q-r_form" action="">
				<div class="ad_q_relist paginated"></div>
				
			</form>
		
		<br><br><br><br><br><br><br><br><br>
		</div>
	

</div><!--지우지마세요 -->
</body>
</html>
