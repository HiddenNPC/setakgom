<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.setak.*"%>
<%
	int maxnum =((Integer)request.getAttribute("maxnum")).intValue();
	//ArrayList<ReviewVO> reviewlist = (ArrayList<ReviewVO>)request.getAttribute("reviewlist");
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title> 세탁곰 리뷰 </title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/review.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/4b95560b7c.js" crossorigin="anonymous"></script>
<script type="text/javascript"></script>
<script>

$(document).ready(function () {	
	//헤더, 푸터연결
	$("#header").load("header.jsp")
    $("#footer").load("footer.jsp")    
   
    //모달팝업 오픈
    $(".open").on('click', function(){
    	$("#re_layer").show();	
    	$(".dim").show();	
	});
    $(".close").on('click', function(){
    	$(this).parent().hide();	
    	$(".dim").hide();	
	});

    //별점 구동	
	$('.r_content a').click(function () {
	$(this).parent().children('a').removeClass('on');
    $(this).addClass('on').prevAll('a').addClass('on');      
    $('#Review_star').val($(this).attr("value"));
    return false;
	});	
    
	//top버튼 누르면 맨 위로 올라가게.
	$('span .page-number').on("click", function() {
		$("html, body").animate({
			scrollTop : 0
		}, 500);
	});
    
    
    
    
    
    
	// 조건 
	$('input[type="radio"]').on('click', function() {		
		$('#re_list').empty();
		var rec= {re_condition : $('input[name="radio_val"]:checked').val()}; 	    
		console.log(rec);
		$.ajax({
			url:'/setak/reviewCondition.do', 
			type:'POST',
			data:rec,
			dataType:"json", //리턴 데이터 타입
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {				
				$.each(data, function(index, item) {
					selectData()
				})
				page();
			},
			error: function() {
				alert("ajax통신 실패!!!");
		    }
	    });	
	});			
		
	//리뷰 리스트 뿌리기 		
	function selectData() {		
		$('#re_list').empty();
		$.ajax({
			url:'/setak/reviewList.do', 
			type:'POST', 
			dataType:"json", //리턴 데이터 타입
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {				
				$.each(data, function(index, item) {
					var re_list = '';					
					var i = item.review_star;
					var res =JSON.stringify(item.review_photo);			
					var idx= res.indexOf("/");
					var rphoto=res.substring(1,idx);
					var re_d =JSON.stringify(item.review_date);					
					var rdate= re_d.substr(1 ,16);
					console.log(rdate);				
					
					re_list += '<thead class="re_thead">';
					re_list += '<tr style="display:none;"><td><input type="hidden" name="review_num" value="'+item.review_num+'"></tr>';							
					re_list += '<tr><td height="20px" colspan="3">';   
					if(i%2 == 1){
						for(var abc = 0; abc<(i-1)/2; abc++){
							re_list += '<a id="rstar" class="starR3 on" value="'+item.review_star+'">';
							re_list += '<a id="rstar" class="starR4 on" value="'+item.review_star+'">';
						}
						re_list += '<a id="rstar" class="starR3 on" value="'+item.review_star+'">';
						re_list += '<a id="rstar" class="starR4" value="'+item.review_star+'">';
						for(var x = 0; x<((10-i)-1)/2; x++){  
							re_list += '<a id="rstar" class="starR3" value="'+item.review_star+'">';
							re_list += '<a id="rstar" class="starR4" value="'+item.review_star+'">';
						}
					}
					
					if(i%2 == 0){
						for(var abc = 0; abc<i/2; abc++){
							re_list += '<a id="rstar" class="starR3 on" value="'+item.review_star+'">';
							re_list += '<a id="rstar" class="starR4 on" value="'+item.review_star+'">';
						}
						for(var x = 0; x<(10-i)/2; x++){  
							re_list += '<a id="rstar" class="starR3" value="'+item.review_star+'">';
							re_list += '<a id="rstar" class="starR4" value="'+item.review_star+'">';
						}
					}
					
					re_list += '</td></tr>';		   																		
					re_list += '<tr><td name="member_id">'+ item.member_id +'</td><td>'+ item.review_kind +'</td><td>'+rdate+'</td></tr>';																														
					re_list += '<tr><td colspan="2"><textarea id="ret" readonly="readonly" >'+item.review_content+'</textarea></td>';																	
					re_list += '<td>'+rphoto+'</td></tr>';																	
					re_list += '<tr><td></td>';																	
					re_list += '<td style="margin: auto;"><input  class="#heart" id = "heart'+index+'" type="button" name="Review_like'+index+'" value="'+item.review_like+'"></td>';																	
					re_list += '<td><input id = "re_u'+index+'" type="button" name="Review_u'+index+'" value="수정">';																	
					re_list += '<input id = "re_d'+index+'" type="button" name="Review_d'+index+'" value="삭제"></td></tr>';																	
					re_list += '</thead>';
					$('#re_list').append(re_list);	
					
					
					/* $('#heart'+index+'').click(function () { */
					$(document).on('click', '#heart'+index+'', function () {
				        var that = $('#heart'+index+'');
				        var sendData = {'review_num' : item.review_num, 'review_like' : item.review_like};
				        console.log(sendData);				        
				        $.ajax({
				            url:'/setak/heart.do',
				            type:'POST',
				            data:sendData,
							dataType:"json", 
							contentType:'application/x-www-form-urlencoded; charset=utf-8',				            
							success: function(data){
				            	console.log(data+"값 잘 넘김  "); //review_like
				            	$('#heart'+index+'').attr(item.review_like);
				            	window.location.reload();
				            
				            },
				            error:function() {
								alert("ajax통신 실패!!!");
							}
							
				        });
				    });
						
				});
				page();									
			},
			error:function() {
				alert("ajax통신 실패!!!");
			}
						
		});
		
	}	

selectData();	
});
		
//검색
function searchCheck() {	
	//입력안한거 입력하도록 
	if (document.getElementById('keyword').value=="") {
		alert("검색어를 입력하세요.");
        document.getElementById('keyword').focus();
        return;
    }
   
	$('#re_list').empty();
    var key= { keyfield :$('#keyfield').val(), keyword: $('input#keyword').val() };  
	console.log(key);
	$.ajax({
		url:'/setak/reviewSearch.do', 
		type:'POST',
		data:key,
		dataType:"json", //리턴 데이터 타입
		contentType:'application/x-www-form-urlencoded; charset=utf-8',
		success:function(data) {				
			$.each(data, function sd(index, item) {
				var re_list = '';					
				var i = item.review_star;
				re_list += '<thead class="re_thead">';
				re_list += '<tr><td height="20px" colspan="3"></td></tr>';
				re_list += '<tr style="display:none;"><td><input type="hidden" name="review_num" value="'+item.review_num+'"></tr>';							
				re_list += '<tr><td height="20px" colspan="3">';   
				if(i%2 == 1){
					for(var abc = 0; abc<(i-1)/2; abc++){
						re_list += '<a id="rstar" class="starR3 on" value="'+item.review_star+'">';
						re_list += '<a id="rstar" class="starR4 on" value="'+item.review_star+'">';
					}
					re_list += '<a id="rstar" class="starR3 on" value="'+item.review_star+'">';
					re_list += '<a id="rstar" class="starR4" value="'+item.review_star+'">';
					for(var x = 0; x<((10-i)-1)/2; x++){  
						re_list += '<a id="rstar" class="starR3" value="'+item.review_star+'">';
						re_list += '<a id="rstar" class="starR4" value="'+item.review_star+'">';
					}
				}
				
				if(i%2 == 0){
					for(var abc = 0; abc<i/2; abc++){
						re_list += '<a id="rstar" class="starR3 on" value="'+item.review_star+'">';
						re_list += '<a id="rstar" class="starR4 on" value="'+item.review_star+'">';
					}
					for(var x = 0; x<(10-i)/2; x++){  
						re_list += '<a id="rstar" class="starR3" value="'+item.review_star+'">';
						re_list += '<a id="rstar" class="starR4" value="'+item.review_star+'">';
					}
				}
								
				re_list += '</td></tr>';		   																		
				re_list += '<tr><td name="member_id">'+ item.member_id +'</td><td>'+ item.review_kind +'</td><td>'+item.review_date+'</td></tr>';																	
				re_list += '<tr><td colspan="3">'+item.review_content+'</td></tr>';																	
				re_list += '<tr><td colspan="3">'+item.review_photo+'</td></tr>';																	
				re_list += '<tr><td colspan="3"><input id = "heart'+index+'" type="button" name="Review_like'+index+'" value="'+item.review_like+'"></td></tr>';																	
				re_list += '<tr><td height="20px" colspan="3"><hr></td></tr>';
				re_list += '<thead>';
				$('#re_list').append(re_list);	
			})
			page();
		},
		error: function() {
			alert("ajax통신 실패!!!");
	    }
    });	
}	

//만들어진 테이블에 페이지 처리
function page(){ 
	
	$('table.paginated').each(function() {
		var pagesu = 10;  //페이지 번호 갯수		
		var currentPage = 0;		
		var numPerPage = 10;  //목록의 수		
		var $table = $(this);    
		//length로 원래 리스트의 전체길이구함
		var numRows = $table.find('thead').length;//10
		console.log("numRows="+numRows);
		//Math.ceil를 이용하여 반올림
		var numPages = Math.ceil(numRows / numPerPage);
		console.log("numPages="+numPages);
		//리스트가 없으면 종료
		if (numPages==0) return;
		//pager라는 클래스의 div엘리먼트 작성
		var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
		var nowp = currentPage;
		var endp = nowp+10;
		//페이지를 클릭하면 다시 셋팅
		$table.bind('repaginate', function() {
		//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		$table.find('thead').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
				
		
		$("#remo").html("");		
		if (numPages > 1) { // 한페이지 이상이면
			if (currentPage < 5 && numPages-currentPage >= 5) { // 현재 5p 이하이면
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
		// [처음]
		$('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
			currentPage = 0;   
		    $table.trigger('repaginate');  
		    $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
		    $("html, body").animate({ scrollTop : 0 }, 500);
		}).appendTo($pager).addClass('clickable');
		// [이전]
		$('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
		    if(currentPage == 0) return; 
		    currentPage = currentPage-1;
		    $table.trigger('repaginate'); 
		    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		    $("html, body").animate({ scrollTop : 0 }, 500);
		}).appendTo($pager).addClass('clickable');
		// [1,2,3,4,5,6,7,8]
		for (var page = nowp ; page < endp; page++) {
			$('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
		    currentPage = event.data['newPage'];
		    $table.trigger('repaginate');
		    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		    $("html, body").animate({ scrollTop : 0 }, 500);
		    }).appendTo($pager).addClass('clickable');
		} 
		// [다음]
		$('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
		    if(currentPage == numPages-1) return;
		    currentPage = currentPage+1;
		    $table.trigger('repaginate'); 
		    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		    $("html, body").animate({ scrollTop : 0 }, 500);
		}).appendTo($pager).addClass('clickable');
		// [끝]
		$('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
		    currentPage = numPages-1;
		    $table.trigger('repaginate');
		    $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
		    $("html, #review").animate({ scrollTop : 0 }, 500);
		}).appendTo($pager).addClass('clickable');
		$($(".page-number")[2]).addClass('active');
		
	 });
	 $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
	 $pager.appendTo($table);
	 $table.trigger('repaginate');
  });

}

//입력받을곳 확인체크 + 값 컨트롤러로 전달
function rwchk(){	

	if (document.getElementById('Review_content').value=="") 
	{
		alert("리뷰의 내용을 작성하세요.(최대 300자)");
        document.getElementById('Review_content').focus();
        return false;
        
    }
	else if (document.getElementById('Review_star').value=="") 
	{
    	alert("별점을 눌러주세요");
        document.getElementById('Review_star').focus();
        return false;
    }
	else if (document.getElementById('Review_kind').value=="") 
	{
    	alert("이용하신 서비스를 선택해주세요");
        document.getElementById('Review_kind').focus();
        return false;
    }
	
	else{
		document.reviewform.submit();
	}
}
//취소
function rwcancel(){
	  var check = confirm("작성을 취소하시겠습니까");
	  /* if(check == true) else false */
	  if(check)
	  { 
		  location.href='./review.do';
	  }
	  else
	  { 
		  return false;
	  }
}




	
</script>	
</head>
<body>
<div id="header"></div>
<section id="review">
<div class="content">
<div class="title-text"><h2><a href="javascript:history.go(0)">리뷰 </a></h2></div>
<div class="review">

<!-- 레이아웃 팝업  -->
<a href="#" class="open">리뷰작성</a>
<div id="re_layer">
<form action="./reviewInsert.do" method="post" enctype="multipart/form-data" name="reviewform" onsubmit="return rwchk();">
<h2>세탁곰 리뷰 작성</h2>
<div class="r_content">
	<p style="margin-bottom:5px;">사용자 평점</p> 
	<a class="starR1 on" value="1" >별1_왼쪽</a>
    <a class="starR2" value="2">별1_오른쪽</a>
    <a class="starR1" value="3">별2_왼쪽</a>
    <a class="starR2" value="4">별2_오른쪽</a>
    <a class="starR1" value="5">별3_왼쪽</a>
    <a class="starR2" value="6">별3_오른쪽</a>
    <a class="starR1" value="7">별4_왼쪽</a>
    <a class="starR2" value="8">별4_오른쪽</a>
    <a class="starR1" value="9">별5_왼쪽</a>
    <a class="starR2" value="10">별5_오른쪽</a>    
    <small>&nbsp;별점 :<input type="text" id="Review_star" name="Review_star" value="" readonly="readonly"></small>   
   	<input type="hidden" id="Review_like" name="Review_like" value="0">  	
</div>      
<table class="r_content">
	<tr><td colspan="7" class = "r_notice">&nbsp;REVIEW|&nbsp;<p style="display:inline-block; font-size: 0.8rem; color:#e1e4e4 ;"> 문의글은 무통보 삭제 됩니다</p></td></tr>
    <tr><td colspan="7"><textarea id="Review_content" name="Review_content" maxlength="300" placeholder="리뷰를 작성해 주세요"></textarea></td></tr>
    <tr><td width="40px" ><input name="Review_photo" type="file"/></td>                          
        <td width="40px">
        	<select name="Review_kind" id="Review_kind">
           		<option value="">분류</option>
                <option value="세탁">세탁</option>
                <option value="세탁-수선">세탁-수선</option>
                <option value="세탁-보관">세탁-보관</option>
                <option value="수선">수선</option>
                <option value="보관">보관</option>
                <option value="정기구독">정기구독</option>
           </select></td>           
		<td align="right"  colspan="4">
			<input type="submit" name="submit" value="등록" >		
			<!-- <button onclick="javascript:reviewform.submit()">등록</button> -->
			<input id="cbtn" type="button" value="취소" onclick="rwcancel();"/></td> 	
	</tr></table>
</form>
<a class="close"><i class="fas fa-times" aria-hidden="true" style="color:#444; font-size:30px;"></i></a>
</div>
<div class="dim"></div><br><br>     

<!-- 글 분류 -->
<div class="re2">
<strong id="re2h">리뷰  <%=maxnum %>개</strong>
<div>
<input type="radio" id="radio1" name="radio_val" value="review_date" ><label for="radio1">등록일순</label>
<input type="radio" id="radio2" name="radio_val" value="review_like"><label for="radio2">좋아요순</label>
<input type="radio" id="radio3" name="radio_val" value="review_star"><label for="radio3">별점순</label>
 
<!-- 검색 -->
<select name="keyfield" id="keyfield" size="1">
	<option value="member_id"> 이름 </option>
	<option value="review_content"> 내용 </option>
</select>
<input id="keyword" type="text" size="15" name="keyword" value="${keyword}">
<input type="button" value="검색" onClick="searchCheck()">
</div>

<!--리뷰 리스트 (ajax) -->  
<form>
<table id="re_list" class="paginated"></table>

</form>
</div>

</div></div>
</section>
<div id="footer"></div>    
</body>

</html>

