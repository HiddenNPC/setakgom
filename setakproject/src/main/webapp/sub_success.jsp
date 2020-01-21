<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰 결제완료</title>
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
   <section id="sub_success"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
         <div class="title-text"> <!-- 변경하시면 안됩니다. -->
            <h2>결제완료</h2>
         </div>
         
         <div class = "div-1000">
	 
	 		<hr/>
			
			<h1 style = "margin-bottom : 100px;">xx님 구독 신청을 감사합니다.</h1>

			<table class = "sub_success_table">
				<thead>
					<th colspan = "7" align = "left" style = "height : 50px; background-color : #3498db"> &nbsp; &nbsp; 구독 상품 확인 (올인원59)</th>
				</thead>
				<tbody align = "center">
					<tr>
						<td>물빨래 30L</td>
						<td>와이셔츠</td>
						<td>드라이클리닝</td>
						<td>이불</td>
						<td>보관 1BOX <br/>(1개월 쿠폰)</td>
						<td>배송</td>
						<td>금액</td>
					</tr>
					<tr>
						<td colspan = "7" style = "height :3px; background-color : #3498db"></td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>				
				</tbody>
			</table>
			
			<div class="notice" style = "padding-top : 100px;">
	            <p>※ 구독관련 내용 확인은 마이페이지 > 나의 정기구독에서 확인 가능합니다.</p>
	      	</div>
	      	        		
			<button class = "service_btn">서비스 둘러보기</button>
	      	        
	      </div>
	    
      </div>
   </section>
   <!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
   
   <div id="footer"></div>
</body>
</html>