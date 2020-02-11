<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="com.spring.setak.*" %>

<%
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
	int qna_num = vo.getQNA_NUM();
	String member_id = vo.getMEMBER_ID();
	System.out.println("QNA_NUM=" +qna_num);
	System.out.println("member_id="+member_id);
	String b = null;
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
		var para= {Qna_num:<%=vo.getQNA_NUM() %>};
		console.log("para의 값은?="+para);
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
					output += '<tr><td id="cl_td1" colspan="2">세탁곰</td></tr>';							
					output += '<tr><td id="td3" width="20px" valign="top">A :</td>';														
					output += '<td>'+item.qna_content+'</td></tr>';														
					output += '<tr><td id="cl_td2" colspan="2"><button class="cdbtn" id="'+item.qna_seq+'">삭제</button></td></tr>';				
					
					console.log("para="+para);
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
		var params=$("#comment_form").serialize();
		console.log("comment_form="+params);
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
					$('#cf_content').val('');
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
		console.log("id(qna_seq)="+dpara);
		
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
		<td align="center" width="10%" height="40px">&nbsp;<%=vo.getQNA_TYPE() %></td>			
		<td align="left"  height="40px">&nbsp;제목 :&nbsp;<%=vo.getQNA_TITLE()%>
			<small id="qvt1s">&nbsp;주문번호 :<%if(vo.getORDER_NUM()==0){%>없음 <%}else{%><%=vo.getORDER_NUM()%><%}%></small></td>		
		<td align="right" height="40px"> 작성자 : <%=vo.getMEMBER_ID() %>&nbsp;&nbsp;</td>					
	</tr>
	<tr height=250 >			
		<td id="td1" valign=top colspan="1" align="right">&nbsp;Q : &nbsp;</td>
		<td id="td2" valign=top colspan="1"><%=vo.getQNA_CONTENT()%></td>		
		<td id="td3" valign=top>
			<div class="thumbnail-wrapper">
			  <div class="thumbnail">
			    <div class="thumbnail-centered">
			    	<%if (!vo.getQNA_FILE().split("_")[0].equals("등록한 파일이 없습니다.")){ %>
			      	<img class="thumbnail-img" src="https://kr.object.ncloudstorage.com/airbubble/setakgom/qna/<%=vo.getQNA_FILE()%>"/>
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
		<div><small>첨부 파일 :</small> 
		<%if(!(vo.getQNA_FILE()==null)) {%>
		<a href="#"><%int i= vo.getQNA_FILE().indexOf("_");%>
		<%=vo.getQNA_FILE().substring(i+1)%>
		</a><%}else{%>파일이 존재하지 않습니다.<%}%>		
		</div></td>
	</tr>
</table>

<form id="only_qna_num" method="post">
<input type="hidden" value="<%=vo.getQNA_NUM()%>">
</form>

<table class="qvt3">
	<tr><td>
		<button type="button" id="btn1" onclick="location.href='./updateform.do?QNA_NUM=<%=vo.getQNA_NUM() %>'">수정 </button>					
		<button type="button" id="btn1" onclick="location.href='./qnaPass2.do?QNA_NUM=<%=vo.getQNA_NUM() %>'">삭제 </button>			
		<button type="button" id="btn2" onclick="location.href='./qnaList.do'"> 글목록  </button>							
		</td>
	</tr>			
</table>



<!-- 게시판 내용 끝 ,  댓글 작성 폼  시작-->	
<form id="comment_form" method="post" >
<table class="cf_t1">
<tr><th id="cf_label">&nbsp;댓 글</th></tr>
<tr><td><input type="hidden" name="qna_num" id="qna_num" value="<%=vo.getQNA_NUM()%>"></td></tr>
<tr><td><textarea class="textarea" name="qna_content" maxlength="300px" cols="120" rows="6" placeholder="&nbsp;따뜻한 댓글이 세탁곰에게 힘이 됩니다 "></textarea></td>
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
