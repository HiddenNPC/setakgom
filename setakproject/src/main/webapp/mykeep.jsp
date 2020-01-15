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
<link rel="stylesheet" type="text/css" href="./css/mykeep.css" />
<!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="dist/jquery.sliderPro.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#header").load("./frame/header.jsp")
		$("#footer").load("./frame/footer.jsp")
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
				<div class="mypage_content">
				<h2>보관현황</h2>
				<div class="mypage_content_cover2">
				<div class="accordion2">
					<div class="accordion-header2">
						<table class="header" >
							<tr>
								<th style="width:30%;">주문번호</th>
								<th style="width:20%;">박스 수량</th>
								<th style="width:40%;">보관 기관</th>
								<th style="width:10%;">상세보기</th>
							</tr>
							<tr>
								<td>987654-321456</td>
								<td>2BOX</td>
								<td>2020.01.28 ~ 2020.07.27</td>
								<td>
									<button id='up' class="up">&#8897;</button>
								</td>
							</tr>	
						</table>
					</div>
					<div class="accordion-content2">
						<table>
							<tr>
								<td>보관하신품목</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>상의</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>하의</td>
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
										<img src="images/pure.jpg" />
									</div>
									<div class="nav">
										<label for="img-1" class="prev">&#x2039;</label> 
										<label for="img-3" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-3" />
								<li class="slide-container">
									<div class="slide">
										<img src="images/smoke.jpg" />
									</div>
									<div class="nav">
										<label for="img-2" class="prev">&#x2039;</label> 
										<label for="img-4" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-4" />
								<li class="slide-container">
									<div class="slide">
										<img src="images/more.jpg" />
									</div>
									<div class="nav">
										<label for="img-3" class="prev">&#x2039;</label> 
										<label for="img-5" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-5" />
								<li class="slide-container">
									<div class="slide">
										<img src="images/smoke.jpg" />
									</div>
									<div class="nav">
										<label for="img-4" class="prev">&#x2039;</label> 
										<label for="img-6" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-6" />
								<li class="slide-container">
									<div class="slide">
										<img src="images/pure.jpg" />
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
							<div class="keepbox2">
								반환 신청
							</div>
						</div>
						<br><br><br>
						<div class="keep_month">
						<ul>
							<li class="month"><h3>1개월</h3><p>2020.01.03 ~ 2020.02.02</p><h1><span class="price">10000</span>원</h1></li>
							<li class="month"><h3>3개월</h3><p>2020.01.03 ~ 2020.04.02</p><h1><span class="price">28000</span>원</h1></li>
							<li class="month"><h3>6개월</h3><p>2020.01.03 ~ 2020.07.02</p><h1><span class="price">55000</span>원</h1></li>
						</ul>
						<div class="total_price">
							<p>보관비 총 금액 : <span class="tot_price">0</span>원</p>
						</div>
						<button class="pay_btn">결제하기</button> 	
						</div>
						<div class="rt-service">
							<table>
								<tr>
									<th width="20%">종류</th>
									<th width="80%">옷의 특징을 상세히 입력해주세요.</th>
								</tr>
								<tr>
									<td>
										<select name="rt-list">
											<option value="셔츠">셔츠</option>
											<option value="가디건">가디건</option>
											<option value="바지">바지</option>
										</select>
									</td>
									<td>
									<textarea rows="2" cols="30" placeholder="상세내용"></textarea>
									</td>
								</tr>
							</table>
						</div>
					</div> 
					<br>
					</div>
				</div>
				</div>
			</div>
		</div><!-- content -->
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	   <!-- 나의 주소록 레이어 -->
	<div id="footer"></div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
//보관기간 선택 시 css효과, 보관기간의 돈 값 가져와서 합계에 보여주기.
var monthclick = 0;
var price = parseInt(0);
$(".month").on("click", function(){
	$(".month").removeClass("month_click");
	$(this).addClass("month_click");
	monthclick = 1;
	price = parseInt($($(this).children().children('.price')).html());
	var n = $('.count').index(this);
	$('.tot_price').html(price);
	$.pricefun(n);
});


//수량에 따른 값변경
$.pricefun = function(n){
	var num = parseInt($(".box_count:eq(" + n + ")").val());
	
};



	$(document).ready(function() {
	  jQuery(".accordion-content2").hide();
	//content 클래스를 가진 div를 표시/숨김(토글)
	
	  $(".accordion-header2").click(function(){
		$except = $(this);
		$except.toggleClass("active");
	    $(".accordion-content2")
	    	.not($(this).next(".accordion-content2").slideToggle(500)).slideUp();
	    $('.mypage_content_cover2').find('.accordion2>.accordion-header2').not($except).removeClass("active");
	  });
	});
</script>
<script>
$(document).ready(function() {
	jQuery(".rt-service").hide();
	$(".keepbox2").click(function() {
		$except = $(this);
		$except.toggleClass("active");
		$(".rt-service").slideToggle(300);
		$(".keep_month").slideUp(0);
	});
});

</script>
<script>
$(document).ready(function() {
 	  jQuery(".keep_month").hide();
 	//content 클래스를 가진 div를 표시/숨김(토글)
 	  $(".keepbox").click(function(){
 		$except = $(this);
		$except.toggleClass("active");
		$(".keep_month").slideToggle(200);
		$(".rt-service").slideUp(0);
 	  });
 	// 결제 : 아임포트 스크립트
 	 $(".pay_btn").on("click", function(){
 	    
 	    // 결제 금액 받아오기 
 	    var select_price = $(".tot_price").text().slice(0,-1);

 	    
        var IMP = window.IMP; // 생략가능
        IMP.init('imp04669035'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '세탁곰 결제',
            amount : price,
            buyer_email : 'minchoi9509@gmail.com',
            buyer_name : '민경',
            buyer_tel : '010-8848-2996',
            buyer_addr : '서울',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요. 결제 완료 이후
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="/setak/keep.jsp";
                alert(msg);
            }
        });
 	  });
 	});
</script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
 $(function() {
	$('.up').on("click",function() {
		console.log($(this).html())
		if($(this).html() == '⋁'){
			$(this).html('&#8896;')
		}
		else{
			$(this).html('&#8897;');
		}
	});
});
 
</script>
</html>