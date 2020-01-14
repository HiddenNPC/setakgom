<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="com.spring.setak.*" %>

<%
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
	int qna_num = vo.getQNA_NUM();
	String member_id = vo.getMEMBER_ID();
	System.out.println("QNA_NUM=" +qna_num);
	System.out.println("member_id="+member_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세탁곰 Q & A</title>
<style>	
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
      	width:800px;
      	height:5px;
      	background-color: #3498db;
      	margin-bottom:10px; 
      	margin:auto; 
          
  	 }	

  	.table1
	{
		width:800px;		
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
		font-size: 18px;
		border: none;
		padding-top:15px;
		
	}
	#td2
	{
		/* display: inline; */
		border: none;
		padding-top:17px ;
	}
	
	.table2
	{
		width:800px;		
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
      	width:800px;
      	height:5px;
      	background-color: #3498db;
      	margin-bottom:10px; 
      	margin:auto; 
		
	}
	
  	.table5 /* 오직 버튼  */
	{
		width:800px;				
		margin: auto; /* align="center" */
		border: none;
		font-size: 15px;
		font-family:Tahoma;
		margin-top: 10px;
		color:#444;		
	}
	
	
	 #btn1 
	{
		font-weight: bold;
		font-size: 13px;
		font-family:Tahoma;
		color:white;	
		background-color:#3498db; 
		WIDTH: 43pt; 
		HEIGHT: 22pt;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px; 
		margin-right:-4px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		border: none;
		outline: none;
		margin: 3px;
		float: right;
		
	}
	 #btn2 
	{
		font-weight: bold; font-size: 13px; font-family:Tahoma;
		color:white; background-color:#3498db; 
		WIDTH: 43pt; 
		HEIGHT: 22pt;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px; 
		margin-right:-4px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		border: none;
		outline: none;
		margin: 3px;
		
	}
			
	#comment_form{	
		width:800px; text-align:left; margin: auto;
		font-family:Tahoma; color:#444;		
	}
	#cf_label{
		font-weight: bold;
		font-size: 13pt;
	}
	#cf_insertbtn {
		font-weight:bold; font-size: 13px; font-family:Tahoma;
		color:white; background-color:#3498db; WIDTH: 43pt; HEIGHT: 22pt;
		border-top-left-radius: 5px; border-bottom-left-radius: 5px; 
		border-top-right-radius: 5px; border-bottom-right-radius: 5px;
		border: none; outline: none; 
		float:right;
	}
		
	.comment_list /* 댓글리스트 */ 
	{
		width:800px;				
		margin: auto; /* align="center" */
		text-align:left;
		font-size: 15px;
		font-family:Tahoma;
		color:#444;		
	}
	
	#td3
	{
		color:#3498db;
		font-weight: bold;
		font-size: 18px;
		border: none;
		text-align: right;
		padding-right:14px ;
		
	}
	
	.cdbtn{
		font-weight:bold; font-size: 11px; font-family:Tahoma;
		color:white; background-color:#3498db; WIDTH: 35pt; HEIGHT: 19pt;
		border-top-left-radius: 5px; border-bottom-left-radius: 5px; 
		border-top-right-radius: 5px; border-bottom-right-radius: 5px;
		border: none; outline: none; align-content: right; float: right;
	}
	
	
	
	
	
	
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	//목록
	function selectData() {
		var para= {Qna_num:<%=vo.getQNA_NUM() %>};
		console.log("para의 값은?="+para);
		$('#output').empty();
		$.ajax({
			/* url:'/setak_qna/commentList.re?qna_num='+para+'', 
			type:'GET',*/
			url:'/setak/commentList.re', 
			type:'POST', 
			data:para,
			dataType:"json", //서버에서 보내줄 데이터 타입
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {				
				$.each(data, function(index, item) {
					var output = '';							
					output += '<tr><td><input type="hidden" value="'+item.qna_seq+'"></tr>';							
					output += '<tr><td><input type="hidden" value="'+item.qna_num+'"></tr>';							
					output += '<tr><td colspan="2">관리자</td></tr>';							
					output += '<tr><td id="td3" width="8%" valign="top" >A :&nbsp;</td>';														
					output += '<td>'+item.qna_content+'</td></tr>';														
					output += '<tr><td colspan="2"><button class="cdbtn" id="'+item.qna_seq+'">삭제</button></td></tr><br><br><br>';
					output += '<tr><td colspan="2">&nbsp;</td></tr>';	
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
			url:'/setak/commentInsert.re',
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
			url:'/setak/commentDelete.re',
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

<section>
<div class="about-text"><p><a href="./qnaList.co">Q&A</a></p> </div><br>	
<table class="table0"></table><!-- 윗 파란 줄  -->
<table class="table1" border="1" bordercolor="#e1e4e4" cellpadding="0" cellspacing="0">
	<tr >					
		<td align="center" width="10%" height="40px">&nbsp;<%=vo.getQNA_TYPE() %></td>		
		<td align="center" width="10%" height="40px">&nbsp;<%=vo.getQNA_KIND() %></td>		
		<td align="left" height="40px">&nbsp;제목 :&nbsp;<%=vo.getQNA_TITLE()%></td>		
		<td align="right" height="40px"> 작성자 : <%=vo.getMEMBER_ID() %>&nbsp;&nbsp;</td>					
	</tr>
	<tr height=250 >	
		
		<td id="td1" valign=top colspan="1" align="right">&nbsp;Q : &nbsp;</td>
		<td id="td2" valign=top colspan="3"><%=vo.getQNA_CONTENT()%></td>
		
	</tr>
</table>
<table class="table2" border="1" bordercolor="#e1e4e4" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="4" width="10%" height="40px">
			<div colspan="4" >&nbsp;첨부 파일 :&nbsp;
			<%if(!(vo.getQNA_FILE()==null)){ %>
			<a href="./fileDownload.co?of=<%=vo.getQNA_FILE().split("/")[1]%>
			&of2=<%=vo.getQNA_FILE().split("/")[0]%>"><%=vo.getQNA_FILE().split("/")[0] %></a>			
			<%}else{ %>
			파일이 존재하지 않습니다.
			<%} %>
			</div>
		</td>
	</tr>	
</table> 
<form id="only_qna_num" method="post">
<input type="hidden" value="<%=vo.getQNA_NUM()%>">
</form>
<table class="table3"></table><!-- 윗 파란 줄  -->
<table class="table5">
	<tr >
		<td >
		<button type="button" id="btn1" onclick="location.href='./updateform.co?QNA_NUM=<%=vo.getQNA_NUM() %>'"> 수 정  </button>					
		<button type="button" id="btn1" onclick="location.href='./qnaDelete.co?QNA_NUM=<%=vo.getQNA_NUM() %>'"> 삭 제  </button>			
		<button type="button" id="btn2" onclick="location.href='./qnaList.co'"> 글목록  </button>							
		</td>
	</tr>			
</table>
<br>
<!-- 게시판 내용 끝 -->
	
<!-- 댓글 작성 폼  시작-->

<form id="comment_form" method="post" >
<table border="0"  bordercolor="#e1e4e4" cellpadding="0" cellspacing="0">
<tr><th id="cf_label">&nbsp;댓 글</th></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><input type="hidden" name="qna_num" id="qna_num" value="<%=vo.getQNA_NUM()%>"></td></tr>
<tr><td><textarea id="cf_content" name="qna_content" maxlength="300px" cols="100" rows="6" placeholder="&nbsp;따뜻한 댓글이 세탁곰에게 힘이 됩니다 "></textarea></td>
	<td valign="bottom" width="15%" ><input id="cf_insertbtn" type="button" value="추가" ></td>
	
<tr>	
</table>
</form>
<br>
<!-- 댓글 작성 폼 끝 -->


<!-- 댓글리스트  id="output" -->
<form>
<table id="output" class="comment_list" border="0" bordercolor="#e1e4e4" cellpadding="0" cellspacing="0"><!-- 댓글리스트 끝-->

</table><br>
</form>
</section>
<br><br><br><br><br><br>
</body>
</html>
