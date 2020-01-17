<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page session="false" %>
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
    //별점 구동
	$('.r_content span').click(function () {
		$(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        console.log($(this).attr("value"));
        return false;
    });
});
</script>	
</head>
<body>
<div id="header"></div>
<section id="review">
<div class="content">
<div class="title-text"><h2><a href="javascript:history.go(0)">리뷰 </a></h2></div>
<div class="review">

<form action="./reviewInsert.st" method="post" enctype="multipart/form-data" name="reviewform">
<div class="r_content">
	<p>사용자 평점</p> <!-- input 안에 넣어야 한다.  -->
	<span class="starR1 on" value="0.5">별1_왼쪽</span>
    <span class="starR2" value="1">별1_오른쪽</span>
    <span class="starR1" value="1.5">별2_왼쪽</span>
    <span class="starR2" value="2">별2_오른쪽</span>
    <span class="starR1" value="2.5">별3_왼쪽</span>
    <span class="starR2" value="3">별3_오른쪽</span>
    <span class="starR1" value="3.5">별4_왼쪽</span>
    <span class="starR2" value="4">별4_오른쪽</span>
    <span class="starR1" value="4.5">별5_왼쪽</span>
    <span class="starR2" value="5">별5_오른쪽</span>  
    <input type="hidden" >
</div>      
<table class="r_content">
	<tr><td colspan="7" class = "r_notice"> &nbsp; REVIEW | <p style="display:inline-block; color:#e1e4e4 ;"> 문의글은 무통보 삭제 됩니다</p></td></tr>
    <tr><td colspan="7"><textarea rows="10" cols="135" style="resize:none; padding-top:-10px;"></textarea></td></tr>
    <tr><td width="40px" ><input type="file"/></td>                          
        <td width="40px">
        	<select id="kind">
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
</form>
<!--인설트해서 DB에 넣어야 한다 . -->


<br><br>
     
<!--리뷰 작성 -->
<!--리뷰 리스트 (ajax) -->        
<div class="re_list"> 
<strong>리뷰XX개</strong>

</div>

</div></div>
</section>
<div id="footer"></div>    
</body>
</html>
