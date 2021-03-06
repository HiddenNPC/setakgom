package com.spring.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
 

public class KakaoLoginBO {
    //카카오 서비스 url 설정 8000, 8080
	//카카오  redirect url 설정  8000, 8080
	private final static String CLIENT_ID = "63f85b95121a3ecad4e9d5e14923c73a";
	private final static String REDIRECT_URI ="http://localhost:8000/setak/kakao";
	
	
	public static String getAuthorizationUrl(HttpSession session) {
		String url = "https://kauth.kakao.com/oauth/authorize?client_id="+CLIENT_ID+"&redirect_uri="+REDIRECT_URI+"&response_type=code";
		return url;
	}

	
	public static JsonNode getKakaoAccessToken(String code) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", "63f85b95121a3ecad4e9d5e14923c73a")); // REST API KEY
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8000/setak/kakao")); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
 
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            //System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            //System.out.println("Post parameters : " + postParams);
            //System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
 
        return returnNode;
    }
	
	
	 public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		 
		 	//System.out.println("정보를 위한 토큰="+accessToken);
	        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	 
	        // add header
	        post.addHeader("Authorization", "Bearer " + accessToken);
	 
	        JsonNode returnNode = null;
	 
	        try {
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	 
	           // System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	           // System.out.println("Response Code : " + responseCode);
	 
	            // JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	 
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	 
	        return returnNode;
	    }


	
	
}
 


