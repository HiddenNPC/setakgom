<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.spring.setak.*"%>  
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
 
function writechk(){	
	//입력안한거 입력하도록 
	if (document.getElementById('QNA_TITLE').value=="") 
	{
		alert("제목을 입력하세요.");
        document.getElementById('QNA_TITLE').focus();
        return false;
        
    }
	else if (document.getElementById('QNA_CONTENT').value=="") 
	{
    	alert("내용을 입력하세요.(최대 500자)");
        document.getElementById('QNA_CONTENT').focus();
        return false;
    }
	else if(document.getElementById('QNA_PASS').value=="") 
	{
    	alert("작성하신 글의 비밀번호를 설정해 주세요 (최대 10자)");
        document.getElementById('QNA_PASS').focus();
        return false;
    }
	else{
		document.qnaform.submit();
	}
}
function wcancel(){
	  var check = confirm("작성을 취소하시겠습니까");
	  /* if(check == true) else false */
	  if(check)
	  { 
		  location.href='./qnaList.do';
	  }
	  else
	  { 
		  return false;
	  }
}

//javascript:qnaform.submit(),,document.passform.submit();
 
</script>
</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A</a></h2></div>
<div class="qna">

<form action="./qnaInsert.do" method="post" enctype="multipart/form-data" name="qnaform" onsubmit="return writechk();">
<table class="qwt1">				
	<tr>
		<td height="25px"><div align="center">작성자</div></td>
		<td colspan="2"><input value="<%=session.getAttribute("member_id")%>" type="hidden" name="MEMBER_ID" >&nbsp;<%=session.getAttribute("member_id")%></td>
	</tr>
	<tr>
		<td height="25px"><div align="center">문의유형</div></td>
		<td colspan="2"><div>
			<input type="radio" name="QNA_TYPE" value="취소" checked="checked">취소
			<input type="radio" name="QNA_TYPE" value="배송관련">배송관련
			<input type="radio" name="QNA_TYPE" value="적립금">적립금
			<input type="radio" name="QNA_TYPE" value="서비스관련">서비스관련
			<input type="radio" name="QNA_TYPE" value="회원정보">회원정보
			<input type="radio" name="QNA_TYPE" value="기타">기타</div>
			
		</td>
	</tr>
	<tr>
		<td height="25px"><div align="center">구분</div></td>
		<td colspan="2"><div>
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
		<td colspan="2"><input id="QNA_TITLE" name="QNA_TITLE" type="text" size="50" maxlength="50"/></td>
	</tr>
	<tr>
		<td height="25px"><div align="center">내용</div></td>
		<td colspan="2"><textarea id="QNA_CONTENT" name="QNA_CONTENT" cols="80" rows="15" maxlength="500" style="resize:none" ></textarea></td>
	</tr>
	<tr>
		<td height="25px"><div align="center">파일첨부</div></td>
		<td colspan="2"><input id="QNA_FILE" name="QNA_FILE" type="file"/></td>				
	</tr>
	<tr > 
		<td height="25px"><div align="center">비밀번호</div></td>
		<td><input id="QNA_PASS" name="QNA_PASS" type="password" maxlength="10"/></td>							
		
		<td><span>공개여부&nbsp;</span>
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="공개"/>공개				
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="비공개" checked="checked"/>비공개</td>					
	</tr>
	<tr class="qwt1h">
		<td colspan="2"><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
			<!-- <input type="hidden" name="QNA_CHECK" value="답변완료"> -->					
			</div>
		</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<input type="submit" name="submit" value="등록" >			
			<input type="button" name="cancel" value="취소" onclick="wcancel();">			
		</td>
	</tr>			
</table>
</form>
</div></div>
</section>
<div id="footer"></div> 		
</body>
</html>