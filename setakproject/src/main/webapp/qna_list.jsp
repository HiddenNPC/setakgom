<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.setak.*"%>

<%
	ArrayList<QnaVO> qnalist = (ArrayList<QnaVO>)request.getAttribute("qnalist");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int limit = ((Integer)request.getAttribute("limit")).intValue();
	//String id = (String)session.getAttribute("MEMBER_ID");	
	//System.out.println("id=" + id);
	 Object id = qnalist.get(0).getMEMBER_ID();
	 System.out.println("id=" + id);	
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
<div class="title-text"><h2>Q&A</h2></div>
<div class="qna">


<table class="qlt1">	
	<tr>
		<td width="7%">	<div align="center">번호</div></td>
		<td width="18%"><div align="center">문의유형</div></td>
		<td width="45%"><div align="center">제목</div></td>
		<td width="15%"><div align="center">작성자</div></td>
		<td width="15%"><div align="center">문의 날짜</div></td>
	</tr>
</table>

		
<%if (listcount > 0) {%>
<table class="qlt2" border="1" cellpadding="0" cellspacing="0" bordercolor="#e1e4e4">		
<%for(int i=0; i<qnalist.size(); i++){ QnaVO bl = (QnaVO)qnalist.get(i); %>
	<tr align="center" valign="middle" onmouseover="this.style.backgroundColor='#F8F8F8'" onmouseout="this.style.backgroundColor=''" >
		<td height="30px" width="7%"><%=((listcount - ((nowpage-1) * 10))- i) %></td>
		<td width="18%"> <div align="center"><%=bl.getQNA_TYPE() %>&nbsp;/&nbsp;<%=bl.getQNA_KIND()%></div></td>
		<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./qnaDetail.do?QNA_NUM=<%=bl.getQNA_NUM() %>"><%=bl.getQNA_TITLE() %></a> </div></td>
		<td width="15%"> <div align="center"><%=bl.getMEMBER_ID() %></div></td>
		<td width="15%"> <div align="center"><%=bl.getQNA_DATE() %></div> </td>		
	</tr>
<%}%>
<%} 
else 
{%>
	<tr align="center" valign="middle">
		<td colspan="4"> Q&A </td>
		<td align=right>등록된 글이 없습니다.</td>
	</tr>
<% } %>
</table> 
	
<table class="qlt3">		
	<tr align=center height="30px">
		<td colspan=7 >
		<% if(nowpage<=1) { %>
			< &nbsp;&nbsp;&nbsp;
		<% } else { %>
		<a href="./qnaList.do?page=<%=nowpage-1 %>" > < </a>&nbsp;
		<% } %>
		<% for (int a=startpage; a<=endpage; a++) { 
			if(a==nowpage) { %>
			<%=a %>
			<% } else { %>
			<a href="./qnaList.do?page=<%=a %>" >&nbsp;&nbsp;<%=a %>&nbsp;&nbsp;</a>
			<% } %>
		<% } %>
		<% if (nowpage >= maxpage ) { %>
		&nbsp;&nbsp;&nbsp; >
		<% } else { %>
			<a href="./qnaList.do?page=<%=nowpage+1 %>" >></a>
		<% } %>
		</td>
	</tr>
</table>		
<table class="qlt4">		
<tr align="right">
<td colspan="5">
<button class="qlt4_btn" type="button" onclick="location.href='./qnaWrite.do?MEMBER_ID=<%=id %>'">글 작성 </button></td>
</tr> 		
</table>
</div></div>
</section>
<div id="footer"></div> 
</body>
</html>
