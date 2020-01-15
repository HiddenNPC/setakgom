<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.setak.*" %>
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
<div class="title-text"><h2><a href="./qnaList.co">Q&A</a></h2></div>
<div class="qna">

<form action="qnaUpdate.co" method="post" enctype="multipart/form-data" name="modifyform">
<input type="hidden" name="QNA_NUM" value="<%=vo.getQNA_NUM() %>">
<input type="hidden" name="MEMBER_ID" value="<%=vo.getMEMBER_ID()%>">
<table class="qut1" border="1" bordercolor="#e1e4e4" cellpadding="0" cellspacing="0">
	<tr><td height="30px"><div align="center"> 문의 유형 </div></td>
		<td height="30px">
			<div>
			<input type="radio" name="QNA_TYPE" value="취소" checked="checked">취소
			<input type="radio" name="QNA_TYPE" value="배송관련">배송관련
			<input type="radio" name="QNA_TYPE" value="적립금">적립금
			<input type="radio" name="QNA_TYPE" value="서비스관련">서비스관련
			<input type="radio" name="QNA_TYPE" value="회원정보">회원정보
			<input type="radio" name="QNA_TYPE" value="기타">기타
			</div></td>
	</tr>
	<tr><td height="30px"><div align="center"> 구 분 </div></td>
		<td height="30px">
			<div>
			<input type="radio" name="QNA_KIND" value="세탁" checked="checked">세탁
			<input type="radio" name="QNA_KIND" value="세탁-수선">세탁-수선
			<input type="radio" name="QNA_KIND" value="세탁-보관">세탁-보관
			<input type="radio" name="QNA_KIND" value="수선">수선
			<input type="radio" name="QNA_KIND" value="보관">보관
			<input type="radio" name="QNA_KIND" value="정기구독">정기구독
			</div></td>
	</tr>
	<tr><td height="30px"><div align="center"> 제 목 </div></td>
		<td><input name="QNA_TITLE" type="text" size="50" maxlength="100" value="<%=vo.getQNA_TITLE()%>"></td>
	</tr>
	<tr><td><div align="center">내 용</div></td>
		<td><textarea name="QNA_CONTENT" cols="67" rows="15"><%=vo.getQNA_CONTENT() %></textarea></td>
	</tr>
	<tr><td><div align="center">파일 첨부&nbsp;</div></td>	
		<td><input type="hidden" name="exist_file" value="<%=vo.getQNA_FILE()%>" style="display:none;">
			<input id="QNA_FILE" name="QNA_FILE" type="file">
			<%if(!(vo.getQNA_FILE()==null)){%><%=vo.getQNA_FILE().split("/")[0]%>
			<%}else{%>파일이 존재하지 않습니다<%}%></td>
	</tr>
	<tr><td style="display:none;"><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
			<input type="hidden" name="QNA_CHECK" value="답변완료">
		</div></td>
	</tr>	
</table><br>						
<table class="qut2">			
	<tr><td>
		<button onclick="javascript:modifyqna()">수정</button>&nbsp;		
		<button type="button" onclick="location.href='getDetail.co?QNA_NUM=<%=vo.getQNA_NUM() %>'">뒤로</button>&nbsp;&nbsp;	
		</td>
	</tr>
</table>			
</form>
</div></div>
</section>
<div id="footer"></div> 
</body>
</html>
