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
   <link rel="stylesheet" type="text/css" href="./css/withdraw.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("header.jsp")
         $("#footer").load("footer.jsp")     
         
         $('.btn').click(function(event){
         	$(location.href="/setak/withdrawform.jsp");
         });
      });
    </script>
</head>
<body>
   <div id="header"></div>
   
    <!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="title"> <!-- 변경하시면 안됩니다. -->
		<div class="content">
			<!-- 변경하시면 안됩니다. -->
			<div class="title-text">
				<!-- 변경하시면 안됩니다. -->
			</div>
		</div>
	</section>
	
	<section id="test">	<!-- id 변경해서 사용하세요. -->
		<div class="content">	<!-- class 변경해서 사용하세요. -->
			<div class="mypage_head">
				<ul>
					<li class="mypage-title">마이페이지</li>
					<li>
						<ul class="mypage_list">
                     <li>주문관리</li>
                     <li><a href="orderview.jsp">주문/배송현황</a></li>
                     <li><a href="mykeep.jsp">보관현황</a></li>
                  </ul>
                  <ul class="mypage_list">
                     <li>정기구독</li>
                     <li><a href="mysub.jsp">나의 정기구독</a></li>
                  </ul>
                  <ul class="mypage_list">
                     <li>고객문의</li>
                     <li><a href="qnainquiry.jsp">Q&amp;A 문의내역</a></li>
                  </ul>
                  <ul class="mypage_list">
                     <li>정보관리</li>
                     <li><a href="password.jsp">개인정보수정</a></li>
                     <li><a href="mycoupon.jsp">쿠폰조회</a></li>
                     <li><a href="mysavings.jsp">적립금 조회</a></li>
                     <li><a href="withdraw.jsp">회원탈퇴</a></li>
                  </ul>
				</li>
				</ul>
			</div>
			<div class="test"> <!-- class 변경해서 사용하세요. -->
				<div class="content">
					<h2>본인 확인을 위해 비밀번호를 입력해 주세요</h2>
					<input class="pw" type="password" name="member_password" placeholder="비밀번호를 입력해주세요" />
					<input class="btn" type="button" name="submit" value="확인"/>
				</div>
			</div>
		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
   
   <div id="footer"></div>
</body>
</html>