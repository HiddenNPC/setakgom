<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm14/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css"/>
<link rel="stylesheet" type="text/css" href="./css/join.css"/><!-- 여기 본인이 지정한 css로 바꿔야함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 우편번호 api -->
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		/*회원가입 버튼 클릭*/
		$('#join').on('click', function(event){
	        
			
            var address = $("#address").val();
            var detailAddress = $("#detailAddress").val();
            var addr = address + '!' + detailAddress;
            
            if( $("#member_name").val()  == '' || $("#member_id").val()  == ''|| 
            	$("#member_password").val() == '' || $("#pw2").val() == '' || 
            	$("#member_phone").val() == ''|| $("#member_sns").val() == '' || 
            	$("#member_email").val() == '' || $("#member_zipcode").val() == '' ||
            	($("#clause_use").is(":checked")==false) ||($("#clause_privacy").is(":checked")==false)
            	
             ) {
    			alert("빠짐없이 기입해 주세요");
    			return; 
    		};
    		
            var params = {
                     'member_name':$("#member_name").val(),
                     'member_id':$("#member_id").val(),
                     'member_password':$("#member_password").val(),
                     'member_phone':$("#member_phone").val(),
                     'member_email':$("#member_email").val(),
                     'member_zipcode':$("#member_zipcode").val(),
                     'member_loc':addr
            };
           
            $.ajax({
     			url : '/setak/insertMember.do',
     			type:'post',
     			data : params,
     			dataType:'json',
    			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
     			success: function(result) {
     			if(result.res=="OK") {            
     				$(location.href="/setak/login.do");
     			}
     			else { // 실패했다면
    			 alert("Insert Fail");
     			}
     		},
     		error:function() {
     		alert("insert ajax 통신 실패");
     		}           
            });
            
        });
		
		/*아이디중복확인*/
		$("#member_id").keyup(function(){
			
			if(this.value.length>=5) {
			var params = {'member_id': $("#member_id").val() };
			
			$.ajax ({
				 url : '/setak/chk_id.do', 
				 type:'post',
		         data : params,
		         dataType:'json', 
		         contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		         success: function(result) {
		        	 if(result.res=="OK") {
		        		 $(".joinform div:nth-child(2) h5").css("display","block");

		        	 } else {
		        		 $(".joinform div:nth-child(2) h5").css("display","none");
		        	 }
		         },
		            error:function() {
		               alert("insert ajax 통신 실패");
		            }			
				});
			}
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
				<h2>회원가입</h2>
			</div>
		</div>
	</section>
	
	<section id="join_section">
		<div class="content">
			<form name="joinform">
			<div class="joinform">
				<div class="input_list">
					<input type="text" name="member_name"  id="member_name" placeholder="이름" />
					<h4>이름을 입력해주세요</h4>
				</div>
				<div class="input_list">
					<input type="text" name="member_id" id="member_id" placeholder="아이디" />
					<h4>5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</h4>
					<h5>이미 사용중이거나 탈퇴한 아이디입니다.</h5>
				</div>
				<div class="input_list">
					<input type="password" name="member_password" id="member_password" placeholder="비밀번호 " />
					 <h4>8~16자 영문, 숫자, 특수문자의 조합으로 입력해주세요.</h4>
				</div>
				<div class="input_list">
					<input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인" />
					 <h4>비밀번호가 일치하지 않습니다.</h4>
				</div>
				<div class="input_list">
					<input type="text" name="member_phone" id="member_phone" style="width: 320px;" placeholder="핸드폰 번호 (예시 01012345678)," />
					<input class="button" type="button" value="인증번호 받기" style="width: 120px;" />
					<h4>핸드폰 번호를 입력해주세요</h4>
				</div>
				<div class="input_list">
					<input type="text" name="" size="20" id="member_sns"  style="width: 320px;" placeholder="SNS 인증번호" />
					<input class="button" type="button" value="인증번호 확인" style="width: 120px;" />
					<h4>인증번호가 일치하지 않습니다.</h4>
				</div>
				<div class="input_list">
					<input type="text" name="member_email" id="member_email" placeholder="이메일">
					
					<h4>메일주소를 입력해주세요</h4>				
				</div>
				<div class="input_list">
					<input id="member_zipcode" type="text" name="member_zipcode" style="width: 320px;"  /> 
					<input class="button" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width: 120px;"> 
					<h4>우편번호를 입력해주세요</h4>
					<input id="address" type="text" name="" readonly />
					<input id="detailAddress" type="text" name="" placeholder="상세 주소"/> 
					<input id="extraAddress" type="hidden" placeholder="참고항목">
				</div>	
				
				<hr>
			</div><!-- joinform -->	
			
			
			<!-- 이용약관 테이블 -->
			<div class="clause">
				<div>
					<input type="checkbox" id="checkall" /><span> 전체동의</span>
				</div>
				<div>
					<input type="checkbox" id="clause_use" /><span> 이용약관</span>
    				<input class="button" id="clause_use" type="button" onclick="window.open('clause_use.jsp', '', 'width=600, height=300,location=no,status=no,scrollbars=no');" value="전체보기"/>
					<h4>이용약관을 선택해주세요</h4>
				</div>
				<div>
					<input type="checkbox" id="clause_privacy" />
					<span>개인정보 수집 및 이용</span>
					<input class="button" id="clause_privacy" type="button" onclick="window.open('clause_privacy.jsp', '', 'width=590, height=300,location=no,status=no,scrollbars=yes');" value="전체보기"/>
					<h4>개인정보 수집 및 이용을 선택해주세요</h4>
				</div>
				
			</div>
			<div class="join_btn">
				<input id="join" class="btn" type="button" value="가입하기"  />
			</div>
		</form>
	</div><!-- content -->
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
   
   <div id="footer"></div>
</body>
<script type="text/javascript">
	var regExp = /[가-힣]/;
	var idReg = /^[a-z0-9_-]{5,20}$/;
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	var phReg =/^[0-9]{10,11}$/;
	var emReg =/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	var poReg = /^[0-9]{5}$/;
	
	
      $(document).ready(function(){
         $("#header").load("header.jsp")
         $("#footer").load("footer.jsp")   
         
		
		//체크박스
 		$("#checkall").click(function(){
  		    //클릭되었으면
        	if($("#checkall").prop("checked")){
           	 	//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            	$("input[id=clause_use]").prop("checked",true);
            	$("input[id=clause_privacy]").prop("checked",true); 
             //클릭이 안되있으면
       		 }else{
            	//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            	$("input[id=clause_use]").prop("checked",false);
            	$("input[id=clause_privacy]").prop("checked",false);
        };
      });
		
 		
 		
	//이름체크V
		$(document).on("propertychange change keyup paste","#member_name",function(){
			if(!regExp.test($(this).val())){
				 $(".joinform div:nth-child(1) h4").css("display","block"); 
			}else{
				$(".joinform div:nth-child(1) h4").css("display","none");
			}
		});
 		
	//아이디체크V
	$(document).on("propertychange change keyup paste","#member_id",function(){
		if(!idReg.test($(this).val())){
			$(".joinform div:nth-child(2) h4").css("display","block");
		} else {
			$(".joinform div:nth-child(2) h4").css("display","none");
		}
		
 	});
	
	
	
	//비밀번호체크V
	$(document).on("propertychange change keyup paste","#member_password",function(){
		if(!pwReg.test($(this).val())){
			$(".joinform div:nth-child(3) h4").css("display","block");
		} else {
			$(".joinform div:nth-child(3) h4").css("display","none");
		}
		
 	});
	
	//비밀번호 일치 체크V
	  	$(document).on("propertychange change keyup paste","#pw2",function(){
 	    	if($('#member_password').val() != $('#pw2').val()) {
 	    		 $(".joinform div:nth-child(4) h4").css("display","block"); 
 	    	} else {
 	    		 $(".joinform div:nth-child(4) h4").css("display","none"); 
 	    	}
 	    });
	
	  //핸드폰번호 체크V
		$(document).on("propertychange change keyup paste","#member_phone",function(){
			if(!phReg.test($(this).val())){
				$(".joinform div:nth-child(5) h4").css("display","block");
			} else {
				$(".joinform div:nth-child(5) h4").css("display","none");
			}
			
	 	});
	  //SNS일치 체크???????????
	$(document).on("propertychange change keyup paste","#member_sns",function(){
		if(!phReg.test($(this).val())){
			$(".joinform div:nth-child(6) h4").css("display","block");
		} else {
			$(".joinform div:nth-child(6) h4").css("display","none");
		}
		
 	});
	  
	  //이메일체크V
	$(document).on("propertychange change keyup paste","#member_email",function(){
		if(!emReg.test($(this).val())){
			$(".joinform div:nth-child(7) h4").css("display","block");
		} else {
			$(".joinform div:nth-child(7) h4").css("display","none");
		}
		
 	});

	  
	  //우편번호체크V
	$(document).on("propertychange change keyup paste","#member_zipcode",function(){
		if(!poReg.test($(this).val())){
			$(".joinform div:nth-child(10) h4").css("display","block");
		} else {
			$(".joinform div:nth-child(10) h4").css("display","none");
		}
		
 	});
	
	  //caluse전체 체크 V
	  $(document).on("change","#checkall",function(){
		  if( $("#checkall").is(":checked")==true) {
			  $(".clause div:nth-child(2) h4").css("display","none");
			  $(".clause div:nth-child(3) h4").css("display","none"); 
 	  	  } else {
 	  		$(".clause div:nth-child(2) h4").css("display","block"); 
 	  		$(".clause div:nth-child(3) h4").css("display","block"); 
		  }
	  });
	  
 	  //인증 체크 V
 	  	$(document).on("change","#clause_use",function(){
 	  	  if( $("#clause_use").is(":checked")==true) {
 	    	 $(".clause div:nth-child(2) h4").css("display","none"); 
 	  	  } else {
 	  		$(".clause div:nth-child(2) h4").css("display","block"); 
 	  	  }
 	  	});
 	  
 	  //개인정보 체크 V
 	  	$(document).on("change","#clause_privacy",function(){
 	 	  	  if( $("#clause_privacy").is(":checked")==true) {
 	 	    	 $(".clause div:nth-child(3) h4").css("display","none"); 
 	 	  	  } else {
 	 	  		$(".clause div:nth-child(3) h4").css("display","block"); 
 	 	  	  }
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
                  document.getElementById('member_zipcode').value = data.zonecode;
                  document.getElementById("address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("detailAddress").focus();
              }
          }).open();
          
          
      };  
</script>
</html>