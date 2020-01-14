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
<meta charset="UTF-8">
<title>세탁곰 Q&A</title>
<style type="text/css">	
	a { text-decoration:none; }
	a:link { color: #444; text-decoration: none;}
	a:visited { color: #444; text-decoration: none;}
		
   	.about-text p:before
  	 {
  	 	content:'';
      	display:block;     
      	width:3.8%;
      	height:6px;
      	background-color: #3498db;
      	margin-bottom:6px;
      	margin:auto;
          
  	 }	
	.about-text p
	{	
		letter-spacing:1px ;/* 글자간의 간격 조절 */
		font-size:2rem;
      	color:#444;
     	font-weight:900;
	  	text-align: center;
	  	word-spacing: normal;
	  	
  	}
	.table1
	{
		width:1000px;
		background-color:#3498db;
		align-content: center;
		margin: auto; /* align="center" */
		border: none;
		font-size: 15px;
		font-family:Tahoma;
		color: white;
	}
	.table1 tr
	{		
		vertical-align:middle;
		height: 30px;		
	}
	
	.table2
	{			
		width:1000px;
		margin: auto; 		
		font-size: 15px;
		font-family:Tahoma;
		color:#444;	
		border-style:solid;
   	 	border-width: 0.5px 1px;/*상하 ,좌우*/
	 		
	}
	
	.table3
	{			
		width:1000px;
		margin: auto; 		
		font-size: 15px;
		font-family:Tahoma;
		color:#444;	
		border:none;
	 	font-size: 15px; 	
	}
	
	
	.table4
	{			
		width:1000px;
		margin:auto; 				
		border:none;
	 		
	}
	.table4 button 
	{
		font-size: 14px;
		font-family:Tahoma;
		color:white;	
		background-color:#3498db; 
		WIDTH: 45pt; 
		HEIGHT: 25pt;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px; 
		margin-right:-4px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		border: none;
		outline: none;
		font-weight: bold;
	}
		
}
	
</style>
</head>
<body>
<section>
<div class="about-text"><p>Q&A</p></div>&nbsp;

<table class="table1">	
	<tr>
		<td width="7%">	<div align="center">번호</div></td>
		<td width="18%"><div align="center">문의유형</div></td>
		<td width="45%"><div align="center">제목</div></td>
		<td width="15%"><div align="center">작성자</div></td>
		<td width="15%"><div align="center">문의 날짜</div></td>
	</tr>
</table>

		
<%if (listcount > 0) {%>
<table class="table2" border="1" cellpadding="0" cellspacing="0" bordercolor="#e1e4e4">		
<%for(int i=0; i<qnalist.size(); i++){ QnaVO bl = (QnaVO)qnalist.get(i); %>
	<tr align="center" valign="middle" onmouseover="this.style.backgroundColor='#F8F8F8'" onmouseout="this.style.backgroundColor=''" >
		<td height="30px" width="7%"><%=((listcount - ((nowpage-1) * 10))- i) %></td>
		<td width="18%"> <div align="center"><%=bl.getQNA_TYPE() %>&nbsp;/&nbsp;<%=bl.getQNA_KIND()%></div></td>
		<td width="45%"> <div align="left"> &nbsp;&nbsp;&nbsp;<a href="./getDetail.co?QNA_NUM=<%=bl.getQNA_NUM() %>"><%=bl.getQNA_TITLE() %></a> </div></td>
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
	
<table class="table3">		
	<tr align=center height="30px">
		<td colspan=7 >
		<% if(nowpage<=1) { %>
			< &nbsp;&nbsp;&nbsp;
		<% } else { %>
		<a href="./qnaList.co?page=<%=nowpage-1 %>" > < </a>&nbsp;
		<% } %>
		<% for (int a=startpage; a<=endpage; a++) { 
			if(a==nowpage) { %>
			<%=a %>
			<% } else { %>
			<a href="./qnaList.co?page=<%=a %>" >&nbsp;&nbsp;<%=a %>&nbsp;&nbsp;</a>
			<% } %>
		<% } %>
		<% if (nowpage >= maxpage ) { %>
		&nbsp;&nbsp;&nbsp; >
		<% } else { %>
			<a href="./qnaList.co?page=<%=nowpage+1 %>" >></a>
		<% } %>
		</td>
	</tr>
</table>		






<table class="table4">		
<tr align="right">
<td colspan="5">
<button type="button" onclick="location.href='./qnaWrite.co?MEMBER_ID=<%=id %>'">글 작성 </button></td>
</tr> 		
</table>

</section>
</body>
</html>
