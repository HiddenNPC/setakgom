<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="com.spring.setak.*" %>

<%
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
	int qna_num = vo.getQna_num();
	String member_id = vo.getMember_id();
	System.out.println("QNA_NUM=" +qna_num);
	System.out.println("member_id="+member_id);
	String b = null;
	String session_id= (String)session.getAttribute("member_id");
	String qna_scr = vo.getQna_scr();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" >
<title> 세탁곰 Q&A </title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/qna.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#header").load("header.jsp")
    $("#footer").load("footer.jsp")   
	//목록
	function selectData() {
		var para= {Qna_num:<%=vo.getQna_num() %>};
		$('#output').empty();
		$.ajax({
			/* url:'/setak_qna/commentList.re?qna_num='+para+'', 
			type:'GET',*/
			url:'/setak/commentList.do', 
			type:'POST', 
			data:para,
			dataType:"json", //서버에서 보내줄 데이터 타입
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {				
				$.each(data, function(index, item) {
					var output = '';
					output += '<tr><td><input type="hidden" value="'+item.qna_seq+'"/></td></tr>';							
					output += '<tr style="display:none;"><td>< input type="hidden" value="'+item.qna_num+'"></td></tr>';							
					output += '<tr><td id="cl_td1" colspan="2">작성자 : <small style="font-size:0.8rem;"><%=vo.getMember_id()%></small></td></tr>';
					/* 답변 유뮤로 작성자를 관리자 또는 세션아이디로 구분  */
					output += '<tr><td id="td3" width="20px" valign="top">A :</td>';														
					output += '<td>'+item.qna_content+'</td></tr>';														
					output += '<tr><td id="cl_td2" colspan="2"><button class="cdbtn" id="'+item.qna_seq+'">삭제</button></td></tr>';									
					$('#output').append(output);
				});
			},
			error:function() {
				alert("ajax통신 실패!!!");
			}
		});
	}
	
	//댓글 추가
	$('#cf_insertbtn').on('click', function(event){
		var qna_scr='<%=vo.getQna_scr()%>'; 
		var session_id = '<%=(String)session.getAttribute("member_id")%>';
		var qna_num = '<%=vo.getQna_num()%>';
		if(qna_scr=="공개"){
			if(session_id==null)
			{
				var qna_confirm=confirm("회원만 댓글을 달수 있습니다. 로그인 페이지로 이동하시겠습니까?");
				if(qna_confirm==true){
					return false;
					location.href='./login.do';					
				}
				else{
					return false;	        		       		
				}
	    	}												
		}
		if($('#q-c-tarea').val()=='')
		{
			alert("댓글을 입력해주세요 (최대 300자)");
			return false;
		}
		var params=$("#comment_form").serialize();
		jQuery.ajax({
			url:'/setak/commentInsert.do',
			type:'POST',
			data:params,
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			dataType:'json',
			success: function(retVal) 
			{	
				if (retVal.res == "OK"){
					selectData();
					$('#q-c-tarea').val("");
				}
				else {
					alert("Insert Fail!!!!!");
				}
			},

			error:function() {
				alert("ajax통신 실패!!!");
			}
		});		
	event.preventDefault();
	});

	//삭제 실행
	$(document).on('click','.cdbtn', function(event){
		
		var dpara ={Qna_seq:$(this).attr("id")};					
			$.ajax({
			url:'/setak/commentDelete.do',
			type:'POST',
			data:dpara,
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			dataType:"json",
			success : function(retVal) {
				console.log("retVal="+retVal);
				if (retVal.res == "OK") {
					selectData();
				}
				else {
					alert("Delete Fail!!!!!");
				}
			},
			error:function() {
				alert("ajax통신 실패!!!");
			}
		});
		event.preventDefault();
	});


	
selectData();	
});

</script>

</head>
<body>
<div id="header"></div>
<section id="qna">
<div class="content">
<div class="title-text"><h2><a href="./qnaList.do">Q&A</a></h2></div>
<div class="qna">

<table class="qvt1">
	<tr>					
		<td align="center" width="10%" height="50px"><p>문의유형 </p>:<small><%=vo.getQna_type() %></small></td>			
		<td align="left"  height="40px" width="700px">&nbsp;제목 :&nbsp;<%=vo.getQna_title()%>
			<small>&nbsp;주문번호 :<%if(vo.getOrder_num()==0){%>없음 <%}else{%><%=vo.getOrder_num()%><%}%></small></td>		
		<td align="right" height="40px"> 작성자 : <%=vo.getMember_id() %>&nbsp;&nbsp;</td>					
	</tr>
	<tr height=250 >			
		<td id="td1" valign=top colspan="1" align="right">&nbsp;Q : &nbsp;</td>
		<td id="td2" valign=top colspan="1"><%=vo.getQna_content()%></td>		
		<td id="td3" valign=top>
			<div class="thumbnail-wrapper">
			  <div class="thumbnail">
			    <div class="thumbnail-centered">
			    	<%if (!vo.getQna_file().split("_")[0].equals("등록한 파일이 없습니다.")){ %>
			      	<img class="thumbnail-img" src="https://kr.object.ncloudstorage.com/airbubble/setakgom/qna/<%=vo.getQna_file()%>"/>
			      	<%}else{ %>
			      	<img class="thumbnail-img" src="./images/No_image_available.png"/>
			      	<%} %>
			    </div>
			  </div>
			</div>
		</td>
				
	</tr>
	<tr>
		<td colspan="3" width="10%" height="40px">
		<div style="margin-left: 20px;"><small>첨부 파일 :</small> 
		<%if(!(vo.getQna_file()==null)) {%>
		<a href="#"><%int i= vo.getQna_file().indexOf("_");%>
		<%=vo.getQna_file().substring(i+1)%>
		</a><%}else{%>파일이 존재하지 않습니다.<%}%>		
		</div></td>
	</tr>
</table>

<table class="qvt3">
	<tr><td>
		<button style="float: right;" onclick="location.href='./qnaPass2.do?qna_num=<%=vo.getQna_num() %>'">삭제 </button>		
		<button style="float: right;" onclick="location.href='./updateform.do?qna_num=<%=vo.getQna_num() %>'">수정 </button>			
		<button onclick="location.href='./qnaList.do'"> 글목록  </button>							
		</td>
	</tr>			
</table>



<!-- 게시판 내용 끝 ,  댓글 작성 폼  시작-->	
<form id="comment_form" method="post" >
<table class="cf_t1">
<tr><th id="cf_label">&nbsp;댓 글</th></tr>
<tr><td><input type="hidden" name="qna_num" id="qna_num" value="<%=vo.getQna_num()%>"></td></tr>
<tr><td><textarea  id="q-c-tarea" name="qna_content" maxlength="300px" cols="120" rows="6" placeholder="&nbsp;따뜻한 댓글이 세탁곰에게 힘이 됩니다 "></textarea></td>
	<td valign="bottom" width="10%" ><input id="cf_insertbtn" type="button" value="추가" ></td>
</tr>	
</table>
</form>
<!-- 댓글 작성 폼 끝 -->
<!-- 댓글리스트  id="output" -->
<form><table id="output" class="comment_list"></table></form>
<!-- 댓글리스트 끝-->
</div></div>
</section>
<div id="footer"></div> 
</body>
</html>