<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberVO"  %>    
<%
	MemberVO mo2 = (MemberVO) request.getAttribute("mo");
%>
<!DOCTYPE html>
<html>
<head>
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
    
	//주소 분리하기
	var loc="<%=mo2.getMember_loc() %>";  
	var addr = new Array();
	addr=loc.split('!');
	var find1=addr[0];
	var find2=addr[1];
	console.log(find2);
	
      $(document).ready(function(){
    	  
    	 //주소분리하기
    	 $("#address").val(find1);
    	 $("#address_detail").val(find2);
    	 
    	 //기본 
         $("#header").load("header.jsp");
         $("#footer").load("footer.jsp");
         
         
       //비밀번호체크V
     	$(document).on("propertychange change keyup paste","#member_password",function(){
     		if(!pwReg.test($(this).val())){
     			$(".profile h1").css("display","block");
     		} else {
     			$(".profile h1").css("display","none");
     		}
     		
      	});
     	
     	//비밀번호 일치 체크V
     	  	$(document).on("propertychange change keyup paste","#pw2",function(){
      	    	if($('#member_password').val() != $('#pw2').val()) {
      	    		 $(".profile h2").css("display","block"); 
      	    	} else {
      	    		 $(".profile h2").css("display","none"); 
      	    	}
      	    });
     	
     	  	 //생년월일체크
     		$(document).on("propertychange change keyup paste","#member_birthday",function(){
     		if(!brReg.test($(this).val())){
     			$(".profile h3").css("display","block");
     		} else {
     			$(".profile h3").css("display","none");
     		}
      	});
     	
     	  //핸드폰번호 체크V
     		$(document).on("propertychange change keyup paste","#member_phone",function(){
     			if(!phReg.test($(this).val())){
     				$(".profile h5").css("display","block");
     			} else {
     				$(".profile h5").css("display","none");
     			}
     			
     	 	});
     	  
     		//인증번호 체크?????????????????????????????????
     		$(document).on("propertychange change keyup paste","#chksns",function(){
     			if($('#chksns').val() == ""){
     				$(".profile h6").css("display","block");
     			} else {
     				$(".profile h6").css("display","none");
     			}
     			
     	 	});
     	  
     	  
     		  //이메일체크V
     		$(document).on("propertychange change keyup paste","#member_email",function(){
     			if(!emReg.test($(this).val())){
     				$(".profile h7").css("display","block");
     			} else {
     				$(".profile h7").css("display","none");
     			}
     			
     	 	});
     		  
     		
     	  
     	  //우편번호체크V
     	$(document).on("propertychange change keyup paste","#postcode",function(){
     		if(!poReg.test($(this).val())){
     			$(".profile h8").css("display","block");
     		} else {
     			$(".profile h8").css("display","none");
     		}
     		
      	});
         
         
    	 //생년월일
 		$("#member_birthday").datepicker ({
 		  	dateFormat: 'yy-mm-dd', // 텍스트 필드에 입력되는 날짜 형식.
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
 				$("#member_birthday").focus();
 		});
 		
 		
 		$('#update').on('click', function(event) {
 			
 			var address = $("#address").val();
			var detailAddress = $("#detailAddress").val();
			var addr = address + '!' + detailAddress; 
 			var params = {
 						'member_id':sessionID,
					       'member_password':$("#member_password").val(),
					       'member_birthday':$("#member_birthday").val(),
					       'member_phone':$("#member_phone").val(),
					       'member_email':$("#member_email").val(),
					       'member_zipcode':$("#postcode").val(),
					       'member_loc':addr
			};
 			alert(params);
			$.ajax({
	            url : '/setak/updateMember.do', // url
	            type:'post',
	            data : params,
	            dataType:'json', 
	            contentType : 'application/x-www-form-urlencoded;charset=utf-8',
	            success: function(result) {
	               if(result.res=="OK") {
	            	   alert("수정 성공");
	            	   $(location.href="/setak/profile2.do");
	               }
	               else { // 실패했다면
	                  alert("개인정보수정 실패");
	               }
	            },
	            error:function() {
	               alert("insert ajax 통신 실패");
	            }			
			});
			
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
				<h2>개인정보수정</h2>
			</div>
		</div>
	</section>
	
	<section id="test"> <!-- id 변경해서 사용하세요. -->
		<div class="content"> <!-- 변경하시면 안됩니다. -->
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
                     <li><a href="mysub.do">나의 정기구독</a></li>
                  </ul>
                  <ul class="mypage_list">
                     <li>고객문의</li>
                     <li><a href="qnainquiry.jsp">Q&amp;A 문의내역</a></li>
                  </ul>
                  <ul class="mypage_list">
                     <li>정보관리</li>
                     <li><a href="profile1.do">개인정보수정</a></li>
                     <li><a href="mycoupon.jsp">쿠폰조회</a></li>
                     <li><a href="mysavings.jsp">적립금 조회</a></li>
                    <li><a href="withdraw.do">회원탈퇴</a></li>
                  </ul>
               </li>
            </ul>
         </div>        
		 <div class="mypage_content">
			<div class="profile"> <!-- class 변경해서 사용하세요. -->
				<form name="profile">
					<table class="profile_info">
						<tr>
							<td class="left_info">아이디</td>
							<td class="right_info">
								<%=mo2.getMember_id() %>
							</td>
						</tr>
						<tr>
							<td class="left_info">새 비밀번호</td>
							<td class="right_info">
								<input class="txt_info" type="password" id="member_password" value="">
								<h1>8~16자 영문, 숫자, 특수문자의 조합으로 입력해주세요.</h1>
							</td>
						</tr>
						<tr>
							<td class="left_info">새 비밀번호 확인</td>
							<td class="right_info">
								<input class="txt_info" type="password" id="pw2">
								 <h2>비밀번호가 일치하지 않습니다.</h2>
							</td>
						</tr>	
						<tr>
							<td class="left_info">이름</td>
							<td class="right_info"><%=mo2.getMember_name() %></td>
						</tr>	
						<tr>
							<td class="left_info">생년월일</td>
							<td class="right_info">
								<input type="text" class="txt_info" id="member_birthday" value="<%=mo2.getMember_birthday() %>">
								<i class="far fa-calendar-alt"></i>
								<h3>생년월일을 입력해주세요</h3>
							</td>
						</tr>
						<tr>
							<td class="left_info">핸드폰</td>
							<td class="right_info">
								<input type="text" class="txt_info" id="member_phone" value="<%=mo2.getMember_phone() %>">
								<input type="button" value="인증번호 발송하기" />
								<input type="text" class="txt_info"  id="chksns" placeholder="SNS 인증번호"><br>
								<h5>핸드폰 번호를 입력해주세요</h5><h6>인증번호를 확인해주세요</h6>
								
							</td>
						</tr>	
						<tr>
							<td class="left_info">이메일</td>
							<td class="right_info" >
								<input class="txt_info" type="text" id="member_email" value="<%=mo2.getMember_email() %>">
								<h7>메일주소를 입력해주세요</h7>	
							</td>
						</tr>
						<tr>
							<td class="left_info">주소</td>
							<td class="right_info">
								<input id="postcode" class="txt_info" type="text" name="member_post" style="width:60px;" value="<%=mo2.getMember_zipcode() %>"/> 
								<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" /> <br />
								<input id="address"  class="txt_info" type="text" name="member_loc" style="width:270px;"  readonly/> 
								<input id="address_detail" class="txt_info" type="text" name="member_locdetail" style="width:270px" />
								<input id="extraAddress" type="hidden" placeholder="참고항목"><br>
								<h8>주소를 입력해주세요</h8>
							</td>
						</tr>
					</table>
				<div class="total_button">
				<input type="reset" value="취소" />
				<input type="button" id="update" value="수정" />
				</div>	
			</form>
		</div>			
	</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
	<script type="text/javascript">
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	var phReg =/^[0-9]{10,11}$/;
	var emReg =/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	var brReg = /^(\d{4})[-]\d{2}[-]\d{2}$/;
	var poReg = /^[0-9]{5}$/;
		
	
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
</body>

</html>