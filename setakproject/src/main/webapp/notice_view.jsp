<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.setak.*" %>
<%
	NoticeVO vo = (NoticeVO)request.getAttribute("noticedata");
	int NOTICE_NUM = vo.getNOTICE_NUM();
	System.out.println("NOTICE_NUM="+NOTICE_NUM);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰 공지사항</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/notice.css"/>
<style type="text/css">		
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#header").load("./header.jsp")
    $("#footer").load("./footer.jsp")     
 });
</script>
</head>
<body>
<div id="header"></div>
<section id="notice">
<div class="content">
<div class="title-text"><h2> 공지사항</h2></div>
<div class="notice">

<table class="nvt0"></table><!-- 파란 줄  -->
<table class="nvt1" border="1" cellpadding="0" cellspacing="0">
	<tr height="40" >
		<td width="110px" align="center">제  목</td>	
		<td>&nbsp;&nbsp;<%=vo.getNOTICE_TITLE() %></td>
	</tr>
	<tr><td colspan="2"></td></tr>
	<tr><td align="center">내용</td>
		<td><table border=0 width=900 height=250>
				<tr><td valign=top>&nbsp;&nbsp;<%=vo.getNOTICE_CONTENT() %></td></tr>
			</table>
		</td>
	<tr><td colspan="5"><table class="nvt0"></table><!-- 파란 줄  --></td></tr>		
	<tr align="right" ><td colspan="5">
		<a href="./updateForm.st?NOTICE_NUM=<%=vo.getNOTICE_NUM() %>">[수정]</a>&nbsp;&nbsp;
		<a href="./noticeDelete.st?NOTICE_NUM=<%=vo.getNOTICE_NUM() %>">[삭제]</a>&nbsp;&nbsp;
		<a href="./noticeList.st">[목록]</a>&nbsp;&nbsp;</td>
	</tr>		
</table><br>


</div>
</div>
</section>
<div id="footer"></div> 
</body>
</html>