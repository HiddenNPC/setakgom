<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰 정기구독</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/subscribe.css"/>

   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
   
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
   <section id="subscribe"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
		<div class = "div-1000">	
	         <div class="title-text"> <!-- 변경하시면 안됩니다. -->
	            <h2>정기구독</h2>
	         </div>
       
	       	<div class="sub-div">
		         <p class = "p_subtitle">정기구독을 하시면 최대 60% 저렴합니다.</p> 	
		        
		        <p class = "sub_title">올인원</p>
				<table class = "sub_table" border = "solid 1px">
					<thead>
						<tr>
							<th width = "10%">요금제</th>
							<th width = "15%">금액</th>
							<th width = "10%">물빨래 30L</th>
							<th width = "10%">와이셔츠</th>
							<th width = "10%">드라이클리닝</th>
							<th width = "10%">이불</th>
							<th width = "15%">보관 1BOX<br/>(1개월 쿠폰)</th>
							<th width = "10%">배송</th>
							<th width = "10%">결제</th>
						</tr>
					</thead>
					<tbody align = "center">
						<tr>
							<td>올인원59</td>
							<td>94500원</td>
							<td>3개</td>
							<td>15장</td>
							<td>3장</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>올인원74</td>
							<td>74000원</td>
							<td>5개</td>
							<td>20장</td>
							<td>3장</td>
							<td>-</td>
							<td>-</td>
							<td>4회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>올인원89</td>
							<td>89000원</td>
							<td>8개</td>
							<td>20장</td>
							<td>4장</td>
							<td>-</td>
							<td>1장</td>
							<td>6회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>올인원104</td>
							<td>104000원</td>
							<td>8개</td>
							<td>20장</td>
							<td>5장</td>
							<td>1개</td>
							<td>1장</td>
							<td>8회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>올인원119</td>
							<td>119000원</td>
							<td>9개</td>
							<td>20장</td>
							<td>6장</td>
							<td>1개</td>
							<td>2장</td>
							<td>10회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>올인원134</td>
							<td>134000원</td>
							<td>15개</td>
							<td>20장</td>
							<td>7장</td>
							<td>1개</td>
							<td>3장</td>
							<td>12회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
							
					</tbody>
				</table>
				
				<p/>
				<p class = "sub_title">와이셔츠</p>
				<table class = "sub_table" border = "solid 1px">
					<thead>
						<tr>
							<th width = "10%">요금제</th>
							<th width = "15%">금액</th>
							<th width = "10%">물빨래 30L</th>
							<th width = "10%">와이셔츠</th>
							<th width = "10%">드라이클리닝</th>
							<th width = "10%">이불</th>
							<th width = "15%">보관 1BOX<br/>(1개월 쿠폰)</th>
							<th width = "10%">배송</th>
							<th width = "10%">결제</th>
						</tr>
					</thead>
					<tbody align = "center">
						<tr>
							<td>와이29</td>
							<td>29000원</td>
							<td>-</td>
							<td>15장</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>와이44</td>
							<td>44000원</td>
							<td>-</td>
							<td>30장</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>4회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>와이59</td>
							<td>59000원</td>
							<td>-</td>
							<td>55장</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>6회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>	
					</tbody>
				</table>
				
				<p/>
				<p class = "sub_title">드라이</p>
				<table class = "sub_table" border = "solid 1px">
					<thead>
						<tr>
							<th width = "10%">요금제</th>
							<th width = "15%">금액</th>
							<th width = "10%">물빨래 30L</th>
							<th width = "10%">와이셔츠</th>
							<th width = "10%">드라이클리닝</th>
							<th width = "10%">이불</th>
							<th width = "15%">보관 1BOX<br/>(1개월 쿠폰)</th>
							<th width = "10%">배송</th>
							<th width = "10%">결제</th>
						</tr>
					</thead>
					<tbody align = "center">
						<tr>
							<td>드라이44</td>
							<td>44000원</td>
							<td>-</td>
							<td>-</td>
							<td>10장</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>드라이59</td>
							<td>59000원</td>
							<td>-</td>
							<td>-</td>
							<td>14장</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>드라이74</td>
							<td>74000원</td>
							<td>-</td>
							<td>-</td>
							<td>18장</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>	
					</tbody>
				</table>
				
				<p/>
				<p class = "sub_title">물빨래</p>
				<table class = "sub_table" border = "solid 1px">
					<thead>
						<tr>
							<th width = "10%">요금제</th>
							<th width = "15%">금액</th>
							<th width = "10%">물빨래 30L</th>
							<th width = "10%">와이셔츠</th>
							<th width = "10%">드라이클리닝</th>
							<th width = "10%">이불</th>
							<th width = "15%">보관 1BOX<br/>(1개월 쿠폰)</th>
							<th width = "10%">배송</th>
							<th width = "10%">결제</th>
						</tr>
					</thead>
					<tbody align = "center">
						<tr>
							<td>물빨래34</td>
							<td>34000원</td>
							<td>3개</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물빨래49</td>
							<td>49000원</td>
							<td>5개</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물빨래64</td>
							<td>64000원</td>
							<td>7개</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>4회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물빨래79</td>
							<td>79000원</td>
							<td>7개</td>
							<td>-</td>
							<td>-</td>
							<td>1개</td>
							<td>-</td>
							<td>5회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물빨래84</td>
							<td>84000원</td>
							<td>8개</td>
							<td>-</td>
							<td>-</td>
							<td>1개</td>
							<td>-</td>
							<td>7회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물빨래99</td>
							<td>99000원</td>
							<td>13개</td>
							<td>-</td>
							<td>-</td>
							<td>1개</td>
							<td>1장</td>
							<td>9회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
					</tbody>
				</table>
				
				<p/>
				<p class = "sub_title">물빨래&드라이</p>
				<table class = "sub_table" border = "solid 1px" style = "margin-bottom : 150px; ">
					<thead>
						<tr>
							<th width = "10%">요금제</th>
							<th width = "15%">금액</th>
							<th width = "10%">물빨래 30L</th>
							<th width = "10%">와이셔츠</th>
							<th width = "10%">드라이클리닝</th>
							<th width = "10%">이불</th>
							<th width = "15%">보관 1BOX<br/>(1개월 쿠폰)</th>
							<th width = "10%">배송</th>
							<th width = "10%">결제</th>
						</tr>
					</thead>
					<tbody align = "center">
						<tr>
							<td>물드44</td>
							<td>44000원</td>
							<td>3개</td>
							<td>-</td>
							<td>3장</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물드59</td>
							<td>59000원</td>
							<td>4개</td>
							<td>-</td>
							<td>4장</td>
							<td>-</td>
							<td>-</td>
							<td>3회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물드74</td>
							<td>74000원</td>
							<td>6개</td>
							<td>-</td>
							<td>4장</td>
							<td>-</td>
							<td>-</td>
							<td>4회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
						</tr>
						
						<tr>
							<td>물드89</td>
							<td>89000원</td>
							<td>7개</td>
							<td>-</td>
							<td>4장</td>
							<td>1회</td>
							<td>1장</td>
							<td>4회</td>
							<td><input type = "button" class = "pay_button" value = "결제" /></td>
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

    <script>
		$(document).ready(function() {
	
		// 아이엠포트 관련 스크립트
    	$(".pay_button").on("click", function(){
    		var select_button = $(this);
    		var tr = select_button.parent().parent();
    		var td = tr.children();
    		
    		var price = td.eq(1).text().slice(0,-1);
  	
    		alert(price);
    		
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
                    location.href="/setak/subscribe.jsp";
                    alert(msg);
                }
            });
            
        });
    	
		});
		

    </script>
    
</html>