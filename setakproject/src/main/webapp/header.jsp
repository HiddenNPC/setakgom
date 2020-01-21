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
					<li><a href="./login.do">로그인</a></li>
					<!--<li><a href="#">로그아웃</a></li>-->
					<li><a href="./join.do">회원가입</a></li>
					<!--<li><a href="#">마이페이지</a></li>-->
					<!--<li><a href="#">장바구니</a></li>-->
				</ul>
				<ul class="sub-nav">
					<li><a href="./hist.st">회사소개</a></li>
					<li><a href="./subscribe.st">정기구독</a></li>
					<li><a href="./setak.st">세탁서비스</a></li>
					<li><a href="./mending.st">수선서비스</a></li>
					<li><a href="./keep.st">보관서비스</a></li>
					<li><a href="#">커뮤니티</a>
						<div>
							<ul class="sub-nav-sub">
								<li><a href="./noticeList.st">공지사항</a></li>
								<li><a href="./review.st">리뷰</a></li>
								<li><a href="./qnaList.co">FAQ</a></li>
								<li><a href="./faq.st">Q&amp;A</a></li>
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