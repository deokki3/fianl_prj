package com.jhta.neocom.model;

import java.util.Map;

import lombok.Builder;
import lombok.Getter;

@Getter
public class OAuthAttributes {
	private Map<String, Object> attributes; 
	private String nameAttributeKey; 
	private String name; 
	private String nickname; 
	private String birthday;
	private String phone;
	
	@Builder
	public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey, String name, String email, String picture) { 
	
		}
	public static OAuthAttributes of(String registrationId, String userNameAttributeName, Map<String, Object> attributes) { 
		if("naver".equals(registrationId)) { 
			return ofNaver("id", attributes); 
			} 
		return null;
		}
	
	private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) { 
		Map<String, Object> response = (Map<String, Object>) attributes.get("response"); 
		return OAuthAttributes.builder() 
				.name((String) response.get("name")) 
				.email((String) response.get("email")) 
				.picture((String) response.get("profile_image")) 
				.attributes(response) 
				.nameAttributeKey(userNameAttributeName) 
				.build(); 
		} 
	public MemberRole toEntity() {
		return null; 
		
	}

}
