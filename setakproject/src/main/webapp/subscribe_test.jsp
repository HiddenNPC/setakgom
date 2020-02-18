<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.spring.member.MemberVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰 정기구독</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>

   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   
   <style>
   
		@media screen and (max-width:768px) {
			   	.subImg {
			   	width : 100%; 
		   	}
			
		}
   </style>
</head>
<body>

	<div id="header"></div>
		
   <!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
   <section id="subscribe"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
		<div class = "div-1000">	
	         <div class="title-text"> <!-- 변경하시면 안됩니다. -->
	            <h2>정기구독</h2>
	         </div>
	                
	       	<div class="sub-div">
		         <p class = "p_subtitle">정기구독을 하시면 최대 60% 저렴합니다.</p> 	

				<p/>
				<p class = "sub_title">와이셔츠</p>
				<table>
					<tbody>
						<tr>
							<td>
								<img class = "subImg" src = "images/sub-all3.png" />
							</td>
						</tr>
						<tr> 
							<td>
								<img class = "subImg" src = "images/sub-all4.png" />
							</td>
						</tr>
						<tr> 
							<td>
								<img class = "subImg" src = "images/sub-all5.png" />
							</td>
						</tr>
						<tr>
							<td> 
								<img class = "subImg" src = "images/sub-all6.png" />
							</td> 
						</tr>
					</tbody>
				</table>
				
				
				

			</div>
		</div>
      </div>
   </section>
   <!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
   
   <div id="footer"></div>
</body>

    
</html>