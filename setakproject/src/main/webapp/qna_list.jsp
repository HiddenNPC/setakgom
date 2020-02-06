<%@page import="com.spring.community.QnaVO"%>
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
<script src="https://kit.fontawesome.com/4b95560b7c.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#header").load("header.jsp")
    $("#footer").load("footer.jsp")        
});
function q4ba_click(){
	alert("로그인 하신 후 글을 작성하실수 있습니다 .");
	 location.href="login.do";
	}

</script>
</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A</a></h2></div>
<div class="qna">

<table class="qlt1">	
	<tr>
		<th width="7%" height="40px"><div align="center">번호</div></th>
		<th width="15%"><div align="center">문의유형</div></th>
		<th width="45%"><div align="center">제목</div></th>
		<th width="15%"><div align="center">작성자</div></th>
		<th width="15%"><div align="center">작성일</div></th>
	</tr>
</table>

<table class="qlt2">
<%if (listcount > 0) { %>
	<%for(int i=0; i<qnalist.size(); i++) { QnaVO bl = (QnaVO)qnalist.get(i); System.out.println(bl.getQNA_SCR());%>
		<%if (session.getAttribute("member_id")==null) {%> <!-- 비회원이라면  -->
			<tr align="center" valign="middle" onmouseover="this.style.backgroundColor='#e6f8fc'" onmouseout="this.style.backgroundColor=''" >	
			<td height="40px" width="7%"><%=((listcount - ((nowpage-1) * 10))- i) %></td>
			<td width="15%"> <div align="center"><%=bl.getQNA_TYPE() %></div></td>
			<%if(bl.getQNA_SCR().equals("비공개")){%> <!-- 모든 비공개글은 볼수 없다. -->
				<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./qnaPass.do?QNA_NUM=<%=bl.getQNA_NUM() %>"><i class="fas fa-unlock-alt" style="color:#444;"></i>&nbsp;비공개 글입니다.</a></div></td>
			<%}else{%> <!-- 오직 공개글만 볼 수 있다. -->
				<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./qnaDetail.do?QNA_NUM=<%=bl.getQNA_NUM() %>"><%=bl.getQNA_TITLE() %></a></div></td>
			<%}%>
			<td width="15%"> <div align="center"><%=bl.getMEMBER_ID() %></div></td>
			<td width="15%"> <div align="center"><%=bl.getQNA_DATE() %></div> </td>		
		</tr>

		<%}else{%> <!-- 회원이라면  -->
			<tr align="center" valign="middle" onmouseover="this.style.backgroundColor='#e6f8fc'" onmouseout="this.style.backgroundColor=''" >	
			<td height="40px" width="7%"><%=((listcount - ((nowpage-1) * 10))- i) %></td>
			<td width="15%"> <div align="center"><%=bl.getQNA_TYPE() %></div></td>
			<!-- 다른 회원의 비공개글만 볼수 없다 . -->
			<%if(!session.getAttribute("member_id").equals(bl.getMEMBER_ID())){%> <!-- 회원인 나와 글의 작성자와 아이디가 다르면 , -->
				<%if(bl.getQNA_SCR().equals("비공개")){%>
					<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./qnaPass.do?QNA_NUM=<%=bl.getQNA_NUM() %>"><i class="fas fa-unlock-alt"></i>&nbsp;비공개 글입니다.</a></div></td>										
				<%}else{ %> <!-- 공개라면 , -->
					<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./qnaDetail.do?QNA_NUM=<%=bl.getQNA_NUM() %>"><%=bl.getQNA_TITLE() %></a></div></td>
				<%}%>
			<%}else{%>
				<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./qnaDetail.do?QNA_NUM=<%=bl.getQNA_NUM() %>"><%=bl.getQNA_TITLE() %></a></div></td>
			<%} %>
			<td width="15%"> <div align="left">&nbsp;<%=bl.getMEMBER_ID() %></div></td>
			<td width="15%"> <div align="center"><%=bl.getQNA_DATE() %></div> </td>		
		</tr>
		<%}%>
	<%}%> 
<%}else{%>
<tr><td height="150px" align="center">등록된 글이 없습니다.</td></tr>
<%}%>
</table> 

<table class="qlt3">		
	<tr align=center height="30px">
		<td colspan=7 >
		<% if(nowpage<=1) { %>
			&lt; &nbsp;&nbsp;&nbsp;
		<% } else { %>
		<a href="./qnaList.do?page=<%=nowpage-1 %>" > &lt; </a>&nbsp;
		<% } %>
		<% for (int a=startpage; a<=endpage; a++) { 
			if(a==nowpage) { %>
			<%=a %>
			<% } else { %>
				<a href="./qnaList.do?page=<%=a %>" >&nbsp;&nbsp;<%=a %>&nbsp;&nbsp;</a>
			<% } %>
		<% } %>
		<% if (nowpage >= maxpage ) { %>
		&nbsp;&nbsp;&nbsp; &gt;
		<% } else { %>
			<a href="./qnaList.do?page=<%=nowpage+1 %>" > &gt;</a>
		<% } %>
		</td>
	</tr>
</table>
		
<table class="qlt4">		
<tr align="right">
<%if(session.getAttribute("member_id")==null) { %>
<td colspan="5"><button name="q4ba" id="q4ba" class="qlt4_btn" onclick="q4ba_click();">비회원(글작성)</button></td>
<%}else{ %>
<td colspan="5"><button name="q4bb" id="q4bb" class="qlt4_btn" onclick="location.href='./qnaWrite.do'">글 작성 </button></td>
<%} %>

</tr> 		
</table>
</div></div>
</section>
<div id="footer"></div> 
</body>
</html>
