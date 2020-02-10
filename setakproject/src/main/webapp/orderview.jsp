<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*, com.spring.order.*" %>
<%@ page import="com.spring.setak.*" %>
<%@ page import="java.util.*, com.spring.setak.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	List<OrderVO> orderlist = (ArrayList<OrderVO>)request.getAttribute("orderlist");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-d");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	int limit = ((Integer)request.getAttribute("limit")).intValue();
	
	WashingVO washVO = (WashingVO)request.getAttribute("washVO");
	MendingVO mendVO = (MendingVO)request.getAttribute("mendingVO");
	KeepVO keepVO = (KeepVO)request.getAttribute("keepVO");

	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/orderview.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#header").load("./header.jsp");
		$("#footer").load("./footer.jsp");     
	   
		jQuery(".accordion-content").hide();
		//content 클래스를 가진 div를 표시/숨김(토글)
		$(".accordion-header").click(function(){
			$except = $(this).closest("div");
			$except.toggleClass("active");
			$(".accordion-content")
				.not($(this).next(".accordion-content").slideToggle(500)).slideUp();
			$('.mypage_content_cover').find('.accordion>.accordion-header').not($except).removeClass("active");
		});
		
		$(document).on('click', '#order_false', function(event) {
			var btn = $(this); 
			var order_muid = btn.attr('name');
			
			alert(order_muid); 
			
			if(confirm("선택된 주문을 취소하시겠습니까?")) {
			    jQuery.ajax({
				      "url": "/setak/cancelPay.do",
				      "type": "POST",
				      "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
				      "data": {
				        "order_muid" : order_muid
				      },
				      "dataType": "json"
				    }).done(function(result) { // 환불 성공시 로직 
				        alert("주문이 성공적으로 취소 되었습니다.");
				    }).fail(function(result) { // 환불 실패시 로직
				      	alert("주문 취소가 실패했습니다. 고객센터로 연락주세요.");
				    });	
			}		    
		}); 
	    
	});


    
function cancle() {
	confirm("주문을 취소하시겠습니까?");
}
</script>
</head>
<body>
	<div id="header"></div>
	
	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="test"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
			<div class="mypage_head">
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
							<li><a href="qnainquiry.do">Q&amp;A 문의내역</a></li>
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
			
			<div class="mypage_content">
				<h2>주문/배송현황</h2>
				<div class="mypage_content_cover">
					<p>
						<font size=2.5rem>※ 취소 버튼은 신청 당일 밤 10시 전까지만 활성화됩니다. 이후 취소는 불가합니다.</font>
					</p>
					<% 
							for (int i = 0; i<orderlist.size(); i++){	
								OrderVO orderVO = (OrderVO)orderlist.get(i);
								
								// 리스트 하고 싶으면 for문을 돌려 힘을내 > keepVO도 리스트일거 아녀.. 
								String start = keepVO.getKeep_start();
								String[] date = start.split(" ");
								String start_date = date[0]; 			
								
								String end = keepVO.getKeep_end();
								String[] date2 = end.split(" ");
								String end_date = date2[0];
							
					%>
					<div class="accordion">
						<div class="accordion-header">주문일자 : <%=orderVO.getOrder_date() %></div>
						<div class="accordion-content">
							<!--snb -->
							<div class="snb">
								<div class="ordernumber">
									<p>주문 번호 :</p>
									<p><%=orderVO.getOrder_num() %></p>
								</div>
								<div class="addr">
									<p>주소 :</p>
									<p><%=orderVO.getOrder_address() %></p>
								</div>
								<br><br><br><br><br>
								<div class="order_dateClass">
									<%if (orderVO.getOrder_delete().equals(0)) {%>
									<a href='#' class="button" id="order_false" name="<%=orderVO.getOrder_muid()%>" disabled="true">주문 취소</a>
									<%} else { %>
									<a href='#' class="button" id="order_false" name="<%=orderVO.getOrder_muid()%>" disabled="false">주문 취소</a>
									<%} %>
								</div>
							</div>
							<!--//snb -->
							<!--content -->
							<div class="row_content">
								<div class="row_content2">
								<div class="my_laundry">
									<p>세탁 :</p>
									<p><%=washVO.getWash_cate() %>&nbsp;&nbsp;<%=washVO.getWash_method() %>&nbsp;&nbsp;<%=washVO.getWash_count() %></p>
								</div>
								<div class="my_mending">
									<p>수선 :</p>
									<p><%=mendVO.getRepair_cate() %>&nbsp;&nbsp;<%=mendVO.getRepair_kind() %>&nbsp;&nbsp;<%=mendVO.getRepair_code() %>&nbsp;&nbsp;<%=mendVO.getRepair_count() %></p>
								</div>
								<div class="my_keep">
									<p>보관 :</p>
									<p><%=keepVO.getKeep_cate() %>&nbsp;&nbsp;<%=keepVO.getKeep_kind() %>&nbsp;&nbsp;<%=keepVO.getKeep_count() %>&nbsp;&nbsp;<%=keepVO.getKeep_box() %>&nbsp;&nbsp;<%=start_date %>&nbsp;&nbsp;<%=end_date%></p>
								</div>
								</div>
								<div class="price">
									<p>상태 : <%=orderVO.getOrder_status() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 합계 : <%=orderVO.getOrder_price() %>&nbsp;원</p>
								</div>
							</div>
						</div>
					</div>
					<%
						}
%>
				</div>
				<div class="page1">
				<table class="page">
					<tr align = center height = 20>
              			<td>
              				<%if(nowpage <= 1) {%>
              				<div class="page_a"><a>&#60;</a></div>
              				<%} else {%>
              					<div class="page_a"><a href ="./orderview.do?page=<%=nowpage-1 %>">&#60;</a></div>
              				<%} %>
              				<%for (int a=startpage; a<=endpage; a++) {
              					if(a==nowpage) {
           					%>
           					<div class="page_a"><a><%=a %></a></div>
           					<%} else {%>
           						<div class="page_a"><a href="./orderview.do?page=<%=a %>"><%=a %></a></div>
           					<%} %>
           					<%} %>
           					<%if (nowpage >= maxpage) {%>	
           						<div class="page_a"><a>&#62;</a></div>
           					<%} else { %>	
                  				<div class="page_a"><a href ="./orderview.do?page=<%=nowpage+1 %>">&#62;</a></div>
                  			<%} %>	
                  			</td>
               		</tr>
				</table>
				</div>
			</div>
			
		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
</body>
</html>