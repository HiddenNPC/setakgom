<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>wash</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/index.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="dist/jquery.sliderPro.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function($) {
			$('#example1').sliderPro({
				width : 1200,
				height : 630,
				arrows : true,
				buttons : false,
				waitForLayers : true,
				thumbnailsPosition : 'top',
				thumbnailWidth : 200,
				thumbnailHeight :80,
				thumbnailPointer : true,
				autoplay : true,
				autoScaleLayers : false,
				breakpoints : {
					500 : {
						thumbnailWidth : 120,
						thumbnailHeight : 50
					}
				}
			});

			$(".tab").on("click", function() {
				$(".tab").removeClass("active");
				$(".tab-content").removeClass("show");
				$(this).addClass("active");
				$($(this).attr("href")).addClass("show");
			});
		});
	</script>
</head>
<body>
	<div id="container">
		<nav>
			<div class="content">
				<ul class="logo">
					<li><img src="images/logo.png" alt="로고"></li>
				</ul>
				<ul class="main-nav">
					<li><a href="#">로그인</a></li>
					<!--<li><a href="#">로그아웃</a></li>-->
					<li><a href="#">회원가입</a></li>
					<!--<li><a href="#">마이페이지</a></li>-->
					<!--<li><a href="#">장바구니</a></li>-->
				</ul>
				<ul class="sub-nav">
					<li><a href="#">회사소개</a></li>
					<li><a href="#">정기구독</a></li>
					<li><a href="./setak.st">세탁서비스</a></li>
					<li><a href="#">수선서비스</a></li>
					<li><a href="#">보관서비스</a></li>
					<li><a href="#">커뮤니티</a>
						<div>
							<ul class="sub-nav-sub">
								<li><a href="#">공지사항</a></li>
								<li><a href="#">리뷰</a></li>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Q&amp;A</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<header>
		</header>
		<section id="use-area">
			<div class="content">
				<h1>세탁곰 이용방법</h1>
				<div class="tabs">
					<div class="tab-list">
						<a href="#one" class="tab active">세탁</a>
						<a href="#two" class="tab">수선</a>
						<a href="#three" class="tab">보관</a>
					</div>

					<div id="one" class="tab-content show">
						<div id="example1" class="slider-pro">
							<div class="sp-thumbnails">
								<div class="sp-thumbnail">
									<div class="sp-thumbnail-title">1. 서비스신청</div>
								</div>
								<div class="sp-thumbnail">
									<div class="sp-thumbnail-title">2. 웰컴키트 받기</div>
								</div>
								<div class="sp-thumbnail">
									<div class="sp-thumbnail-title">3. 스마트키 연결</div>
								</div>
								<div class="sp-thumbnail">
									<div class="sp-thumbnail-title">4. 수거 요청</div>
								</div>
								<div class="sp-thumbnail">
									<div class="sp-thumbnail-title">5. 세탁 진행</div>
								</div>
								<div class="sp-thumbnail">
									<div class="sp-thumbnail-title">6. 빨래 끝</div>
								</div>
							</div>
							<div class="sp-slides">
								<div class="sp-slide">
									<img class="sp-image"
										src="http://bqworks.com/slider-pro/images/image1_large.jpg" />
								</div>
								<div class="sp-slide">
									<img class="sp-image"
										src="http://bqworks.com/slider-pro/images/image2_large.jpg" />
								</div>
								<div class="sp-slide">
									<img class="sp-image"
										src="http://bqworks.com/slider-pro/images/image3_large.jpg" />
								</div>
								<div class="sp-slide">
									<img class="sp-image"
										src="http://bqworks.com/slider-pro/images/image4_large.jpg" />
								</div>
								<div class="sp-slide">
									<img class="sp-image"
										src="http://bqworks.com/slider-pro/images/image5_large.jpg" />
								</div>
								<div class="sp-slide">
									<img class="sp-image"
										src="http://bqworks.com/slider-pro/images/image6_large.jpg" />
								</div>
							</div>
						</div>
					</div>
					<div id="two" class="tab-content">
					Assumenda natus, debitis at
					non tenetur nam dignissimos id alias neque vero illo eius quidem
					quaerat, animi voluptas repellat quis. Tenetur, rem.
					</div>
					<div id="three" class="tab-content">
						Lnon cum minima delectus
						quas excepturi quia temporibus.
					</div>
				</div>
			</div>
		</section>
		<section id="about-area">
			<div class="content">
			 	<ul>
					<li>
						<h3>세탁</h3>
						<h4>wish your better life</h4>
						<p>세탁곰은 여러분의 하루가 편하고 깨끗해져 삶이 풍요로워 지길 바랍니다. 항상 새 옷을 입는 듯한 상쾌함과 디테일한 세탁 서비스를 제공해 드리고 있으며, 고객님의 더 나은 삶과 만족을 위해 오늘도 연구하고 있습니다.</p>
					</li>
					<li>
						<h3>수선</h3>
						<h4>design your life</h4>
						<p>세탁곰은 여러분의 하루가 편하고 깨끗해져 삶이 풍요로워 지길 바랍니다. 항상 새 옷을 입는 듯한 상쾌함과 디테일한 세탁 서비스를 제공해 드리고 있으며, 고객님의 더 나은 삶과 만족을 위해 오늘도 연구하고 있습니다.</p>
					</li>
					<li>
						<h3>보관</h3>
						<h4>save your time</h4>
						<p>세탁곰은 여러분의 하루가 편하고 깨끗해져 삶이 풍요로워 지길 바랍니다. 항상 새 옷을 입는 듯한 상쾌함과 디테일한 세탁 서비스를 제공해 드리고 있으며, 고객님의 더 나은 삶과 만족을 위해 오늘도 연구하고 있습니다.</p>
					</li>
				</ul>
			</div>
		</section>
		<div id="go-top">TOP</div>
		<footer>
			<div class="content">
				<ul>
					<li>㈜세탁곰컴퍼니</li>
					<li><i class="fab fa-youtube"></i><i class="fab fa-instagram"></i><i class="fab fa-twitter"></i></li>			
				</ul>
				<hr>
				<p>대표 : 세탁곰 | 주소 : 서울 서초구 강남대로 459</p>
				<p>사업자 등록번호 : 123-12-123456 | 통신판매업신고 : 제1234-서울 강남-1234호</p>
				<p>고객센터 : 1234-1234 평일 오전 9시 ~ 오후 9시, 주말/공휴일 오전 9시~ 오후 6시 영업시간 외 카톡채팅만 가능합니다. | 카카오톡 @세탁곰</p>
			</div>
		</footer>
	</div>
	<script>
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() >= $("#use-area").position().top) {
					$("nav").css('display', 'none');
				}
				if ($(window).scrollTop() <= $("#use-area").position().top) {
					$("nav").css('display', 'block');
				}
			});

			$(".sub-nav > li").hover(function () {
	            $(".sub-nav-sub", this).slideDown(500);
	        },
	        function() {
	            $(".sub-nav-sub", this).slideUp(500);
	        });
			
			var windowWidth = $(window).width();
			if (windowWidth > 769) {
				$('a').click(function() {
					$('html, body').animate({
						scrollTop : $($.attr(this, 'href')).offset().top - 150
					}, 500);
					return false;
				});
			}

			$(window).scroll(function() {
				if ($(window).scrollTop() > 10) {
					$("#go-top").fadeIn(100)
				} else {
					$("#go-top").fadeOut(100);
				}
			});

			$("#go-top").on("click", function() {
				$("html, body").animate({
					scrollTop : 0
				}, 500);
			});
		});
	</script>
</body>
</html>
