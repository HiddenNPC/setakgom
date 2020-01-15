<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.setak.*" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<%
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
%>
<!DOCTYPE html>
<html>
<head>
<title>세탁곰 Q&A</title>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js">

function modifyqna() {
	modifyform.submit();
}


</script>
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
	
	.table0
  	 {
  	 	content:'';
      	display:block;     
      	width:1000px;
      	height:5px;
      	background-color: #3498db;
      	margin-bottom:10px; 
      	margin:auto; 
          
  	 }	

	.table1
	{
		width:1000px;		
		align-content: center;
		margin: auto; /* align="center" */		
		font-size: 16px;
		font-family:Tahoma;
		margin-top:-1px;
		color:#444;
		
	}

	#td1
	{
		color:#3498db;
		font-weight: bold;
		font-size: 20px;
		border: none;
		padding-top:15px;
		
	}
	#td2
	{
		/* display: inline; */
		border: none;
		padding-top:18px ;
	}
	
	.table2
	{
		width:1000px;		
		align-content: center;
		margin: auto; /* align="center" */		
		font-size: 16px;
		font-family:Tahoma;
		margin-top:-1px;
		color:#444;
		
	}
	
  	.table3 /* 아래 파란줄 */
	{
		content:'';
      	display:block;     
      	width:1000px;
      	height:5px;
      	background-color: #3498db;
      	margin-bottom:10px; 
      	margin:auto; 
		
	}
	
  	.table5
	{
		width:1000px;		
		align-content: center;
		margin: auto; /* align="center" */
		border: none;
		font-size: 15px;
		font-family:Tahoma;
		margin-top: 10px;
		color:#444;
		text-align: right;
	}
	.table5 button 
	{
		font-weight: bold;
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
	}

	




</style>

</head>
<body>
<section>
<div class="about-text"><p><a href="./qnaList.co">Q&A</a></p> </div><br>
<table class="table0"></table><!-- 윗 파란 줄  -->

<form action="qnaUpdate.co" method="post" enctype="multipart/form-data" name="modifyform">
<input type="hidden" name="QNA_NUM" value="<%=vo.getQNA_NUM() %>">
<input type="hidden" name="MEMBER_ID" value="<%=vo.getMEMBER_ID()%>">
<table class="table1" border="1" bordercolor="#e1e4e4" cellpadding="0" cellspacing="0">
	<tr><td height="30px"><div align="center"> 문의 유형 </div></td>
		<td height="30px">
			<div>
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
		<td height="30px"><div align="center"> 구 분 </div></td>
		<td height="30px">
			<div>
			<input type="radio" name="QNA_KIND" value="세탁" checked="checked">세탁
			<input type="radio" name="QNA_KIND" value="세탁-수선">세탁-수선
			<input type="radio" name="QNA_KIND" value="세탁-보관">세탁-보관
			<input type="radio" name="QNA_KIND" value="수선">수선
			<input type="radio" name="QNA_KIND" value="보관">보관
			<input type="radio" name="QNA_KIND" value="정기구독">정기구독
			</div>
		</td>
	</tr>
	<tr>
		<td height="30px"><div align="center"> 제 목 </div></td>
		<td><input name="QNA_TITLE" type="text" size="50" maxlength="100" value="<%=vo.getQNA_TITLE()%>" /></td>
	</tr>
	<tr>
		<td><div align="center">내 용</div></td>
		<td><textarea name="QNA_CONTENT" cols="67" rows="15"><%=vo.getQNA_CONTENT() %></textarea></td>
	</tr>
	<tr>
		<td ><div align="center">파일 첨부&nbsp;</div></td>	
		<td id="btn"><input id="QNA_FILE" name="QNA_FILE" type="file" value="<%=vo.getQNA_FILE().split("/")[0]%>"/>
		<%if (!(vo.getQNA_FILE()==null)){ %>
		<%=vo.getQNA_FILE().split("/")[0]%>
		<%}else{ %>파일이 존재하지 않습니다 .<%}%></td>
	</tr>
	<tr>
		<td><div align="center" ></div></td>
		<td><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
			<input type="hidden" name="QNA_CHECK" value="답변완료"></div></td>
	</tr>
	
</table>

<table class="table3"></table><!-- 아래 파란 줄  -->
<br>						
<table class="table5">			
	<tr>
		<td>
		<button onclick="javascript:modifyqna()">수정</button>&nbsp;
		
		<button type="button" onclick="location.href='getDetail.co?QNA_NUM=<%=vo.getQNA_NUM() %>'">뒤로</button>&nbsp;&nbsp;	
		</td>
	</tr>
</table>			
			

	</form>
</section>	
</body>
</html>