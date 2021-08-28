package com.jhta.neocom.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class PaybackController {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public static final String KEY = "4587276137074224";
	public static final String SECRET = "be111e77389e311ded93023ebeff5996c5c9220069329b163e89a3f6a9727320c8e7648e0bddd55a";


	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} 
	
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private

	List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	} 
	
	// 결제취소
	@RequestMapping(value ="/order/payback1", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> cancelPayment(@RequestParam Map<String, Object> param,String mid) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		post.setHeader("Authorization", getImportToken());
		map.put("merchant_uid", (String)param.get("mid"));
		System.out.println((String)param.get("mid")+ " ::주문번호");
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			System.out.println(enty+ "enty!!");
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
			System.out.println(rootNode.get("response")+" fffff");
			System.out.println(asd+ ":asd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (asd.equals("null")) {
			map2.put("code", "success");
			
			return map2;
		} else {
			map2.put("code", "fail");
			return map2;
		}
	} 
	
	// 아임포트

	public String getAmount(String token, String mId) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mId + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	} 
	
	// 아임포트

	public void setHackCheck(String amount, String mId, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String, String> m = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", mId);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
