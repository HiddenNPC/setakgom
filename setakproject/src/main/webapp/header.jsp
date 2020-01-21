<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<div id="container">
	<header>
		<nav>
			<div class="content">
				<ul class="logo">
					<li><a href="./" class ="logo_a"><img src="images/logo.png" alt="로고"></a></li>
				</ul>
				<ul class="logo2">
					<li><a href="./" class ="logo_a"><img src="images/logo2.png" alt="로고"></a></li>
				</ul>
				<ul class="main-nav">
				<%
					if(session.getAttribute("id")==null){
				%>
					<li><a href="./login.do">로그인</a></li>
					<li><a href="./join.do">회원가입</a></li>
				<%						
					} else {
				%>
					<li><a href="./logout.do">로그아웃</a></li>
					<li><a href="./orderview.do">마이페이지</a></li>
					<li><a href="./cart.do">장바구니</a></li>
				<%} %>
				</ul>
			</div>
			<div class="content">
				<ul class="sub-nav">
					<li><a href="./history.do">회사소개</a></li>
					<li><a href="./subscribe.do">정기구독</a></li>
					<li><a href="./setak.do">세탁서비스</a></li>
					<li><a href="./mendingform.do">수선서비스</a></li>
					<li><a href="./keepform.do">보관서비스</a></li>
					<li><a href="./noticeList.do">커뮤니티</a>
						<div>
							<ul class="sub-nav-sub">
								<li><a href="./noticeList.do">공지사항</a></li>
								<li><a href="./review.do">리뷰</a></li>
								<li><a href="./faqList.do">FAQ</a></li>
								<li><a href="./qnaList.do">Q&amp;A</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="header_space">
	</div>
	<script>
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 10) {
					$("nav").addClass("shrink");
					$(".logo li img").css('display', 'none');
					$(".logo2 li img").css('display', 'block');
				} else {
					$("nav").removeClass("shrink");
					$(".logo li img").css('display', 'block');
					$(".logo2 li img").css('display', 'none');
				}
			});
			$(".sub-nav > li:last-child").hover(function () {
	            $(".sub-nav-sub").css('display', 'block');
	        },
	        function() {
	            $(".sub-nav-sub").css('display', 'none');
	        });
		});
	</script>