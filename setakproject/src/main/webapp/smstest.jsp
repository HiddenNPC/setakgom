<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.spring.setak.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.ajax-cross-origin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#header").load("./header.jsp")
		$("#footer").load("./footer.jsp")     
		
		
		$("#btnSubmit").click(function (event) {
			var hostNameURL = "https://sens.apigw.ntruss.com";
			var requestUrl = "/sms/v2"+"/services/"+ "ncp:sms:kr:257922917697:setakgom"+"/messages";   // 요청 URL + 서비스 ID
			var accessKey = "hl1BnDwWlEX9KcAGKYpd";                      // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
			var secretKey = "vEnfUJQ41Loi0pkvRSH70RawQzSkhWxlps5VEA52";                      // 2차 인증을 위해 서비스마다 할당되는 service secret
			requestUrl=encodeURI(requestUrl);
			var api_url = hostNameURL + requestUrl;
			
			var space = " ";				    // one space
			var newLine = "\n";				    // new line
			var method = "POST";				// method
			var timestamp = new Date().getTime().toString();		  // current timestamp (epoch)
			
			var request_body = {
					  "type": "SMS",					// 메시지 구분. (SMS, LMS, MMS)
					  "countryCode": "82",				// 국가번호
					  "from": "01027561533",					// 사전 등록된 발신번호
					  "contentType": "COMM",				// 메시지 컨텐츠 구분. (COMM: 일반미시지, AD: 광고메시지)
					  "content": "오늘 교실 왜케춥냐..",					// 기본 메시지 컨텐츠 내용
					  "messages": [
					    {
					      "to": "01049656245"					// 수신번호
					    }
					  ]
					};
         	$.ajax({
         		crossOrigin: true,
                type: "POST",
                url: api_url, 
                data: JSON.stringify(request_body),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: 'json',

                headers: {
                    'X-NCP-APIGW-TIMESTAMP' : timestamp,
                    'X-NCP-IAM-ACCESS-KEY': accessKey,
                    //'X-NCP-APIGW-SIGNATURE-V2': makeSignature(),
                    'content-type' : 'application/json'
                },
                success: function (data) {


                },
                error: function (e) {


				}
			});
         	function makeSignature() {
   	         var message = method+space+requestUrl+newLine+timestamp+newLine+accessKey;
   	         var hmac = CryptoJS.createHmac('sha256', secretKey).update(message).digest("base64");
   	         return hmac;
   	     }
		});
	});
	 
	
      
    </script>
</head>
<body>
	<input type = "button" value = "메모리" id="btnSubmit">
</body>
</html> 