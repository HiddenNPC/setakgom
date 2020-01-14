<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/mysub.css" />
<!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#header").load("header.jsp")
		$("#footer").load("footer.jsp")
		
		 //수거고 클릭
		 $("#go").on("click", function() {  
			 
				$("#cancletxt").css('display', 'none');	 
		        $("#gotxt").css({
		            "top": (($(window).height()-$("#gotxt").outerHeight())/2+$(window).scrollTop())+"px",
		            "left": (($(window).width()-$("#gotxt").outerWidth())/2+$(window).scrollLeft())+"px"
		            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
		           
		            }); 
		        $(".popup_back").css("display","block"); //팝업 뒷배경 display block
		        $("#gotxt").css("display","block"); //팝업창 display block
		        
		        $("#go").css('display', 'none');
				$("#cancle").css('display', 'block');
		        
		    });
			//수거고 - 확인
			$(".pop_btn").click(function(event){
		        $(".popup_back").css("display","none"); //팝업창 뒷배경 display none
		        $(".popup").css("display","none"); //팝업창 display none
		    });
		
		//수거취소 클릭
		 $("#cancle").on("click", function() {  
		        $("#cancletxt").css({
		            "top": (($(window).height()-$(".popup").outerHeight())/2+$(window).scrollTop())+"px",
		            "left": (($(window).width()-$(".popup").outerWidth())/2+$(window).scrollLeft())+"px"
		           
		            }); 
		        
		        $(".popup_back").css("display","block"); //팝업 뒷배경 display block
		        $("#cancletxt").css("display","block"); //팝업창 display block

		    });		
		
		
		//수거취소 - 수거취소
		 $(".pop_btn2").click(function(event){
		        $(".popup_back").css("display","none"); //팝업창 뒷배경 display none
		        $(".popup").css("display","none"); //팝업창 display none
		        
		        $("#go").css('display', 'block');
				$("#cancle").css('display', 'none');
		    });
		 
		//수거취소 - 수거접수
		 $(".pop_btn3").click(function(event){
		        $(".popup_back").css("display","none"); //팝업창 뒷배경 display none
		        $(".popup").css("display","none"); //팝업창 display none
		        
		        $("#go").css('display', 'none');
				$("#cancle").css('display', 'block');
		    }); 
		
		//구독해지 클릭
		   $("#sub").on("click", function() {
			    $(".popup_back").css("display","block");
				$("#subcancle").css('display', 'block');
			});

			$("#pop_btn5").on("click", function() {
				$("#subcancle").css('display', 'none');
			});
			

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
			<div class="mypage_head">
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
			<div class="mypage_content"> 
				<h2>나의정기구독</h2>
				<div class="mysub">
					<!-- class 변경해서 사용하세요. -->
					<div class="one">
						<ul class="mysub_top">
							<li class="list">요금제</li>
							<li class="list">물빨래 30L</li>
							<li class="list">와이셔츠</li>
							<li class="list">드라이클리닝</li>
							<li class="list">이불</li>
							<li class="list">배송</li>
							<li class="list">수거</li>
							<li class="list">구독해지</li>
						</ul>
					</div>
					<div class="two">
						<ul class="mysub_bottom">
							<li class="">올인원59</li>
							<li class="">2/3개</li>
							<li class="">15장</li>
							<li class="">3장</li>
							<li class="">-</li>
							<li class="">3회</li>
							<li class="btn">
								<a id="go" class="help">수거고 </a> 
								<a id="cancle" href="javascript:">수거취소</a>
							</li>
							<li class="btn">
								<a id="sub" href="javascript:">해지</a>
							</li>
						</ul>
						
					</div>
					
				<br>
				<p>※ 수거고를 누르시면 다음날 수거가 이루어집니다.</p>
				<p>※ 수거 취소는 수거 신청 버튼을 누른 당일 밤 10시까지만 가능하니 유의해주세요.</p>
				<p>※ 구독해지는 당일이 아닌 다음 달부터 구독 해지가 이루어집니다.</p>

<!--           popup -->
                <div class="popup_back"></div> <!-- 팝업 배경 DIV -->
        
        		<!-- 수거고 팝업창 -->
                <div class="popup" id="gotxt"> 
                	<img src="images/popup.png">
                    <div class="text">
                                                     수거 신청이 되었습니다.<br><br>
                        0월 0일 수거됩니다.
                    </div>
                    <div class="pop_btn">확인</div>
                </div>    
                 
                 <!-- 수거취소 팝업창 -->
                 <div class="popup" id="cancletxt"> 
                	<img src="images/popup.png">
                    <div class="text">
                    	수거취소  하시겠어요?<br><br>
                    	취소는 신청 당일 저녁 10시까지 가능합니다.
                    </div>
                    <div class="pop_btn2">수거취소</div>
                    <div class="pop_btn3">수거접수</div>
                </div>
                
                <!-- 구독해지 팝업창 -->
                 <div class="subcancle" id="subcancle">
                 	<div class="sub_image">
                 		<img src="images/clothes1.png">
                 	</div> 
        			<div class="text">
           				<h3>00님</h3><br>
            			<h2>잠깐만요!!</h2><br>
            			<br>             
            			<h5>지금 정기구독을 해지하시면,</h5>
        			</div>
        			<div id="mine">
            			최대 <c>60%</c>저렴한 정기구독권
            			보관 1BOX 1개월 쿠폰 
            			구독회원 전용 <c>상시 이벤트</c>
        			</div>
        			<div class="last">
            			이 모든 세탁곰 <d>정기구독 전용 혜택</d>이 사라져요
            			그래도 해지하시겠어요?
            			<d>구독해지는 당일이 아닌 다음 달부터 구독 해지가 이루어집니다.</d>
        			</div>
        			<div class="pop_btn4">구독하고 혜택 유지</div>
        			<div class="pop_btn5">해지하고 혜택 포기</div>
    			</div>
                
            </div><!-- mysub -->
			</div><!-- mypage_content -->
		</div><!-- content -->
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->

	<div id="footer"></div>
</body>
                
</html>