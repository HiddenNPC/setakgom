<%@page import="com.spring.community.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.setak.*" %>   
<%@ page import = "java.text.SimpleDateFormat" %> 
<%
	List<QnaVO> qnalist = (ArrayList<QnaVO>)request.getAttribute("qnalist");
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int limit = ((Integer)request.getAttribute("limit")).intValue();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-d");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/myqna.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
    	  var member_id = "<%=session.getAttribute("member_id")%>";
         $("#header").load("./header.jsp")
         $("#footer").load("./footer.jsp")     
      });
    </script>
</head>
<body>
	<div id="header"></div>
	
	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="test"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
			<div class="mypage_head" style="width: 12%; float: left;">
				<ul>
					<li class="mypage-title">마이페이지</li>
					<li>
						<ul class="mypage_list">
							<li>주문관리</li>
							<li><a href="orderview.do">주문/배송현황</a></li>
							<li><a href="mykeep.do">보관현황</a></li>
						</ul>
						<ul class="mypage_list">
							<li>정기구독</li>
							<li><a href="mysub.do">나의 정기구독</a></li>
						</ul>
						<ul class="mypage_list">
							<li>고객문의</li>
							<li><a href="myqna.do">Q&amp;A 문의내역</a></li>
						</ul>
						<ul class="mypage_list">
							<li>정보관리</li>
							<li><a href="profile1.do">개인정보수정</a></li>
							<li><a href="mycoupon.do">쿠폰조회</a></li>
							<li><a href="mysavings.do">적립금 조회</a></li>
							<li><a href="withdraw.do">회원탈퇴</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div style="width: 85%; float: right;">
				<div class="mypage_content">
				<h2>Q&A 문의내역</h2>
				<%if (qnalist.size() == 0) {%>
					<h3>Q&A 문의내역이 없습니다.</h3>
				<%}else{ %>
				<div class="mypage_content_cover">
				<div class="qna-title">
					<div>
						<table class="qna">
							<thead align="center">
								<tr>
									<th width="15">문의유형</th>
									<th width="40">제목</th>
									<th width="20">문의날짜</th>
									<th width="15">답변상태</th>
								</tr>
							</thead>
							<%for (int i=0; i<qnalist.size(); i++){ 
								QnaVO qvo = (QnaVO)qnalist.get(i);
							%>
							<tbody align="center">
								<tr>
									<td><%=qvo.getQNA_TYPE() %></td>
									<td><a href="./qnaDetail.do?QNA_NUM=<%=qvo.getQNA_NUM() %>" style="color:#3498db; font-weiht:bold;"><%=qvo.getQNA_TITLE() %></a></td>
									<td><%=sdf.format(qvo.getQNA_DATE()) %></td>
									<td><%=qvo.getQNA_CHECK() %></td>
								</tr>
							</tbody>					
							<%} %>	
						</table>
					</div>
					</div>
					<div class="page1">
						<table class="page">
							<tr align = center height = 20>
              				<td>
              					<%if(nowpage <= 1) {%>
              				<div class="page_a"><a>&#60;</a></div>
              				<%} else {%>
              					<div class="page_a"><a href ="./mysaving.do?page=<%=nowpage-1 %>">&#60;</a></div>
              				<%} %>
              				<%for (int a=startpage; a<=endpage; a++) {
              					if(a==nowpage) {
           					%>
           					<div class="page_a"><a><%=a %></a></div>
           					<%} else {%>
           						<div class="page_a"><a href="./mysaving.do?page=<%=a %>"><%=a %></a></div>
           					<%} %>
           					<%} %>
           					<%if (nowpage >= maxpage) {%>	
           						<div class="page_a"><a>&#62;</a></div>
           					<%} else { %>	
                  				<div class="page_a"><a href ="./mysaving.do?page=<%=nowpage+1 %>">&#62;</a></div>
                  			<%} %>	
                  			</td>
               			</tr>
					</table>
					</div>	
				</div>
			</div>
			<%} %>
			</div>
		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</body>
<script>
    $(function () {
       $(".accordion-header").on("click", function () {
           $(this)
               .toggleClass("active")
               .next()
               .slideToggle(200);
       });
    });
</script>
</html>