<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.spring.setak.*" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<%
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
	ArrayList<QnaVO> onlist = (ArrayList<QnaVO>)request.getAttribute("onList");
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

<!--sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">
$(document).ready(function(){
    $("#header").load("header.jsp")
    $("#footer").load("footer.jsp") 
    
	
	var filecontent;
	var filename="";
	
	$("#QNA_FILE").change(function(){
		filecontent = $(this)[0].files[0];
		filename = Date.now() + "_" + $(this)[0].files[0].name;
	});
	
	$("#modifyform").on("submit", function() {
		if(updatechk()){
			console.log("1");
			if(filecontent != null){
				console.log("2");
				var data = new FormData();
				data.append("purpose", "qna");
				data.append("files", filecontent);
				data.append("filename", filename);
				
				$("#QNA_FILE2").val(filename);
				console.log($("#QNA_FILE2").val());
				
				$.ajax({
	                type: "POST",
	                enctype: 'multipart/form-data',
	                url: "/setak/testImage.do",
	                data: data,
	                processData: false,
	                contentType: false,
	                cache: false,
	                dataType: 'json',
	
	                success: function (data) {
	                	
	                },
	                error: function (e) {
	
					}
	                
				});
			}
			
		}else{
			event.preventDefault();
		}
	});

	
	
});


function updatechk(){	
	//입력안한거 입력하도록 
	if (document.getElementById('QNA_TITLE').value =="") 
	{
		Swal.fire("","제목을 입력하세요.","info");
        document.getElementById('QNA_TITLE').focus();
        return false;
        
    }
	else if (document.getElementById('QNA_CONTENT').value=="") 
	{

		Swal.fire("","내용을 입력하세요.(최대 500자)","info");
        document.getElementById('QNA_CONTENT').focus();
        return false;
    }
	else if(document.getElementById('QNA_PASS').value=="") 
	{
		Swal.fire("","글의 비밀번호를 다시 설정해 주세요 (최대 10자)","info");
        document.getElementById('QNA_PASS').focus();
        return false;
    }
	
	return true;
	
}

function uCancel(){
	  var check = confirm("수정을 취소하시겠습니까");
	  /* if(check == true) else false */
	  if(check)
	  { 
		 
		  location.href='./qnaDetail.do?QNA_NUM=<%=vo.getQna_num() %>';
	  }
	  else
	  { 
		  return false;
	  }
}

/*
$(document).ready(function() { 	
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

<form action="qnaUpdate.do" method="post" enctype="multipart/form-data" name="modifyform" id="modifyform">
<input type="hidden" name="QNA_NUM" value="<%=vo.getQna_num() %>">
<table class="qut1">
	<tr>
		<td height="30px"><div align="center">작성자</div></td>
		<td colspan="2"><div>&nbsp;<%=vo.getMember_id()%></div></td>
	</tr>
	<tr><td height="30px"><div align="center">문의유형</div></td>
		<td colspan="2">
			<div>
			<input type="radio" id="type1" name="QNA_TYPE" value="취소" checked="checked"><label for="type1">취소</label>
			<input type="radio" id="type2" name="QNA_TYPE" value="배송"><label for="type2">배송</label>
			<input type="radio" id="type3" name="QNA_TYPE" value="적립금"><label for="type3">적립금</label>
			<input type="radio" id="type4" name="QNA_TYPE" value="서비스"><label for="type4">서비스</label>
			<input type="radio" id="type5" name="QNA_TYPE" value="회원정보"><label for="type5">회원정보</label>
			<input type="radio" id="type6" name="QNA_TYPE" value="기타"><label for="type6">기타</label>
			</div></td>
	</tr>
	<tr><td height="30px"><div align="center">주문번호</div></td>
		<td colspan="2"><div>
		<select class="qwon" name="ORDER_NUM">		
			<option value="<%=vo.getOrder_num()%>"selected><%=vo.getOrder_num()%></option>
			<option value="선택안함">선택안함</option>
			<%for(int i=0; i<onlist.size(); i++){ QnaVO ol = (QnaVO)onlist.get(i); %>
			<% if(vo.getOrder_num() != ol.getOrder_num()){ %>
   	 		<option value="<%=ol.getOrder_num()%>"><%=ol.getOrder_num()%></option>    		
    		<%}%><%}%>
		</select></div>
		</td>
	</tr>
	<tr><td height="30px"><div align="center">제 목</div></td>
		<td colspan="2"><input name="QNA_TITLE" id="QNA_TITLE" type="text" size="50" maxlength="100" value="<%=vo.getQna_title()%>"></td>
	</tr>
	<tr><td><div align="center">내 용</div></td>
		<td colspan="1"><textarea name="QNA_CONTENT" id="QNA_CONTENT"cols="80" rows="15" maxlength="500"><%=vo.getQna_content() %></textarea></td>
		<td id="qutd1"><div class="thumbnail-wrapper">
			  <div class="thumbnail">			   
			    	<%if (!vo.getQna_file().split("_")[0].equals("등록한 파일이 없습니다.")){ %>
			      	<img class="thumbnail-img" src="https://kr.object.ncloudstorage.com/airbubble/setakgom/qna/<%=vo.getQna_file()%>"/>
			      	<%}else{ %>
			      	<img class="thumbnail-img" src="./images/No_image_available.png"/>
			      	<%} %>			   
			  </div>
			</div>
		</td>
	</tr>	
	<tr>
		<td height="30px"><div align="center">파일첨부</div></td>		
		<td colspan="2">
			<input type="hidden" name="exist_file" value="<%=vo.getQna_file()%>">
			<input id="QNA_FILE3" value="<%if(!(vo.getQna_file()==null)){ %><%int i= vo.getQna_file().indexOf("_");%><%=vo.getQna_file().substring(i+1).trim()%><%}else{ %>파일이 존재하지 않습니다 .<%}%>" disabled="disabled">
			<input type="file" id="QNA_FILE" />
			<input type="hidden" id="QNA_FILE2" name="QNA_FILE" >		
		</td>
			
	
	</tr>		
	<tr><td style="display:none;"><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">
			<input type="hidden" name="QNA_CHECK" value="답변완료">
		</div></td>
	</tr>	
	<tr > 
		<td height="30px"><div align="center">비밀번호</div></td>
		<td ><input id="QNA_PASS" name="QNA_PASS" type="password" maxlength="10" value="<%=vo.getQna_pass()%>"/></td>							
		<td><span>공개여부&nbsp;</span>
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="공개"/>공 개				
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="비공개" checked="checked"/>비공개</td>				
	</tr>			
	<tr><td colspan="3" align="center" valign="middle">
		<input class="input-button" type="submit" name="submit" value="등록" >			
		<input class="input-button" type="button" name="cancel" value="취소" onclick="uCancel();">					
		</td>
	</tr>
</table>			
</form>
</div></div>
</section>
<div id="footer"></div> 
</body>
</html>
