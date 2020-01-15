<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- 카카오로그인 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 구글로그인 -->
<link rel="stylesheet" type="text/css" href="./css/loginform.css" />
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/>
  <script src="https://apis.google.com/js/api:client.js"></script>
  <script>
  var googleUser = {};
  var startApp = function() {
    gapi.load('auth2', function(){
      auth2 = gapi.auth2.init({
        client_id: '114414180398-eck8pdo38mttlb5d0jbs3j3ro8jejk9p.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
      });
      attachSignin(document.getElementById('g-login-btn'));
    });
  };

  function attachSignin(element) {
    console.log(element.id);
    auth2.attachClickHandler(element, {},
        function(googleUser) {
          document.getElementById('name').innerText = "Signed in: " +
              googleUser.getBasicProfile().getName();
        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }
  
  function check_input() {
		var str, i, ch;

		// 아이디 체크 ---->
		if (document.loginform.id.value == "") {
			alert("아이디를 입력하세요!!!");
			document.loginform.id.focus();
			return;
		} else {
			str = document.loginform.id.value;

			for (i = 0; i < str.length; i++) {
				ch = str.substring(i, i + 1);
				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z"))) {
					alert("특수문자가 포함, 다시 입력!!!");
					document.loginform.id.focus();
					return;
				}
			}
		} // 아이디 체크 <----
				
				// 패스워드 체크 ---->
		if (document.loginform.password.value == "") {
			alert("패스워드를 입력하세요 !!!");
			document.loginform.password.focus();
			return;
		} else {
			str = document.loginform.password.value;

			for (i = 0; i < str.length; i++) {
				ch = str.substring(i, i + 1);
				if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z"))) {
					alert("특수문자가 포함, 다시 입력!!!");
					document.loginform.password.focus();
					return;
				}
			}
		} // 패스워드 체크 <----

		loginform.submit();
	}
  </script>

	<title>로그인</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/default.css"/>
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
	<section id="test"> <!-- id 변경해서 사용하세요. -->
	<div class="content"> <!-- 변경하시면 안됩니다. -->
		<div class="title-text"> <!-- 변경하시면 안됩니다. -->
			<h2>로그인</h2>
		</div>
	
		<div id="loginform">
			<form name="loginform" action="./loginprocess.st" method="post">
				<table>
					<tr>
						<td colspan="3"><input type="text" name="id" value="아이디" /></td>
					</tr>
					<tr>
						<td colspan="3"><input type="password" name="password" value="비밀번호" /></td>
					</tr>
					<tr style="height:30px;"></tr>
					<tr>
						<td colspan="3" class="login_button"><a href="javascript:check_input()">로그인</a></td>
					</tr>
					<tr>
						<td><a href="./findform.st">아이디찾기</td>
						<td><a href="./findform.st">|비밀번호 찾기 </td>
						<td><a href="./joinform.st">|회원가입</td>
					</tr>
					<tr>
						<td colspan="3">다른 서비스계정으로 로그인</td>
					</tr>
				
					<!-- 카카오 -->
					<tr>
						<td>
						<a id="kakao-login-btn"></a>
						<a href="http://developers.kakao.com/logout"></a>
						<script type='text/javascript'>
							//사용할 앱의 JavaScript 키 설정
							Kakao.init('4655d068fb7f5b762388735c9fa8e3c9');
							// 카카오 로그인 버튼을 생성합니다.
							Kakao.Auth.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									alert(JSON.stringify(authObj));
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
						</script>
						</td>
					</tr>
					
					<!-- 구글 -->
					<tr>
						<td>
						 <div id="gSignInWrapper">
	    					<div id="g-login-btn">
	      					<span class="icon"></span>
	     					<span class="buttonText">구글계정으로 로그인</span>
	   						 </div>
	   					 </div>
	    				 <div id="name"></div>
	  					<script>startApp();</script>
						</td>
					</tr>
					
					<!-- 네이버 -->
					<tr>
						<td>
						<!-- 네이버아이디로로그인 버튼 노출 영역 -->
						<div id="naverIdLogin"></div>
						<script type="text/javascript">
							var naverLogin = new naver.LoginWithNaverId({
								clientId: "MaBE6KUU0ia5DhWNL3_Q",
								callbackUrl: "http://localhost:9000/springhello/callback",
								isPopup: false, /* 팝업을 통한 연동처리 여부 */
								loginButton: {color: "green", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
							});
		
							/* 설정정보를 초기화하고 연동을 준비 */
							naverLogin.init();
						</script>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<!-- 여기까지 작성하세요. 스크립트는 아래에 더 작성해도 무관함. -->
	
	<div id="footer"></div>
</body>
</html>