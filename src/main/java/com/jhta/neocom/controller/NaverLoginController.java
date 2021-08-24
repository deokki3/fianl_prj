package com.jhta.neocom.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jhta.neocom.model.NaverLoginVo;
import com.jhta.neocom.model.Sns_memberInfo;


@Controller
public class NaverLoginController {
	
	private NaverLoginVo naverLoginVo;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginVo naverLoginVo) {
		this.naverLoginVo = naverLoginVo;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverlogin", method = { RequestMethod.GET })
	public ModelAndView naverLoginForm(Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVo.getAuthorizationUrl(session);
		
		mv.setViewName("naverLoginForm");
		mv.addObject("url", naverAuthUrl);
		System.out.println("네이버:" + naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
        return mv;
	}
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", produces = "application/json;charset=utf-8",method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,Sns_memberInfo member,HttpServletRequest request) throws IOException, ParseException{
		System.out.println("여기는 callback");

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVo.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginVo.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
		System.out.println("result" + apiResult);
		
		// 내가 원하는 정보 (이름)만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업 
		JSONParser parser = new JSONParser(); 
		JSONObject jsonobj=(JSONObject)parser.parse(naverLoginVo.getUserProfile(oauthToken).toString());
		
		JSONObject response = (JSONObject) jsonobj.get("response");
		System.out.println("이것은" + jsonobj.get("response"));
        System.out.println("아이디는" + (String)response.get("id"));
		
        
        member.setSns_id((String)response.get("id"));
		member.setSns_name((String)response.get("name"));
		System.out.println(member.getSns_id()+member.getSns_name());
		
		//4.파싱 닉네임 세션으로 저장 
		//session.setAttribute("id",nickname); 14-31
//			session.setAttribute("nname", nname); 
//			session.setAttribute("id", nickname); 
//			session.setAttribute("nbirthday", nbirthday); 
//			session.setAttribute("nage", nage);
//		//세션 생성 
//		mv.setViewName("frontend/index");
		request.getSession(true).setAttribute("id", member.getSns_name());
		return "frontend/index";
		
	}
}
