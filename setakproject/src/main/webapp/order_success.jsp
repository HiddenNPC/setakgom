<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰 주문완료</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="./css/default.css"/>
   <link rel="stylesheet" type="text/css" href="./css/success.css"/>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("./header.jsp")
         $("#footer").load("./footer.jsp")     
      });
    </script>
</head>
<body>
   <div id="header"></div>
   
   <!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
   <section id="order_success"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
         <div class="title-text"> <!-- 변경하시면 안됩니다. -->
            <h2>주문완료</h2>
         </div>
         
         <div class = "div-1000">
	         <img class = "arrow-img" src = "images/order3.png" />
	 
	 		<hr/>
			
			<h1>주문해 주셔서 감사합니다.</h1>
			<br/>
			주문하신 주문번호는 아래와 같습니다!
			<br/>
			<p class = "p_orderNum">987654 - 32109876</p>
			
			<table class = "order_success_table">
				<thead>
					<th colspan = "5" align = "left"> &nbsp; &nbsp; 주문 상품 확인 (총 83,000원)</th>
				</thead>
				<tbody align = "center">
					<tr>
						<td>구분</td>
						<td>종류</td>
						<td>수량</td>
						<td>가격</td>
						<td>비고</td>
	
					</tr>
					<tr>
						<td colspan = "5" style = "height :3px; background-color : #3498db"></td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
	
					</tr>				
				</tbody>
			</table>
		
			<div class="notice">
	            <p>※ 주문내역 확인은 마이페이지 > 주문/배송 현황에서 확인 가능합니다.</p>
	      	</div>
	      	        
	      </div>
	    
      </div>
   </section>
   <!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
   
   <div id="footer"></div>
</body>
</html>