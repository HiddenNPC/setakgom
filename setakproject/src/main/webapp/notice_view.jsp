<%@page import="com.spring.community.NoticeVO"%>
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
<div class="title-text"><h2><a href="./noticeList.do">공지사항</a></h2></div>
<div class="notice">


<table class="nvt1">
	<tr height="50px" >
		<td width="20%" align="left">제  목 : <%=vo.getNOTICE_TITLE() %></td>
		<td width="20%" align="right" ><%=vo.getNOTICE_DATE() %>&nbsp;&nbsp;</td>
	</tr>	
	<tr>
		<td colspan="2" class="nvc"><div ><%=vo.getNOTICE_CONTENT()%></div></td>
	</tr>
</table>
<table class="nvt2">						
	<tr align="right" ><td colspan="5">	
		<button onclick="location.href='./noticeList.do'">목록</button></td>
	</tr>		
</table><br>

</div></div>
</section>
<div id="footer"></div> 
</body>
</html>

