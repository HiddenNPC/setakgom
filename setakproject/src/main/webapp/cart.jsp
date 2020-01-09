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
	<link rel="stylesheet" type="text/css" href="./css/cart.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("header.jsp")
         $("#footer").load("footer.jsp")     
      });
    </script>
</head>
<body>
	<div id="header"></div>
	
	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="cart"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
			<div class="title-text"> <!-- 변경하시면 안됩니다. -->
				<h2>장바구니</h2>
			</div>
						
			<div class = "cart-div">
							
				<img class = "arrow-img" src = "images/arrow.PNG" />
				
				<table class = "cart_list">
					<thead>
						<tr>
							<th></th>
							<th>구분</th>
							<th>종류</th>
							<th>수량</th>
							<th>가격</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody align = "center">
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>50000원</td>
							<td>물세탁</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>50000원</td>
							<td>물세탁</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>50000원</td>
							<td>물세탁</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>50000원</td>
							<td>물세탁</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>50000원</td>
							<td>물세탁</td>
						</tr>			
					</tbody>
				</table>
				
				<p/>
			
				<table class = "cart_price">
					<thead>
						<tr>
							<th>주문금액</th>
							<th></th>
							<th>배송비</th>
							<th></th>
							<th>결제 예정금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>86,000원</td>
							<td class = "td_big">+</td>
							<td>0원</td>
							<td class = "td_big">=</td>
							<td class = "td_blue">86,000원</td>
						</tr>
					</tbody>
				</table>
				
				<button class = "bt_1000">주문결제</button>
		</div>
		

		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
</body>
</html>