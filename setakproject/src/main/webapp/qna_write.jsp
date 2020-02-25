<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.spring.setak.*" %>  
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>

<%	
	ArrayList<QnaVO> onlist = (ArrayList<QnaVO>)request.getAttribute("onList");
	String member_name = (String)session.getAttribute("member_name");

	System.out.println("member_name : "+ member_name);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" >
<title>세탁곰</title>
<link rel="shortcut icon" href="favicon.ico">
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
	
	$("#qnaform").on("submit", function() {
		if(writechk()){
			
			if(filecontent != null){
				var data = new FormData();
				data.append("purpose", "qna");
				data.append("files", filecontent);
				data.append("filename", filename);
				
				$("#QNA_FILE2").val(filename);
				
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

 
//입력받을곳 확인체크 + 값 컨트롤러로 전달
function writechk(){	

	if (document.getElementById('QNA_TITLE').value=="") 
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
		Swal.fire("","작성하신 글의 비밀번호를 설정해 주세요 (최대 10자)","info");
        document.getElementById('QNA_PASS').focus();
        return false;
    }
	return true;
}
//취소
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

</script>
</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A<small id="h_small">문의사항</small></a></h2></div>
<div class="qna">

<form action="./qnaInsert.do" method="post" enctype="multipart/form-data" id="qnaform"  name="qnaform">
<table class="qwt1">				
	<tr>
		<td height="30px"><div align="center">작성자</div></td>		
		<td colspan="2">
			<input value="<%=session.getAttribute("member_name")%>" type="hidden" name="member_name" >&nbsp;<%=session.getAttribute("member_name")%>
			<input value="<%=session.getAttribute("member_id")%>" type="hidden" name="MEMBER_ID">
		</td>
	</tr>
	<tr>
		<td id="m_qwtd1"><div align="center">문의유형</div></td>
		<td colspan="2" class="qwr">
		<div>			
			<input type="radio" id="type1" name="QNA_TYPE" value="주문 취소" checked="checked"><label for="type1">주문 취소</label>
			<input type="radio" id="type2" name="QNA_TYPE" value="배송 문의 "><label for="type2">배송 문의 </label>
			<input type="radio" id="type3" name="QNA_TYPE" value="적립금"><label for="type3">적립금</label>
			<input type="radio" id="type4" name="QNA_TYPE" value="서비스이용"><label for="type4">서비스이용</label>
			<input type="radio" id="type5" name="QNA_TYPE" value="회원정보"><label for="type5">회원정보</label>
			<input type="radio" id="type6" name="QNA_TYPE" value="기타"><label for="type7">기타</label>			
		</div>
		</td>
	</tr>
	<tr>
		<td id="m_qwtd1"><div align="center">주문번호</div></td>
		<td colspan="2"><div>
		<select class="qwon" name="ORDER_NUM">		
			<option value="선택안함">선택안함</option>
			<%for(int i=0; i<onlist.size(); i++){ QnaVO ol = (QnaVO)onlist.get(i); %>
   	 		<option value="<%=ol.getOrder_num()%>"><%=ol.getOrder_num()%></option>    		
    		<%} %>
		</select></div>
		</td>
	</tr>
	<tr>
		<td id="m_qwtd1"><div align="center">제 목</div></td>
		<td colspan="2"><input id="QNA_TITLE" name="QNA_TITLE" type="text" size="35" maxlength="50"/></td>
	</tr>
	<tr>
		<td id="m_qwtd1"><div align="center">내 용</div></td>
		<td colspan="2"><textarea id="QNA_CONTENT" name="QNA_CONTENT" maxlength="500"></textarea></td>
	</tr>
	<tr>
		<td id="m_qwtd1"><div align="center">파일첨부</div></td>
		<td colspan="2">
			<input type="file" id="QNA_FILE" />
			<input type="hidden" id="QNA_FILE2" name="QNA_FILE" >
		</td>				
	</tr>
	<tr > 
		<td id="m_qwtd1"><div align="center">비밀번호</div></td>
		<td><input id="QNA_PASS" name="QNA_PASS" type="password" maxlength="10"/></td>							
		
		<td><div id="msp">공개여부&nbsp;</div>
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="공개"/>공 개				
			<input id="QNA_SCR" name="QNA_SCR" type="radio" value="비공개" checked="checked"/>비공개
			</td>
								
	</tr>
	<tr class="qwt1h">
		<td colspan="2"><div>
			<input type="hidden" name="QNA_CHECK" value="답변대기" checked="checked">						
			<!-- <input type="hidden" name="QNA_CHECK" value="답변완료"> -->					
			</div>
		</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5" id="m_qwtd1">
			<input class="input-button" type="submit" name="submit" value="등록" >			
			<input class="input-button" type="button" name="cancel" value="취소" onclick="wcancel();">			
		</td>
	</tr>			
</table>
</form>
</div></div>
</section>
<div id="footer"></div> 		
</body>
</html>