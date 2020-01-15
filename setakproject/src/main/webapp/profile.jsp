<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- value는   
 	  BoardVO board = (BoardVO)request.getAttribute("vo");   
 	  value="< %=board.getSubject() %>" 이렇게 할꺼얌-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>세탁곰</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
	<link rel="stylesheet" type="text/css" href="./css/profile.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
	<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	<!-- 생년월일  datepicker script -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	
	<!-- 우편번호 api -->
	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script type="text/javascript">
      $(document).ready(function(){
         $("#header").load("./header.jsp")
         $("#footer").load("./footer.jsp")
         
         //생년월일
		$("#birthday").datepicker ({
		  	dateFormat: 'yymmdd', // 텍스트 필드에 입력되는 날짜 형식.
		  	prevText:'이전 달',
		  	nextText:'다음 달',
		  	monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  	dayNamesMin:['일','월','화','수','목','금','토'],
		  	changeMonth:true, //월을 바꿀 수 있는 박스를 표시한다
		  	changeYear:true,
		  	showMonthAfterYear:true, //월, 년 순의 박스를 년, 월 순으로 바꿔준다
		  	yearRange:'c-100:c'// 년도 선택 박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할 것인가?
	 	 });
		
		//생년월일 아이콘으로 포커스하기
		$('.fa-calendar-alt').click(function(){
				$("#birthday").focus();
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
                  document.getElementById("address_detail").focus();
              }
          }).open();
      };
          
    </script>
</head>
<body>
	<div id="header"></div>
	
	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="test"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
			<div class="mypage_head">
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
		 <div class="mypage_content">
            <h2>개인정보수정</h2>
			<div class="profile"> <!-- class 변경해서 사용하세요. -->
				<form action="">  
					<table class="profile_info">
						<tr>
							<td class="left_info">아이디</td>
							<td class="right_info">
								<input class="txt_info" name="member_id" value="member_id"></td>
						</tr>
						<tr>
							<td class="left_info">새 비밀번호</td>
							<td class="right_info">
								<input class="txt_info" name="member_password" value=""></td>
						</tr>
						<tr>
							<td class="left_info">새 비밀번호 확인</td>
							<td class="right_info">
								<input class="txt_info" name="member_password2"></td>
						</tr>	
						<tr>
							<td class="left_info">이름</td>
							<td class="right_info">
								<input class="txt_info" name="member_name" value="member_name"></td>
						</tr>	
						<tr>
							<td class="left_info">생년월일</td>
							<td class="right_info">
								<input class="txt_info" type="text" name="member_birthday"  id="birthday" value="">
								<i class="far fa-calendar-alt"></i></td>
						</tr>
						<tr>
							<td class="left_info">핸드폰</td>
							<td class="right_info">
								<input type="text" class="txt_info" type="text" name="member_phone" value="">
								<input type="button" value="인증번호 발송하기" />
								<input type="text" class="txt_info" type="text"  placeholder="SNS 인증번호">
							</td>
						</tr>	
						<tr>
							<td class="left_info">이메일</td>
							<td class="right_info" >
								<input class="txt_info" type="text" name="member_email" value=""></td>
						</tr>
						<tr>
							<td class="left_info">주소</td>
							<td class="right_info">
								<input id="postcode" class="txt_info" type="text" name="member_post" style="width:60px;" value=""/> 
								<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" /> <br />
								<input id="address"  class="txt_info" type="text" name="member_loc" style="width:270px;" value="" readonly/> 
								<input id="address_detail" class="txt_info" type="text" name="member_locdetail" style="width:270px" value=""/>
								<input id="extraAddress" type="hidden" placeholder="참고항목">
							</td>
						</tr>
					</table>
				</form>	
			</div>			
			<div class="total_button">
				<a href="javascript:" >취소</a>
				<a href="javascript:" >수정</a>
			</div>	
		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
</body>
</html>