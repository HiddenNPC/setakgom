<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="com.spring.setak.*" %>

<%
	QnaVO vo = (QnaVO)request.getAttribute("qnadata");
	int qna_num = vo.getQna_num();
	String member_id = vo.getMember_id();
	String b = null;
	String session_id= (String)session.getAttribute("member_id");
	System.out.println("이색기="+session_id);
	String qna_scr = vo.getQna_scr();
	String m_name = (String)request.getAttribute("m_name");
	System.out.println(m_name);
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#header").load("header.jsp")
    $("#footer").load("footer.jsp")   
	
    //목록
	function selectData() {
		var para= {Qna_num:<%=vo.getQna_num() %>};	
		var m_name= '<%=m_name%>'; 
		var session_id= '<%=session_id%>';
		//console.log(m_name);
		//console.log(session_id);		
		$('#output').empty();
		$.ajax({
		  	/*url:'/setak_qna/commentList.re?qna_num='+para+'', 
			type:'GET',*/
			url:'/setak/commentList.do', 
			type:'POST', 
			data:para,
			dataType:"json",
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(data) {				
				$.each(data, function(index, item) {
					console.log("item.member_id="+item.member_id);
					//var res =JSON.stringify(item.member_id);
					//var a =res.indexOf('"');					
					var m_name= '<%=m_name%>';
					//console.log("a="+a);
					console.log("m_name="+m_name);
					//console.log("res="+res);
					var output = '';	  
					output += '<tr><td><input type="hidden" value="'+item.qna_seq+'"/></td></tr>';							
					output += '<tr style="display:none;"><td>< input type="hidden" value="'+item.qna_num+'"></td></tr>';							
					if(item.member_id=="관리자")
					{
						output +='<tr><td id="cl_td1" colspan="2">작성자:<small style="font-size:0.8rem;">'+item.member_id+'</small></td></tr>';	
					}
					else
					{
						output +='<tr><td id="cl_td1" colspan="2">작성자:<small style="font-size:0.8rem;">'+m_name+'</small></td></tr>';
					} 											
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
		var session_id ='<%=(String)session.getAttribute("member_id")%>';
		var qna_num = '<%=vo.getQna_num()%>';		
		if(qna_scr=="공개")
		{
			if(session_id=='null')
			{
				var qna_confirm=confirm("회원만 댓글을 달수 있습니다. 로그인 페이지로 이동하시겠습니까?");
				if(qna_confirm==true){					
					location.href='./login.do';	
					return false;
				}
				else{
					return false;	        		       		
				}
			}
			else if(!('<%=(String)session.getAttribute("member_id")%>'=='<%=vo.getMember_id()%>'))
			{
				Swal.fire("",'작성자만 댓글을 달 수 있습니다 .',"info")
				return false;
			}	
														
		}
		if($('#q-c-tarea').val()=='')
		{
			Swal.fire("","댓글을 입력해주세요 (최대 300자)","info");
			return false;
		}
		var params=$("#comment_form").serialize();
		console.log(params);
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
		var session_id ='<%=(String)session.getAttribute("member_id")%>';
		if(session_id=='null')
		{
			var qna_confirm=confirm("비회원은 삭제할 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
			if(qna_confirm==true){					
				location.href='./login.do';	
				return false;
			}
			else{
				return false;	        		       		
			}
		}
		else if(!('<%=(String)session.getAttribute("member_id")%>'=='<%=vo.getMember_id()%>'))
		{
			Swal.fire("",'작성자만 삭제할 수 있습니다 .',"info")
			return false;
		}																					
		var dpara ={Qna_seq:$(this).attr("id")};
		console.log(dpara);
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
<div class="title-text"><h2><a href="./qnaList.do">Q&A<small id="h_small">문의사항</small></a></h2></div>
<div class="qna">

<table class="qvt1">
	<tr>					
		<td id="mqvt1d1" align="center" width="10%" height="50px"><p>문의유형 </p>:<small><%=vo.getQna_type() %></small></td>			
		<td id="mqvt1d2" align="left"  height="40px" width="700px">&nbsp;제목 :&nbsp;<%=vo.getQna_title()%>
			<small>&nbsp;주문번호 :<%if(vo.getOrder_num()==0){%>없음 <%}else{%><%=vo.getOrder_num()%><%}%></small></td>		
		<td id="mqvt1d3"  height="40px"> 작성자 :&nbsp;<small><%=m_name%>&nbsp;&nbsp;</small></td>					
	</tr>
	<tr height=250 >			
		
		<td id="td2" valign=top colspan="3">&nbsp;Q : &nbsp; <%=vo.getQna_content()%>	
		
			<div class="thumbnail-wrapper">
			  <div class="thumbnail">			    
			    	<%if (!vo.getQna_file().split("_")[0].equals("등록한 파일이 없습니다.")){ %>
			      		<img class="thumbnail-img" src="https://kr.object.ncloudstorage.com/airbubble/setakgom/qna/<%=vo.getQna_file()%>"  onclick="window.open('https://kr.object.ncloudstorage.com/airbubble/setakgom/qna/<%=vo.getQna_file()%>', 'new', 'width=800, height=600, left=500, top= 100, scrollbars=no');">								
			      	<%-- <%}else{ %>
			      		<img class="thumbnail-img" src="http://placehold.it/255x280" onclick="window.open('http://placehold.it/800x600', 'new', 'width=800, height=600, left=500, top= 100, scrollbars=no');">	 --%>		      	
			      	<%} %>			    
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
<tr><td><input type="hidden" name="qna_num" id="qna_num" value="<%=vo.getQna_num()%>"></td>
	<td><input type="hidden" name="member_id" id="member_id" value="<%=vo.getMember_id()%>"></td></tr>
<tr><td><textarea  id="q-c-tarea" name="qna_content" maxlength="300px"  placeholder="&nbsp;따뜻한 댓글이 세탁곰에게 힘이 됩니다 "></textarea></td>
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




