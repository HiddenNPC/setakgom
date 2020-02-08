<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.spring.member.CouponVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*, com.spring.setak.*" %>
<% 
	List<CouponVO> couponlist = (ArrayList<CouponVO>)request.getAttribute("couponlist");
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
	<link rel="stylesheet" type="text/css" href="./css/mycoupon.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("./header.jsp")
         $("#footer").load("./footer.jsp")     
      });
    </script>
    <script language='javascript'>
    	function cancle() {
			alert("주문을 취소하시겠습니까?");
		}
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
				<h2>쿠폰 조회</h2>
				<div class="mypage_content_cover">
				<div class="qna-title">
					<div>
						<table class="qna">
							<thead align="center">
								<tr>
									<th width="20">쿠폰명</th>
									<th width="40">쿠폰 혜택</th>
									<th width="20">쿠폰 발행일</th>
									<th width="20">사용가능 기간</th>
								</tr>
							</thead>
							<tbody align="center">
								<tr>
								<%for(int i=0; i<couponlist.size(); i++){ 
									CouponVO cvo = (CouponVO)couponlist.get(i);
									%>
									<td><%=cvo.getCoupon_name() %></td>
									<td><a href="#" style="color:#3498db; font-weiht:bold;">보관1개월 무료</a></td>
									<td><%=sdf.format(cvo.getCoupon_start()) %></td>
									<td><%=sdf.format(cvo.getCoupon_start()) %>&nbsp;~&nbsp;<%=sdf.format(cvo.getCoupon_end()) %></td>
									<%} %>		
								</tr>
							</tbody>					
							
						</table>
					</div>
					</div>
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