<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.spring.member.MemberVO" %>
<%@ page import = "java.util.ArrayList" %>
<%
ArrayList<MemberVO> adminlist = (ArrayList<MemberVO>)request.getAttribute("list");
int limit = ((Integer)request.getAttribute("limit")).intValue();
int nowpage = ((Integer)request.getAttribute("page")).intValue();
int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
int startpage = ((Integer)request.getAttribute("startpage")).intValue();
int endpage = ((Integer)request.getAttribute("endpage")).intValue();
int listcount = ((Integer)request.getAttribute("listcount")).intValue();
int todaycount = ((Integer)request.getAttribute("todaycount")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰 관리자페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="../css/admin_member.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			//헤더, 푸터연결
			$("#admin").load("./admin.jsp");
			
			/*
			var tr = $('.record_list').children(2).children(2);
			var memo = tr.eq(2).children().eq(4).children().val();
			alert(memo);
			
			
			
			var hap = 0;
			var tr = $('.record_list').children(2).children(2);
			var pricearr = new Array();
			
			tr.each(function(i) {
				pricearr.push(tr.eq(i).children().eq(4).val());
			});
			
			for(var i = 1; i<pricearr.length;i++){
				hap += parseInt(pricearr[i]);
			};
			
			alert(hap);
			
			//var member_memo = ('.record_list').tr.children().eq(4).children().val();
			//tr접근을 하시요 eq(i)를  for문 돌려서 찾으세요 
			
			
		/*수정버튼 클릭*/	
		$(document).on('click', '#update', function(event) {
			
			var select_btn = $(this);
			var tr = select_btn.parent().parent();
			var member_id = tr.children().eq(1).text();
			var member_memo = tr.children().eq(4).children().val();
			
			
			alert(member_id);
			alert(member_memo);
			
			var params ={
						 'member_id':member_id,
						 'member_memo':member_memo
			};
			
			$.ajax ({
				url:'/setak/admin/admin_update.do',
				type:'post',
				data:params,
				dataType:'json',
				 contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					success: function(result) {
			        	 if(result.res=="OK") {
			        		 alert("수정성공");
			        	 } else {
			        		alert("수정실패");	 
			        	 }
			        },
			        error:function() {
			               alert("insert ajax 통신 실패");s
			           }			
			});
			
		});
		
	});
	</script>
</head>
<body>
		<div id="admin"></div>
		<div class="content">
			<!-- 여기서부터 작업하세요. -->
			<h1>회원관리</h1>
			<div class ="count">
				  오늘 가입한 회원수 <span><%=todaycount %>명</span> 
				 <span> 총 회원수 <%=listcount %>명</span>
			</div>
			<table class="record_list"> 
					<tr class="menu">
						<th>NO</th>
						<th>아이디</th>
						<th>이름</th>
						<th>가입일</th>
						<th>메모</th>
						<th>관리</th>
					</tr>
				<%
					for (int i=0; i<adminlist.size(); i++) {
					MemberVO list = (MemberVO)adminlist.get(i);
				%>
					<tr class="content">
						<td><%=i+1 %></td>
						<td><%=list.getMember_id() %></td>
						<td><%=list.getMember_name() %></td>
						<td><%=list.getMember_join() %></td>
						<td>
							<%if( list.getMember_memo() != null) { %>
								<input type="text" id="member_memo" value="<%=list.getMember_memo() %>">
							<% } else { %>
							
							<input type="text" id="member_memo" value=" ">
							<%} %>
						</td>
						<td>
							<input type="button" id="update" value="수정" />
							<input type="button" id="delete" value="삭제" />
						</td>
					</tr>
				<%} %>   
			</table>
			<div class="page">
				<table class="page">
                	<tr>
                    	<td>
                    	<% if(nowpage <= 1) {%>
                    		<span class="page"><a></a></span>
                    	 <%} else {%>  <!-- nowpage가 1페이지 아닐 때, 2 페이지거나 3페이지 등등 -->
                       		<span class="page">
                       			<a href ="./member.do?page=<%=nowpage-1 %>"></a>
                       		</span>
                    	 <%} %>
                         	
                    	<%
                    		for (int af=startpage; af<=endpage; af++) {
                    			
                      			if(af==nowpage) {
                    	%>
                       				<span class="page"><a><%=af %></a></span>
                    			<%} else {%>
                          			<span class="page">
	                       				<a href="./member.do?page=<%=af %>"><%=af %></a>
	                       			</span>
                    			<%} %>
                    		<%} %>
                          
                    	<% if (nowpage >= maxpage) { %>   <!-- 링크 걸지 않겠다.. -->
                       		<span class="page"><a></a></span>
                    	<%} else { %>   
                       		<span class="page"><a href ="./member.do?page=<%=nowpage+1 %>"></a></span>
                    	<%} %> 
                    	</td>
                    </tr>
              	</table>
			</div>
	
	</div><!-- 지우지마세요 -->
</body>
</html>
