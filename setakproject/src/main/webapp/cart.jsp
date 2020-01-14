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
	<link rel="stylesheet" type="text/css" href="./css/cart.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

    <script type="text/javascript">
      $(document).ready(function(){
    	  
         $("#header").load("header.jsp")
         $("#footer").load("footer.jsp")   
         
         getTotal(); 
         
	    /* 체크박스 전체선택 */
		$("#allcheck").click(function(){
	        //클릭되었으면
	        if($("#allcheck").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
	            $("input[name=check]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=check]").prop("checked",false);
	        }
	    });
         
         /* 체크박스 삭제 */
     	$(".total-button a").click(function(){
     		var checkbox = $("input[name=check]:checked");
     		checkbox.each(function(){
     			var tr = checkbox.parent().parent();
     			tr.remove();
     			getTotal(); 
     		}) 
     		
     	});
                      
      });
      
      // 합계 구하는 함수
      function getTotal() {
    	  var total = 0; 
          $('.product_price').each(function() {
	          var price = parseInt($(this).text().slice(0, -1)); 
	          total += price; 
          });
          $("#pay_price").html(numberFormat(total+'원'));
          $("#order_price").html(numberFormat(total+'원'));
      }
      
      function numberFormat(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }
      
    </script>
<body>
	<div id="header"></div>
	
	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="cart"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
			<div class="title-text"> <!-- 변경하시면 안됩니다. -->
				<h2>장바구니</h2>
			</div>
						
			<div class = "cart-div">
							
				<img class = "arrow-img" src = "images/order1.png" />
				
				<table class = "cart_list">
					<thead>
						<tr>
							<th><input id = "allcheck" type = "checkbox" /></th>
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
							<td>2장</td>
							<td class = "product_price">50000원</td>
							<td>물세탁</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁</td>
							<td>셔츠</td>
							<td>2장</td>
							<td class = "product_price">50000원</td>
							<td>물세탁</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁-수선</td>
							<td>상의</td>
							<td>3장</td>
							<td class = "product_price">40000원</td>
							<td>소매줄임</td>
						</tr>			
						<tr>
							<td><input type = "checkbox" name = "check" /></td>
							<td>세탁-보관</td>
							<td></td>
							<td>3박스</td>
							<td class = "product_price">5000원</td>
							<td>6개월</td>

						</tr>						
					</tbody>
				</table>
				
				<p/>

				<div class="total-button">
					<a href="javascript:">선택삭제</a>
				</div>

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
							<td><span id = "order_price"></span></td>
							<td class = "td_big">+</td>
							<td>0원</td>
							<td class = "td_big">=</td>
							<td class = "td_blue"><span id = "pay_price"></span></td>
						</tr>
					</tbody>
				</table>
				
				<button class="bt_1000" onclick="location.href='/setak/order.st'">주문결제</button>
		</div>
		

		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
</body>
</html>