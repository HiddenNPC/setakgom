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
	<link rel="stylesheet" type="text/css" href="./css/mysavings.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("./frame/header.jsp")
         $("#footer").load("./frame/footer.jsp")     
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
			<div style="width: 85%; float: right;">
				<div class="mypage_content">
				<h2>적립금 조회</h2>
				<div class="mypage_content_cover">
				<div class="savings_point">
					<table>
						<tr>
							<td class="point1">-&nbsp;총 적립금</td>
							<td class="point2">25,000</td>
						</tr>
						<tr>
							<td class="point1">-&nbsp;사용된 적립금</td>
							<td class="point2">22,000</td>
						</tr>
						<tr>
							<td class="point1">-&nbsp;사용가능 적립금</td>
							<td class="point2">3,000</td>
						</tr>	
					</table>
					<table id="jqGrid"></table>
					<div id="jqGridPager"></div>
				</div>
				<div class="savings-title">
					<div>
						<table class="savings">
							<thead align="center">
								<tr>
									<th width="28%">적립 날짜</th>
									<th width="28%">적립금</th>
									<th width="44%">적립내용</th>
								</tr>
							</thead>
							<%for (int i=0; i<10; i++){ %>
							<tbody align="center">
								<tr>
									<td>2020-01-18</td>
									<td>2,000원</td>
									<td>리뷰이벤트</td>
								</tr>
							</tbody>					
							<%} %>	
						</table>
					</div>
					</div>
					<div class="page1">
						<table class="page">
							<tr align = center height = 20>
              				<td>
              					<div class="page_a"><a href = "#">&#60;</a></div>
                  				<div class="page_a"><a>1</a></div>
                  				<div class="page_a"><a>2</a></div>
                  				<div class="page_a"><a>3</a></div>
                  				<div class="page_a"><a href = "">&#62;</a></div>
                  			</td>
               			</tr>
					</table>
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
       $(".accordion-header").on("click", function () {
           $(this)
               .toggleClass("active")
               .next()
               .slideToggle(200);
       });
    });
</script>
</html>