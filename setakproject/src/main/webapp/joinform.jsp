<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>세탁곰</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/join.css" />
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 생년월일  datepicker script -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>

<!-- 우편번호 api -->
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 모달 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
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
		
		//체크박스
 		   $("#checkall").click(function(){
  		      //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=clause_use]").prop("checked",true);
            $("input[name=clause_privacy]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=clause_use]").prop("checked",false);
            $("input[name=clause_privacy]").prop("checked",false);
        }
    });
	    
		//이용약관
		$("#clause_use").click(function(){
		    $('div.modal').modal({remote : 'clause_use.jsp'});
		 });
		
		//개인정보
		$("#clause_privacy").click(function(){
	        $('div.modal').modal({remote : 'clause_privacy.jsp'});
	        
	 	});
		//이용약관 초기화
		$('.modal').on('hidden.bs.modal', function () {
            $(this).removeData('bs.modal');
		});
		
		// 회원 약관 동의?????
		function agree_ck() {
		 n=document.agree;
		 if(n.clause_use[0].checked != true) {
		    alert('이용약관에 동의 하셔야 합니다');
		  return false;
		 }
		  if(n.clause_privacy[0].checked != true) {
		    alert('개인정보취급방침에 동의 하셔야 합니다');
		  return false;
		 }
		 n.submit();
		} 
		
		 
		//이메일 입력방식 선택 
		$('#selectEmail').change(function(){ 
			$("#selectEmail option:selected").each(function () { 
				if($(this).val()== '1'){ //직접입력일 경우 
					$("#str_email02").val(''); //값 초기화 
					$("#str_email02").attr("disabled",false); //활성화 
				}else{ //직접입력이 아닐경우 
					$("#str_email02").val($(this).text()); //선택값 입력 
					$("#str_email02").attr("disabled",true); //비활성화 
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
        
        
    };
	 
	 function check() {
	    	var str, i, ch, chk, chk_list="";
	    	
	    	// 이름 체크
	    	if (document.joinform.value=="")
	    	{
	    		alert("이름을 입력하세요")
	    		document.joinform.member_name.focus();
	    		return false;
	    	}	
	    	else {
	    		str = document.joinform.member_name.value;
	    	}
	    	chk_list += str + "\n";
	    	
	    	
	    	// 아이디 체크
	    	if (document.joinform.member_id.value == "")
	    	{
	    		alert("아이디를 입력하세요!!!");
	    		document.joinform.member_id.focus();
	    		return false;
	    	}
	    	else
	    	{
	    		str = document.joinform.member_id.value;
	    		if (str.length < 6 || str.length > 10)
	    		{
	    			alert("아이디 길이 확인(6~10자리)!!");
	    			document.joinform.member_id.focus();
	    			return false;
	    		}
	    		else
	    		{
	    			for (i=0; i<str.length; i++)
	    			{
	    				ch = str.substring(i, i+1);
	    				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
	    						|| (ch >= "A" && ch <= "Z")))
	    				{
	    					alert("특수문자가 포함, 다시 입력 하세요.");
	    					document.joinform.member_id.focus();
	    					return false;
	    				}
	    			}
	    		}
	    	} 
	    	
	    	// 비밀번호 체크 
	    	if (document.joinform.member_pw1.value == "")
	    	{
	    		alert("패스워드를 입력하세요.");
	    		document.joinform.member_pw1.focus();
	    		return false;
	    	}
	    	else
	    	{
	    		str = document.joinform.pw.value;
	    		if (str.length < 6 || str.length > 10)
	    		{
	    			alert("패스워드 길이 확인(6~10자리)!!");
	    			document.joinform.member_pw1.focus();
	    			return false;
	    		}
	    		else
	    		{
	    			for (i=0; i<str.length; i++)
	    			{
	    				ch = str.substring(i, i+1);
	    				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
	    						|| (ch >= "A" && ch <= "Z")))
	    				{
	    					alert("특수문자 포함, 다시 입력하세요.");
	    					document.joinform.member_pw1.focus();
	    					return false;
	    				}
	    			}
	    		}
	    	} 
	    	
	    	if (document.joinform.member_pw1.value != document.joinform.member_pw2.value)
	    	{
	    		alert("패스워드를 입력오류!!!");
	    		document.joinform.member_pw2.focus();
	    		return false;
	    	} 
	    	chk_list += "pw : " + str + "\n";
	    	
	    	
	     	// 핸드폰 체크 
	    	if (document.joinform.member_phone.value == "")
			{
				alert("핸드폰 번호를 입력해주세요.");
				document.joinform.member_phone.focus();
				return false;
			}
	    	else {
	    		str = document.joinform.member_phone.value;
	    	}
	    	chk_list += str + "\n";
	    	
	   
	    // 이메일 앞부분 체크 
	    	if (document.joinform.member_email1.value == "")
			{
				alert("이메일를 다시 입력해주세요.");
				document.joinform.member_email1.focus();
				return false;
			}
	    	else {
	    		str = document.joinform.member_phone.value;
	    	}
	    	chk_list += str + "\n";
	    
	    // 이메일 뒷부분 체크 
	    	if (document.joinform.member_email2.value == "")
			{
				alert("이메일를 다시 입력해주세요.");
				document.joinform.member_email2.focus();
				return false;
			}
	    	else {
	    		str = document.joinform.member_phone.value;
	    	}
	    	chk_list += str + "\n";
	    	
	    // 생년월일 체크	
	    	if (document.joinform.member_birthday.value.length != 8)
			{
				alert("생년월일을 다시 확인해주세요.");
				document.joinform.member_birthday.focus();
				return false;
			}
	    	else {
	    		str = document.joinform.member_phone.value;
	    	}
	    	chk_list += str + "\n";
	    	
	    // 우편번호 체크	
	    	if (document.joinform.postcode.value.length != 5)
			{
				alert("우편번호를 다시 확인해주세요.");
				document.joinform.postcode.focus();
				return false;
			}
	    	else {
	    		str = document.joinform.member_phone.value;
	    	}
	    	chk_list += str + "\n";
	    
	    	
		  // 주소 체크	
		    	if (document.joinform.member_addr.value == "")
				{
					alert("우편번호를 다시 확인해주세요.");
					document.joinform.member_addr.focus();
					return false;
				}
		    	else {
		    		str = document.joinform.member_addr.value;
		    	}
		    	chk_list += str + "\n";
	    	
	     	//--회원가입 예제 사용 --->
	    	return false;

	    }
	
</script>
</head>
<body>
	<div id="header"></div>

	<!-- 여기서 부터 작성하세요. 아래는 예시입니다. -->
	<section id="test"> <!-- id 변경해서 사용하세요. -->
	<div class="content">
		<!-- 변경하시면 안됩니다. -->
		<div class="title-text">
			<!-- 변경하시면 안됩니다. -->
			<h2>회원가입</h2>
		</div>

		<form name="joinform" action="joinpro.st" method="post">
			<div class="joinform">
				<table>
					<tr>
						<td><input type="text" name="member_name" placeholder="이름" />
					</tr>
					<tr>
						<td><input type="text" name="member_id" placeholder="아이디 (영문, 숫자 6~20자)" />
					</tr>
					<tr>
						<td><input type="password" name="member_password" placeholder="비밀번호 (영문, 숫자 조합 8자리 이상)" />
					</tr>
					<tr>
						<td><input type="password" name="member_password2" placeholder="비밀번호 확인" />
					</tr>

					<tr>
						<td><input type="text" name="member_phone" size="20" placeholder="휴대폰 번호" /> 
						<input type="button" value="인증번호 발송하기" />
					</tr>
					<tr>
						<td><input type="text" name="" size="20"  placeholder="SNS 인증번호" /></td>
					</tr>
					<tr>
						<td>
							<input type="text" name="member_email1" placeholder="이메일">@
							<input type="text" name="member_email2" id="str_email02" style="width:100px;" disabled value="">
								<select style="width:120px;margin-right:10px" name="selectEmail" id="selectEmail">
	 							<option value="" selected>메일 주소 선택</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="1">직접입력</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="text" name="member_birthday" id="birthday" placeholder="생년월일 " />
							<i class="far fa-calendar-alt"></i></td>
					</tr>
					<tr>
						<td class="right_col"> <!-- 주소를??????? -->
						<input id="postcode" class="txtInp" type="text" name="" style="width: 60px;" /> 
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"> <br /> 
						<input id="address" class="txtInp" type="text" name="" style="width: 270px;" readonly /> &nbsp; 
						<input id="detailAddress" class="txtInp" type="text" name="" placeholder="상세 주소를 입력해주세요." style="width: 300px;" /> 
						<input id="extraAddress" type="hidden" placeholder="참고항목"></td>
					</tr>
					<tr>
						<td>성별 <input type="radio" name="gender" value="남" checked />남자
							<input type="radio" name="gender" value="여" />여자
						</td>
					</tr>
				</table>
			</div>
		
			<!-- 이용약관 테이블 -->
			<div id="clause">
				<table id="clause">
					<tr>
						<td>전체동의<input type="checkbox" id="checkall" /></td>
    				</tr>
    	
    				<tr>
    				 	<td>이용약관<input type="checkbox" name="clause_use" />
    				 	<input type ="button" class="btn btn_clause" id="clause_use" value = "전체보기"/></td>
    				</tr>
    				<tr>
    				    <td>개인정보 수집 및 이용<input type="checkbox" name="clause_privacy" />
    				    <input type ="button" class="btn btn_clause" id="clause_privacy" value = "전체보기" /></td>
    				</tr>
							<div id="modalpop" class="modal fade">
  							<div  class="modal-dialog">
    						<div  class="modal-content">
       						 <!-- remote ajax call이 되는영역 -->
    						</div>
  							</div>
							</div>
				</table>
			</div>
		</form>
		<br>
		<br> <a href="#"><button type="button" class="btn_order" style="margin: 10px;">회 원 가 입</button></a> 
			 <a href="#"><button type="button" class="btn_cancel1" style="margin: 10px;">취 소 하 기</button></a>
	</section>


	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->

	<div id="footer"></div>
</body>
</html>