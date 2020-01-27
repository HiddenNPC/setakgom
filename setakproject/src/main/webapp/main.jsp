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
			var windowWidth = $(window).width();
			if (windowWidth > 767) {
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
			} else{
				$('#example1').sliderPro({
			
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
			}

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
				<div>
					<ul class="logo">
						<li><img src="images/logo.png" alt="로고"></li>
					</ul>
					<ul class="main-nav">
					<%
						if(session.getAttribute("member_id")==null){
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
				<div>
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
						<p>세탁곰은 한 땀 한 땀 핏을 살려주는 전문 수선사들의 감각적인 디자인을 통해 옷의 가치는 그대로, 퀄리티는 한층 더 업그레이드해 드립니다. 고객님의 옷에 '날개'를 달아보세요.</p>
					</li>
					<li>
						<h3>보관</h3>
						<h4>save your time</h4>
						<p>세탁곰의 보관 서비스는 의류보관에 최적화된 환경과 차별화된 시스템을 보유하고 있습니다. 한쪽 구석에 쌓아두었던 소중한 옷들 저희 세탁곰이 안전하게 보관하겠습니다. 고객님의 공간에 여유를 가져보세요.</p>
					</li>
				</ul>
			</div>
		</section>
		<div id="go-top">TOP</div>
		<footer>
			<div class="content">
				<ul>
					<li>㈜세탁곰컴퍼니</li>
					<li><a href="https://www.youtube.com/channel/UChTTbqy5Wd_GPaGCZLJcpFA/" target="_blank"><i class="fab fa-youtube"></i></a><a href="https://www.instagram.com/laundrybear138/?hl=ko" target="_blank"><i class="fab fa-instagram"></i></a><a href="https://twitter.com/laundrybear138"><i class="fab fa-twitter"></i></a></li>			
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
			//스크롤에따라 네비게이션 보이고 안보이고 
			$(window).scroll(function() {
				if ($(window).scrollTop() >= $("#use-area").position().top) {
					$("nav").css('display', 'none');
				}
				if ($(window).scrollTop() <= $("#use-area").position().top) {
					$("nav").css('display', 'block');
				}
			});
			
			//커뮤니티 메뉴 hover시.
			$(".sub-nav > li:last-child").hover(function () {
	            $(".sub-nav-sub").css('display', 'block');
	        },
	        function() {
	            $(".sub-nav-sub").css('display', 'none');
	        });
			
			//화면 너비 769초과일 때 세탁,수선,보관 탭 누르면 탭 위로 위치 자동으로 가게 해줌.
			var windowWidth = $(window).width();
			if (windowWidth > 769) {
				$('a').click(function() {
					$('html, body').animate({
						scrollTop : $($.attr(this, 'href')).offset().top - 150
					}, 500);
					return false;
				});
			
				//스크롤 한칸이라도 내리면 오른쪽 아래 top 버튼 생성
				$(window).scroll(function() {
					if ($(window).scrollTop() > 10) {
						$("#go-top").fadeIn(100)
					} else {
						$("#go-top").fadeOut(100);
					}
				});
				
				//top버튼 누르면 맨 위로 올라가게.
				$("#go-top").on("click", function() {
					$("html, body").animate({
						scrollTop : 0
					}, 500);
				});
			}
		});
	</script>
</body>
</html>
