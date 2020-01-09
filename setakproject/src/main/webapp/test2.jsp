<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/test.css" />
<!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="dist/jquery.sliderPro.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#header").load("header.jsp")
		$("#footer").load("footer.jsp")
	});
</script>
</head>
<body>
	<div id="header"></div>

	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="test">
		<!-- id 변경해서 사용하세요. -->
		<div class="content">
			<!-- 변경하시면 안됩니다. -->
			<div class="mypage_head" style="width: 12%; float: left;">
				<ul>
					<li class="mypage-title">마이페이지</li>
					<li>
						<ul class="mypage_list">
							<li>주문관리</li>
							<li>주문/배송현황</li>
							<li>보관현황</li>
						</ul>
						<ul class="mypage_list">
							<li>정기구독</li>
							<li>나의 정기구독</li>
						</ul>
						<ul class="mypage_list">
							<li>고객문의</li>
							<li>Q&amp;A 문의내역</li>
						</ul>
						<ul class="mypage_list">
							<li>정보관리</li>
							<li>개인정보수정</li>
							<li>쿠폰조회</li>
							<li>적립금 조회</li>
							<li>회원탈퇴</li>
						</ul>
					</li>
				</ul>
			</div>
			<div style="width: 85%; float: right;">
				<div class="title-text">
					<!-- 변경하시면 안됩니다. -->
					<h2>보관 현황</h2>
				</div>
				<br>
				<div class="test2"></div>
				<br>
				<div class="accordion2">
					<div class="accordion-header2">
						<table style="width: 600px; height: 30px;">
							<tr>
								<td>주문번호</td>
								<td>박스 수량</td>
								<td>보관 기관</td>
							</tr>
							<tr>
								<td>987654-321465</td>
								<td>2BOX</td>
								<td>2020.01.27~2020.07.27</td>
							</tr>
						</table>
					</div>
					<div class="accordion-content2">
						<table style="width: 660px; height: 10px;" border="1">
							<tr>
								<td>보관하신품목</td>
							</tr>
						</table>

						<div>
							<ul class="slides">
								<input type="radio" name="radio-btn" id="img-1" checked />
								<li class="slide-container">
									<div class="slide">
										<img src="images/more.jpg" />
									</div>
									<div class="nav">
										<label for="img-6" class="prev">&#x2039;</label> 
										<label for="img-2" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-2" />
								<li class="slide-container">
									<div class="slide">
										<img src="http://farm9.staticflickr.com/8504/8365873811_d32571df3d_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-1" class="prev">&#x2039;</label> 
										<label for="img-3" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-3" />
								<li class="slide-container">
									<div class="slide">
										<img src="http://farm9.staticflickr.com/8068/8250438572_d1a5917072_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-2" class="prev">&#x2039;</label> 
										<label for="img-4" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-4" />
								<li class="slide-container">
									<div class="slide">
										<img src="http://farm9.staticflickr.com/8061/8237246833_54d8fa37f0_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-3" class="prev">&#x2039;</label> 
										<label for="img-5" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-5" />
								<li class="slide-container">
									<div class="slide">
										<img src="http://farm9.staticflickr.com/8055/8098750623_66292a35c0_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-4" class="prev">&#x2039;</label> 
										<label for="img-6" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-6" />
								<li class="slide-container">
									<div class="slide">
										<img src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-5" class="prev">&#x2039;</label> 
										<label for="img-1" class="next">&#x203a;</label>
									</div>
								</li>

								<li class="nav-dots">
								<label for="img-1" class="nav-dot" id="img-dot-1"></label> 
								<label for="img-2" class="nav-dot"id="img-dot-2"></label> 
								<label for="img-3" class="nav-dot" id="img-dot-3"></label> 
								<label for="img-4" class="nav-dot" id="img-dot-4"></label> 
								<label for="img-5" class="nav-dot" id="img-dot-5"></label> 
								<label for="img-6" class="nav-dot"id="img-dot-6"></label>
								</li>
							</ul>
							<div class="keepbox" style="border-right:1px solid rgb(255, 255, 255);">보관 기간 연장</div>
							<div class="keepbox">반환 신청</div>
						</div>
						<br><br><br>
						
						<div class = "subscription-div">
							<div class="subscription1">
								<h1>1개월</h1><br><br>
								<h6>2020.01.03 ~ 2020.02.02</h6><br><br>
								<h1>10,000원</h1> 			
							</div>
							<div class="subscription2">
								<h1>3개월</h1><br><br>	
								<h6>2020.01.03 ~ 2020.04.02</h6><br><br>	
								<h1>28,000원</h1> 		
							</div>
							<div class="subscription3">
								<h1>6개월</h1><br><br>	
								<h6>2020.01.03 ~ 2020.07.02</h6><br><br>	
								<h1>50,000원</h1>		
							</div>
						</div>

					
					</div> <!-- content -->
					
					<br>

				</div>
			</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->

	<div id="footer"></div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</body>
<script>
	$(function() {
		$(".accordion-header2").on("click", function() {
			$(this).toggleClass("active").next().slideToggle(200);
		});
	});
</script>
</html>