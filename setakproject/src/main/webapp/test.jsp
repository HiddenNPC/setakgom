<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/test.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("header.jsp")
         $("#footer").load("footer.jsp")     
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
					<h2>주문/배송 현황</h2>
				</div>
				<br>
				<div class="test2">
					<!-- class 변경해서 사용하세요. -->
					<p>
						<font size=2.5rem>※ 취소 버튼은 신청 당일 밤 10시 전까지만 활성화됩니다. 이후 취소는 불가합니다.</font>
					</p>
				</div>
				<br>
				<div class="accordion">
					<div class="accordion-header">주문일자 : 2020/01/18 03:42</div>
					<div class="accordion-content">
						<!--snb -->
						<div class="snb">
							<p>.snb</p>
							<br><br><br><br><br><br><br><br>
							<a href="#" class="button">주문 취소</a>
						</div>
						<!--//snb -->
						<!--content -->
						<div id="row_content">
							<p>#content</p>
						</div>
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
       $(".button").on("click", function () {
           $(this)
           	if (confirm("주문을 취소하시겠습니까??") == true){
              	document.write("확인")
           	}else{
           		document.write("아니오")
           	}
       });
    });
    
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