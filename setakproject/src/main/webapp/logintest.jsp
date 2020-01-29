<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
		 $(document).on('click', '.kakao', function(event) {
			 
			var client_id='63f85b95121a3ecad4e9d5e14923c73a';
			var redirect_uri='http%3a%2f%2flocalhost%3a8080%2fsetak%2fkakao';
         	var url1 ='https%3a%2f%2fkauth.kakao.com%2foauth%2fauthorize%3fclient_id%3d'+client_id+'&redirect_uri='+redirect_uri+'&response_type=code';
			alert(url1);
			
         		jQuery.ajax({
						url : url1,  
						type : 'GET',
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : "json", // 서버에서 보내줄 타입
						
						success: function (retVal) {
							alert(retVal);
							if (retVal.res == "OK") {
								
								alert(retVal);
								var code = retVal.code;
								var client_secret = 'PXmGD7ZP1nrjX9Z6iRierua8TgBQBOwT';
								var url2 = 'https://kauth.kakao.com/oauth/token?grant_type=authorization_code&client_id='+client_id+'&redirect_uri='+redirect_uri+'&code='+code+'&client_secret='+client_secret;

								alert(url2);
								$.ajax({
									url: url2,
									type: 'POST',
									contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
									dataType : "json",
									success : function(retVal) {
										if(retVal.res == "OK") {
											
										} else {
											alert('토큰실패');
										}
									},
									error : function(request, error) {
										alert("message : " + request.responseText);
									}
								});
								
							} else {
								alert("코드실패");
							}
						},
	            		error:function() {
							alert("ajax통신 실패!!!!!!!!!");
						}
					});
         	
            
          });
	
</script>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <body>
  <div class="kakao">카카오야ㅠㅠ</div>
  </body>
</html>
