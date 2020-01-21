<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.spring.setak.*"%>  
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<%	
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" >
<title>세탁곰 Q&A</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/qna.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#header").load("header.jsp")
    $("#footer").load("footer.jsp")     
 });
</script>
</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A</a></h2></div>
<div class="qna">

<form action="./qnaInsert.do" method="post" enctype="multipart/form-data" name="qnaform">
<table class="qwt1">				
	<tr>
		<td height="25px"><div align="center"> 글 쓴 이 </div></td>
		<td><input value="<%=vo.getMEMBER_ID()%>" type="hidden" name="MEMBER_ID" >&nbsp;<%=vo.getMEMBER_ID()%></td>
	</tr>
	<tr>
		<td height="25px"><div align="center">문의 유형</div></td>
		<td><div>
			<input type="radio" name="QNA_TYPE" value="취소" checked="checked">취소
			<input type="radio" name="QNA_TYPE" value="배송관련">배송관련
			<input type="radio" name="QNA_TYPE" value="적립금">적립금
			<input type="radio" name="QNA_TYPE" value="서비스관련">서비스관련
			<input type="radio" name="QNA_TYPE" value="회원정보">회원정보
			<input type="radio" name="QNA_TYPE" value="기타">기타
			</div>
		</td>
	</tr>
	<tr>
		<td height="25px"><div align="center">구분</div></td>
		<td><div>
			<input type="radio" name="QNA_KIND" value="세탁" checked="checked" >세탁
			<input type="radio" name="QNA_KIND" value="세탁-수선">세탁-수선
			<input type="radio" name="QNA_KIND" value="세탁-보관">세탁-보관
			<input type="radio" name="QNA_KIND" value="수선">수선
			<input type="radio" name="QNA_KIND" value="보관">보관
			<input type="radio" name="QNA_KIND" value="정기구독">정기구독
			</div>
		</td>
	</tr>
	<tr>
		<td height="25px"><div align="center">제목</div></td>
		<td><input name="QNA_TITLE" type="text" size="50" maxlength="100"/></td>
	</tr>
	<tr>
		<td height="25px"><div align="center">내용</div></td>
		<td><textarea name="QNA_CONTENT" cols="80" rows="15" style="resize:none" ></textarea></td>
	</tr>
	<tr>
		<td height="25px"><div align="center">파일 첨부</div></td>
		<td><input id="QNA_FILE" name="QNA_FILE" type="file" /></td>				
	</tr>
	<tr class="qwt1h">
		<td colspan="2"><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
			<!-- <input type="hidden" name="QNA_CHECK" value="답변완료"> -->					
			</div>
		</td>
	</tr>
	<!-- <tr><td colspan="2"></td></tr> -->
	<tr align="center" valign="middle">
		<td colspan="5">
			<button onclick="javascript:qnaform.submit()" >등록</button>
			<button onclick="javascript:history.go(-1)">뒤로</button>
		</td>
	</tr>			
</table>
</form>
</div></div>
</section>
<div id="footer"></div> 		
</body>
</html>