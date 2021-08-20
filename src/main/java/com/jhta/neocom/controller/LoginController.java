package com.jhta.neocom.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.NaverLoginVo;
import com.jhta.neocom.service.MemberService;

@Controller
public class LoginController {
	private NaverLoginVo naverLoginVo;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginVo naverLoginVo) {
		this.naverLoginVo = naverLoginVo;
	}

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/account/login", method = RequestMethod.GET)
	public String loginForm(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVo.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "frontend/account/login";
	}

	@RequestMapping(value = "/account/login", method = RequestMethod.POST)
    public String login(String id,String password,HttpSession session,Model model) {		
		HashMap<String, String> map=new HashMap<String, String>();
		int mem_no=memberService.searchNo(id);

		map.put("id", id);
		map.put("password", password);
		System.out.println(map);
		MemberVo vo = memberService.isMember(map);
		System.out.println(vo);
		if (vo != null) {
			session.setAttribute("id", id);
			session.setAttribute("mem_no", mem_no);
			return "redirect:/";
		} else {
			model.addAttribute("errMsg", "아이디 또는 비밀번호를 확인해주세요");
			return "frontend/account/login";

		}
	}

	@GetMapping("/account/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
