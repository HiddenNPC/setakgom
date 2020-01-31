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

public class GoogleLoginBO {
   private final static String CLIENT_ID = "114414180398-cjl49jqvelctnaiuvj6vi2ffjbrrv1dc.apps.googleusercontent.com";
   private final static String CLIENT_SECRET = "2jmyDlVSqYp_H14rBWC9tc3c";
   private final static String REDIRECT_URI ="http://localhost:8000/setak/google.do";
   private final static String SCOPE1 = "https://www.googleapis.com/auth/plus.login";
   
   /* 프로필 조회 API URL */
   
   /* 구글 아이디로 인증 URL 생성 Method */
   public static String getAuthorizationUrl(HttpSession session) {
      String url = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code"
            +"&client_id="+CLIENT_ID+"&scope="+SCOPE1+"&redirect_uri="+REDIRECT_URI;
   return url;
   }
   
   /*구글 아이디로 callback처리 및  accessToken 획득*/
   public static JsonNode getGoogleAccessToken(String code) {
       final String RequestUrl = "https://oauth2.googleapis.com/token"; // Host
           final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
    
           postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
           postParams.add(new BasicNameValuePair("client_id", CLIENT_ID)); // REST API KEY
           postParams.add(new BasicNameValuePair("client_secret", CLIENT_SECRET)); 
           postParams.add(new BasicNameValuePair("redirect_uri", REDIRECT_URI)); // 리다이렉트 URI
           postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
    
           final HttpClient client = HttpClientBuilder.create().build();
           final HttpPost post = new HttpPost(RequestUrl);
    
           
           JsonNode returnNode = null;
    
           try {
               post.setEntity(new UrlEncodedFormEntity(postParams));
    
               final HttpResponse response = client.execute(post);
               final int responseCode = response.getStatusLine().getStatusCode();
    
               System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
               System.out.println("Post parameters : " + postParams);
               System.out.println("Response Code : " + responseCode);
    
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
      
    public static JsonNode getGoogleUserInfo(JsonNode accessToken) {
       final String RequestUrl = "https://www.googleapis.com/auth/contacts";
       final HttpClient client = HttpClientBuilder.create().build();
           final HttpPost post = new HttpPost(RequestUrl);
    
           // add header
           post.addHeader("Authorization", "Bearer " + accessToken);
    
           JsonNode returnNode = null;
    
           try {
               final HttpResponse response = client.execute(post);
               final int responseCode = response.getStatusLine().getStatusCode();
    
               System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
               System.out.println("Response Code : " + responseCode);
    
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