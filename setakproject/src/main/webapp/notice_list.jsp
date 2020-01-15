<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.setak.*"%>

<%
	ArrayList<NoticeVO> noticeList = (ArrayList<NoticeVO>)request.getAttribute("noticelist");	
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int limit = ((Integer)request.getAttribute("limit")).intValue();
	
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

<table class="nlt1" align="center" border="0" cellpadding="0" cellspacing="0">	
	<tr align="center" valign="middle"  height="40">
		<td width="10%">
			<div align="center">번 호</div>
		</td>
		<td  width="50%">
			<div align="center">제 목</div>
		</td>
		<td  width="16%">
			<div align="center">날 짜</div>
		</td>
	</tr>
</table>
		
<%
	if (listcount > 0) {
%>
	<%
		for (int i=0; i<noticeList.size(); i++) {
			NoticeVO bl = (NoticeVO)noticeList.get(i);
	%>
<table class="nlt2" align="center"  cellpadding="0" cellspacing="0"  >		
	<tr align="center" valign="middle" onmouseover="this.style.backgroundColor='#F8F8F8'" onmouseout="this.style.backgroundColor=''" >
		<td height="35"  width="10%"><%=((listcount - ((nowpage-1) * 10))- i) %></td>
		<td width="50%"> 
			<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="./getDetail.st?NOTICE_NUM=<%=bl.getNOTICE_NUM() %>">
			<%=bl.getNOTICE_TITLE() %></a></div>
		</td>
		<td  width="16%">
			<div align="center"><%=bl.getNOTICE_DATE() %></div>
		</td>
	</tr>

</table>

		
	<% } %>
&nbsp;
<table class="nlt3" align="center">	
	<tr align=center height=35  >
		<td colspan=7 >
		<% if(nowpage<=1) { %>
			< &nbsp;&nbsp;&nbsp;
			<% } else { %>
			<a href="./noticeList.st?page=<%=nowpage-1 %>" > < </a>&nbsp;
			<% } %>
			
			<% for (int a=startpage; a<=endpage; a++) { 
					if(a==nowpage) { %>
						<%=a %>
						<% } else { %>
						<a href="./noticeList.st?page=<%=a %>" >&nbsp;&nbsp;<%=a %>&nbsp;&nbsp;</a>
				<% } %>
			<% } %>
			&nbsp;
			<% if (nowpage >= maxpage ) { %>
					&nbsp;&nbsp;&nbsp; >
				<% } else { %>
					<a href="./noticeList.st?page=<%=nowpage+1 %>" > > </a>
			<% } %>
			</td>
		</tr>
</table>		
	<%
	} else {
	%>
	
<table class="nlt2" border="1" cellpadding="0" cellspacing="0" align="center" >	
		<tr align="center" valign="middle">
			<td colspan="4"> 공 지 사 항  </td>
			<td align=right>
				<font size=2>등록된 글이 없습니다.</font>
			</td>
		</tr>
		<% } %>
</table>
<br>
<!-- 
<table border="0" cellpadding="0" cellspacing="0" align="right">		
	<tr><td colspan="5"><a href="./noticeWrite.st" >[글쓰기]</a></td></tr> 		
</table>
 -->
</div>
</div>
</section>
<div id="footer"></div> 
</body>
</html>