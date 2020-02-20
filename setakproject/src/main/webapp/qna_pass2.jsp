<%@ page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "com.spring.community.*"%>   
<%
QnaVO vo = (QnaVO)request.getAttribute("qnadata");
int qna_num = vo.getQna_num();
String member_id = vo.getMember_id();


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
<script src="https://kit.fontawesome.com/4b95560b7c.js" crossorigin="anonymous"></script>

<!--sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">
$(document).ready(function(){
    $("#header").load("header.jsp")
    $("#footer").load("footer.jsp")  
    
});


function passchk(){	
	//입력안한거 입력하도록 
	if (document.getElementById('qp1_3').value=="") {
		Swal.fire("","비밀번호를 입력하세요.","info");
        document.getElementById('qp1_3').focus();
        return;
    }else{
    	document.passform.submit();
    }	
}
	

</script>

</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A</a></h2></div>
<div class="qna">

<form  action="./qnaDelete.do" method="post" enctype="multipart/form-data" name="passform">
<div style=" height:300px;">
	<div id="qp1_1"><p>비밀번호를 입력하세요</p>
		<div id="qp1_2">
			<input type="hidden" name="QNA_NUM" value="<%=vo.getQna_num() %>">		
			<input type="hidden" name="MEMBER_ID" value="<%=vo.getMember_id()%>">		
			<input type="hidden" name="loginId" value="<%=session.getAttribute("member_id")%>">		
			<input id="qp1_3" type="password" name="QNA_PASS" placeholder="비밀번호">
			<input id="qp1_4" type="button" onclick="passchk()" value="확인">			
					
		</div>
	</div>
</div>	
</form>

</div></div>
</section>
<div id="footer"></div> 
</body>
</html>