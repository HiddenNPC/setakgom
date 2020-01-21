package com.spring.setak;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Service;
@Service
public class Sens_sms_v2 {
	
	String msgtext = "";
	
	public String getMsgtext() {
		return msgtext;
	}

	public void setMsgtext(String msgtext) {
		this.msgtext = msgtext;
	}

	public void sendMessage() {
		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "hl1BnDwWlEX9KcAGKYpd";                     		// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
		String secretKey = "vEnfUJQ41Loi0pkvRSH70RawQzSkhWxlps5VEA52";                    		// 2차 인증을 위해 서비스마다 할당되는 service secret
		String serviceId = "ncp:sms:kr:257922917697:setakgom";                     		// 프로젝트에 할당된 SMS 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// String으로 body data 생성
		String body = "{\r\n" + 
				"  \"type\": \"sms\",\r\n" + 		
				"  \"contentType\": \"comm\",\r\n" + 
				"  \"countryCode\": \"82\",\r\n" + 
				"  \"from\": \"01027561533\",\r\n" + 
				"  \"content\": \""+msgtext+"\",\r\n" + 
				"  \"messages\": [\r\n" + 
				"    {"  +
				"  		\"to\": \"01039553966\"\r\n" + 
				"		}\r\n" + 
				"  ]\r\n" +
				"}";
	    
        try {

            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println(responseCode);
            if(responseCode==202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
    }
	
	public String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line
	    

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}
	    

	  return encodeBase64String;
	}
}