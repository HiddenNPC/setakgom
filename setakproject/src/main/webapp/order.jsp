<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>세탁곰 주문결제</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="./css/default.css"/>
   <link rel="stylesheet" type="text/css" href="./css/order.css"/>
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   
   <!-- 우편번호 api -->
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   
   
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
   <section id="order"> <!-- id 변경해서 사용하세요. -->
      <div class="content"> <!-- 변경하시면 안됩니다. -->
         <div class="title-text"> <!-- 변경하시면 안됩니다. -->
            <h2>주문결제</h2>
         </div>
         
         <div class = "div-1000">
	        <img class = "arrow-img" src = "images/arrow.PNG" />
	        
			<div class = "order-div">
				<p class = "notice">※ 취소는 마이페이지 > 주문/배송 현황에서 신청 당일 밤 10시 전까지만 가능합니다.</p>
				
				<h3>주문리스트 확인</h3>
				<table class = "order_list_table">
					<thead>
						<tr>
							<th>구분</th>
							<th>종류</th>
							<th>수량</th>
							<th>비고</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>물세탁</td>
							<td>50000원</td>
						</tr>
						<tr>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>물세탁</td>
							<td>50000원</td>
						</tr>
						<tr>
							<td>세탁</td>
							<td>셔츠</td>
							<td>20장</td>
							<td>물세탁</td>
							<td>50000원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class = "delivery-div">
				<form action="">
					<table class = "delivery_info_table">
						<thead>
							<tr>
								<th colspan = "2"><h3>배송지 정보</h3></th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td class = "left_col">배송지 선택</td>
								<td class = "right_col">
									<input type = "radio" name = "delivery_info" checked = "checked" value = "" /> 기본배송지 
									<input type = "radio" name = "delivery_info " value = "" /> 직접입력  
									
									<button class = "delivery-btn">나의 배송주소록</button>
								</td>
							</tr>
							
							<tr>
								<td class = "left_col">받는 사람</td>
								<td class = "right_col"><input class = "txtInp" type = "text" name = ""/></td>
							</tr>
							
							<tr>
								<td class = "left_col">휴대폰 번호</td>
								<td class = "right_col">
									<input class = "txtInp" type = "text" name = "" style = "width : 30px;"/> 
									-
									<input class = "txtInp" type = "text" name = "" style = "width : 40px;"/>
									-
									<input class = "txtInp" type = "text" name = "" style = "width : 40px;"/>
								</td>
							</tr>
							
							<tr>
								<td class = "left_col">배송지 주소</td>
								<td class = "right_col">
									<input id = "postcode" class = "txtInp" type = "text" name = "" style = "width : 60px;"/> 
									<input type = "button" onclick="execDaumPostcode()" value = "우편번호 찾기">
									<br/>
									<input id = "address" class = "txtInp" type = "text" name = "" style = "width : 270px;" readonly/> &nbsp;
									<input id= "detailAddress" class = "txtInp" type = "text" name = "" placeholder = "상세 주소를 입력해주세요." style = "width : 300px;"/>
									<input id="extraAddress" type="hidden" placeholder="참고항목">
									
								</td>
							</tr>
							
							<tr>
								<td class = "left_col">배송 요청 사항</td>
								<td class = "right_col">
									<input class = "txtInp" type = "text" name = "" placeholder = "배송 시 요청사항을 입력해주세요." style = "width : 650px;" maxlength = "60"/>
								</td>
							</tr>						
						</tbody>
					</table>
				</form>
			</div>
			
			<div class = "pay-div">
				<div class = "discount-div">
					<div class = "pay_title"><h3>할인 정보</h3></div>

						<form action = "">
							<table class = "discount_table">
								<tbody>
									<tr>
										<td class = "left_col first_row">쿠폰</td>
										<td class = "first_row right_col">
											<input type = "button" onclick = "layerPopup('open')" value = "쿠폰적용" />
										</td>
									</tr>
									
									<tr>
										<td class = "left_col">적립금</td>
										<td class = "right_col">
											<input class = "txtInp" type = "text" name = "" style = "width : 75px;"/> <span style = "font-size : 0.85rem;">Point</span>
											&nbsp;
											<span class = "myPoint"> (보유 적립금 : <b>500</b>원) </span> 
											
										</td>
									</tr>
								</tbody>
							</table>
						</form>

				</div>
				
				<div class = "price-div">
					<div class = "pay_title"><h3>결제 금액</h3></div>
					<div class = "pay_content">
						<table id = "price_table" class = "price_table">
							<tbody>
								<tr>
									<td class = "left_col first_row">총 주문금액</td>
									<td class = "first_row">39000원</td>
								</tr>
								<tr>
									<td class = "left_col">배송비</td>
									<td>0원</td>
								<tr>
								<tr>
									<td class = "left_col">쿠폰할인</td>
									<td class = "txtBlue">0원</td>
								</tr>
								<tr>
									<td class = "left_col">적립금</td>
									<td class = "txtBlue">0원</td>
								<tr>
								<tr>
									<td class = "left_col td_final">최종 결제액</td>
									<td id = "final_price" class = "txtBlue">39000원</td>
								</tr>
							</tbody>
						</table>
						
						<button class = "pay_btn">결제하기</button>
					</div>
			</div>
					
      </div>
   </section>

	<!-- 쿠폰 팝업 레이어 -->
	<section id = "coupon">
		<div id = "layer-div" class="layer-card">
			<div id = "popup-div">
				<div class="popup-title">
					<h2>쿠폰적용</h2>
					<button class = "popup-close" onclick = "layerPopup('close')">X</button>
				</div>
				<div class="popup-content1">
					<h3>쿠폰할인</h3>
					<ul>
						<li><input type="checkbox" name="" />보관 1개월 무료</li>
						<li><input type="checkbox" name="" />보관 1개월 무료</li>
						<li><input type="checkbox" name="" />보관 1개월 무료</li>
					</ul>
				</div>
				
				<div class="popup-content2">
					<div class = "popup-table-div">
						<table class = "popup-table">
							<tr>
								<td class = "pLeft_col">상품금액</td>
								<td class = "pRight_col">39,000원</td>
							</tr>
							<tr>
								<td class = "pLeft_col">쿠폰 할인금액</td>
								<td class = "pRight_col txtBlue">0원</td>
							</tr>
							<tr>
								<td colspan = "2">
								<hr/>
								</td>
							</tr>
							<tr>
								<td class = "pLeft_col pFinal">할인적용금액</td>
								<td class = "pRight_col pFinal txtBlue">39,000원</td>
							</tr>
						</table>
					</div>
					
					<button>쿠폰적용</button>				
				</div>
			</div>
		</div>
	</section>
	
	<div id="footer"></div>
</body>


<script>

$(document).ready(function() {
	
	// 결제 : 아임포트 스크립트
	$(".pay_btn").on("click", function(){
		
        var IMP = window.IMP; // 생략가능
        IMP.init('imp04669035'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '세탁곰 결제',
            amount : 5000,
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
                location.href="/springlaundry/";
                alert(msg);
            }
        });
        
    });
	
});

	//우편번호 api
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                
                var themeObj = {
                		   //bgColor: "", //바탕 배경색
                		   searchBgColor: "#3498DB", //검색창 배경색
                		   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
                		   //pageBgColor: "", //페이지 배경색
                		   //textColor: "", //기본 글자색
                		   queryTextColor: "#FFFFFF" //검색창 글자색
                		   //postcodeTextColor: "", //우편번호 글자색
                		   //emphTextColor: "", //강조 글자색
                		   //outlineColor: "", //테두리
                };

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	
	// 쿠폰적용 
    function layerPopup(type) {

        if(type == 'open') {
           
            // 팝업창을 연다.

            
            jQuery('#layer-div').attr('style','display:block');
            jQuery('#popup-div').attr('style','display:block');
            
            // 스크롤 없애기
            $("body").css("overflow","hidden");
            
            // 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
            jQuery('#layer-div').height(jQuery(document).height());
        }
       
        else if(type == 'close') {
           
            // 팝업창을 닫는다.
            jQuery('#layer-div').attr('style','display:none');
            $("body").css("overflow","scroll");
            
        }
    }
	
	function popupCenter() {
		var width = $('#popup-div').width();
		var height = $('#popup-div').height();
		
		$('#popup-div').css({'left' : ($(window).width() - width) / 2, 
			'top' : ($(window).height() - height) / 2});
	}

	
</script>
</html>