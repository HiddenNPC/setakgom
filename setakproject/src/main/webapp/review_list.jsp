<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.setak.*"%>


<%
	


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
<script type="text/javascript"></script>
<script>
$(document).ready(function () {
	//헤더, 푸터연결
	$("#header").load("header.jsp")
    $("#footer").load("footer.jsp") 
    
	//리뷰 리스트 뿌리기 		
	function selectData() {		
		$('#re_list').empty();
		$.ajax({
			url:'/setak/reviewList.do', 
			type:'POST', 
			dataType:"json", //서버에서 보내줄 데이터 타입
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {				
				$.each(data, function(index, item) {
					var re_list = '';
					re_list += '<tr><td height="20px" colspan="3"></td></tr>'
					re_list += '<tr style="display:none;"><td><input type="hidden" name="review_num" value="'+item.review_num+'"></tr>';							
					re_list += '<tr><td colspan="3">'+item.review_star+'</td></tr>';
					re_list += '<tr><td>'+ item.member_id +'&nbsp;'+ item.review_kind +item.review_date+'</td></tr>';																		
					re_list += '<tr><td colspan="3">'+item.review_content+'</td></tr>';																	
					re_list += '<tr><td colspan="3">'+item.review_like+'</td></tr>';																	
					re_list += '<tr><td height="20px" colspan="3"></td></tr>'
					console.log(item.review_date);
					$('#re_list').append(re_list);
				});
			},
			error:function() {
				alert("ajax통신 실패!!!");
			}
		});
	}	
	//별점 구동
	$('.r_content a').click(function () {
		$(this).parent().children('a').removeClass('on');
		console.log($(this));
        $(this).addClass('on').prevAll('a').addClass('on');      
        $('#Review_star').val($(this).attr("value"));
        //console.log($(this).attr("value"));
        return false;
    });	
	
selectData();		
});

</script>	
</head>
<body>
<div id="header"></div>
<section id="review">
<div class="content">
<div class="title-text"><h2><a href="javascript:history.go(0)">리뷰 </a></h2></div>
<div class="review">

<form action="./reviewInsert.do" method="post" enctype="multipart/form-data" name="reviewform">
<div class="r_content">
	<p>사용자 평점</p> <!-- input 안에 넣어야 한다.  -->
	<a class="starR1 on" value="0.5" >별1_왼쪽</a>
    <a class="starR2" value="1">별1_오른쪽</a>
    <a class="starR1" value="1.5">별2_왼쪽</a>
    <a class="starR2" value="2">별2_오른쪽</a>
    <a class="starR1" value="2.5">별3_왼쪽</a>
    <a class="starR2" value="3">별3_오른쪽</a>
    <a class="starR1" value="3.5">별4_왼쪽</a>
    <a class="starR2" value="4">별4_오른쪽</a>
    <a class="starR1" value="4.5">별5_왼쪽</a>
    <a class="starR2" value="5">별5_오른쪽</a>  
   	<input type="number" id="Review_star" name="Review_star">
   	<input type="text" id="Review_like" name="Review_like" value="0">
   	
   	
   	
</div>      
<table class="r_content">
	<tr><td colspan="7" class = "r_notice"> &nbsp; REVIEW | <p style="display:inline-block; color:#e1e4e4 ;"> 문의글은 무통보 삭제 됩니다</p></td></tr>
    <tr><td colspan="7"><textarea name="Review_content" rows="10" cols="135" style="resize:none; padding-top:-10px;"></textarea></td></tr>
    <tr><td width="40px" ><input name="Review_photo" type="file"/></td>                          
        <td width="40px">
        	<select name="Review_kind">
           		<option value="">분류</option>
                <option value="세탁">세탁</option>
                <option value="세탁-수선">세탁-수선</option>
                <option value="세탁-보관">세탁-보관</option>
                <option value="수선">수선</option>
                <option value="보관">보관</option>
                <option value="정기구독">정기구독</option>
           </select></td>
		<td align="right"  colspan="5">
			<button onclick="javascript:reviewform.submit()">등록</button>
			<input id="cbtn" type="button" value="취소" onclick="javascript:location.reload()"/></td> 	
	</tr></table>
</form><br><br>     
<!--리뷰 리스트 (ajax) -->        

<div class="re2">
<strong>리뷰   X개</strong>
<table id="re_list" class="re2_t1">
</table>


</div>



</div></div>
</section>
<div id="footer"></div>    
</body>


<!-- 

re_list += '<tr><td>'+item.member_id+'</td>';							
re_list += 	   '<td>'+item.review_kind+'</td>';																	
re_list += 	   '<td>'+item.review_date+'</td></tr>';	
 -->


</html>













