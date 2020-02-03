package com.spring.order;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Iamport {
	
	public static final String import_cancel_url = "https://api.iamport.kr/payments/cancel";
	public static final String import_schedule_url = "https://api.iamport.kr/subscribe/payments/schedule";
	
	public String getToken(HttpServletRequest request, HttpServletResponse response,JSONObject json ,String requestURL) throws Exception{

		String _token = "";

		try{
			
			String requestString = "";
			URL url = new URL(requestURL);
			
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setInstanceFollowRedirects(false);  
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os= connection.getOutputStream();

			os.write(json.toString().getBytes());
			connection.connect();

			StringBuilder sb = new StringBuilder(); 

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  

				while ((line = br.readLine()) != null) {  
					sb.append(line + "\n");  
				}

				br.close();
				requestString = sb.toString();

			}

			os.flush();
			connection.disconnect();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if((Long)jsonObj.get("code")  == 0){
				JSONObject getToken = (JSONObject) jsonObj.get("response");
				System.out.println("getToken==>>"+getToken.get("access_token") );
				_token = (String)getToken.get("access_token");
			}

		}catch(Exception e){
			e.printStackTrace();
			_token = "";
		}

		return _token;
	}
	
	
	public int cancelPayment(String token, String mid) {
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(import_cancel_url);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid",  mid);
		String asd = "";
		
		try {
			
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
			
		} catch(Exception e) {
			
			e.printStackTrace();

		}
		
		if(asd.equals("null")) {
			
			System.out.println("환불 실패");
			return -1;
			
		} else {
			
			System.out.println("환불 성공");
			return 1;
			
		}
	}
	
	
	public int subscribeSchedule(String token, String cid, String mid, int amount) {
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(import_schedule_url);
		
		String price = Integer.toString(amount);
		
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("mid : " + mid);
		
        String schedules = "[{\"merchant_uid\":" + "\"" + mid + "\"" + ","
                + "\"schedule_at\":\"1580576884\","
                + "\"amount\":\"100\""
                + "}]";
        
        System.out.println("schedules : " + schedules);
        
		post.setHeader("Authorization", token);
		map.put("customer_uid", cid);
		map.put("schedules", schedules);
		map.put("amount", price); 
		String asd = ""; 
		
		try {
			
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}	
		
		System.out.println("asd : " + asd);
		
		if(asd.equals("null")) {
			System.out.println("결제 예약 실패");
			return -1;
		} else {
			System.out.println("결제 예약 성공");
			return 1;
		}
		
	}

	public List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		
		for(Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		
		return paramList;
	}
}
