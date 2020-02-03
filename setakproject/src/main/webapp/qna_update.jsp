<%@page import="com.spring.community.QnaVO"%>
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
 
function updatechk(){	
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
    	alert("글의 비밀번호를 다시 설정해 주세요 (최대 10자)");
        document.getElementById('QNA_PASS').focus();
        return false;
    }
	else{
		document.modifyform.submit();
	}
}
function uCancel(){
	  var check = confirm("수정을 취소하시겠습니까");
	  /* if(check == true) else false */
	  if(check)
	  { 
		  //location.href='./qnaList.do';
		  location.href='./qnaDetail.do?QNA_NUM=<%=vo.getQNA_NUM() %>';
	  }
	  else
	  { 
		  return false;
	  }
}
/* 
$(document).ready(function(){ 
		
	var fileTarget = $('.filebox .upload-hidden');
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		}else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
	// 추출한 파일명 삽입 
	$(this).siblings('.upload-name').val(filename); 
	}); 
});
 */



 
 
 
 
 
</script>
</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A</a></h2></div>
<div class="qna">

<form action="qnaUpdate.do" method="post" enctype="multipart/form-data" name="modifyform" onsubmit="return updatechk();">
<input type="hidden" name="QNA_NUM" value="<%=vo.getQNA_NUM() %>">
<table class="qut1">
	<tr>
		<td height="30px"><div align="center">작성자</div></td>
		<td colspan="2"><div >&nbsp;<%=vo.getMEMBER_ID()%></div></td>
	</tr>
	<tr><td height="30px"><div align="center"> 문의 유형 </div></td>
		<td colspan="2">
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
		<td colspan="2">
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
		<td colspan="2"><input name="QNA_TITLE" type="text" size="50" maxlength="100" value="<%=vo.getQNA_TITLE()%>"></td>
	</tr>
	<tr><td><div align="center">내 용</div></td>
		<td colspan="2"><textarea name="QNA_CONTENT" cols="67" rows="15"><%=vo.getQNA_CONTENT() %></textarea></td>
	</tr>
	
	<tr>
		<td height="30px"><div align="center"> 파일첨부 </div></td>
		<td colspan="2">
		<div class="filebox">
		<input class="upload-name" value="<%if (!(vo.getQNA_FILE()==null)){ %><%=vo.getQNA_FILE().split("/")[0]%>
		<%}else{ %>파일이 존재하지 않습니다 .<%}%>" disabled="disabled">
		<label for="ex_file">업로드</label></div>
		<input type="file" id="ex_filename" class="upload-hidden">
		<input type="hidden" name="exist_file" value="<%=vo.getQNA_FILE()%>">	
		<!-- <input type="file" id="QNA_FILE" name="QNA_FILE" /> -->
		</td>
	</tr>
	
	
	<tr><td style="display:none;"><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
			<input type="hidden" name="QNA_CHECK" value="답변완료">
		</div></td>
	</tr>	
	<tr > 
		<td height="30px"><div align="center">비밀번호</div></td>
		<td ><input id="QNA_PASS" name="QNA_PASS" type="password" maxlength="10" value="<%=vo.getQNA_PASS() %>"/></td>							
		<td><span>공개여부&nbsp;</span>
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="공개"/>공개				
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="비공개" checked="checked"/>비공개</td>				
	</tr>
</table><br>						
<table class="qut2">			
	<tr><td>
		<input type="submit" name="submit" value="등록" >			
		<input type="button" name="cancel" value="취소" onclick="uCancel();">					
		<%-- 
		<button onclick="javascript:modifyqna()">수정</button>&nbsp;		
		<button type="button" onclick="location.href='qnaDetail.do?QNA_NUM=<%=vo.getQNA_NUM() %>'">뒤로</button>&nbsp;&nbsp;	
		 --%>
		 </td>
	</tr>
</table>			
</form>
</div></div>
</section>
<div id="footer"></div> 
</body>
</html>
