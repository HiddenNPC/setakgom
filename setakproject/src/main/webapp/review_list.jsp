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
<link rel="stylesheet" type="text/css" href="./css/review_list.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"></script>
<script>
$(document).ready(function () {
	//헤더, 푸터연결
	$("#header").load("./header.jsp")
    $("#footer").load("./footer.jsp") 
    //별점 구동
	$('.starRev span').click(function () {
		$(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });
});
</script>	
</head>

<body>
<div id="header"></div>
<section>
<div class="content">

<div class="about-text"><p> 리뷰 </p></div><br>
<div class="r_c">
	<div><p> 사용자 평점</p></div>
    <div class="starRev">
		<span class="starR1 on">별1_왼쪽</span>
        <span class="starR2">별1_오른쪽</span>
        <span class="starR1">별2_왼쪽</span>
        <span class="starR2">별2_오른쪽</span>
        <span class="starR1">별3_왼쪽</span>
        <span class="starR2">별3_오른쪽</span>
        <span class="starR1">별4_왼쪽</span>
        <span class="starR2">별4_오른쪽</span>
        <span class="starR1">별5_왼쪽</span>
        <span class="starR2">별5_오른쪽</span>
    </div><br><br>    
    
    <div class="r_content">   
    <table border="1"cellpadding="0" cellspacing="0" bordercolor="#e1e4e4" width="800px">
    	<tr><td class="p" colspan="7"> REVIEW | 문의글은 무통보 삭제 됩니다</td></tr>
        <tr><td colspan="7"><textarea rows="8" cols="100" style="resize:none"></textarea></td> </tr>
        <tr>
        	<td width="40px" ><input id="r_file" type="file"/></td>                       
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
			<td align="right"><button class="re_btn">등록하기  </button></td>
         </tr>
     </table>
     </div><br><br>
     
<!--리뷰 작성 -->

<!--리뷰 리스트 (ajax) -->        
<div class="re_list"> 
<strong>리뷰XX개</strong>
<p>(이 부분 Ajax 로 뿌림) </p>
</div>

</div>
</div>
</section>
<div id="footer"></div>    
</body>
</html>
