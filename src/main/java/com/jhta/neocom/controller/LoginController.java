package com.jhta.neocom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.NaverLoginVo;

@Controller
public class LoginController {
	private NaverLoginVo naverLoginVo;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginVo naverLoginVo) {
		this.naverLoginVo = naverLoginVo;
	}

	@RequestMapping(value = "/account/login", method = RequestMethod.GET)
	public String loginForm(Model model, HttpSession session, boolean error) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVo.getAuthorizationUrl(session);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		if (error == true) {
			String errMsg = "아이디 또는 비밀번호가 틀렸습니다.";
			model.addAttribute("errMsg", errMsg);
		}

		return "frontend/account/login";
	}

	@RequestMapping(value = "/account/login", method = RequestMethod.POST)
	public String login(Authentication authentication, MemberVo vo, Model model) {
		System.out.println("로그인 컨트롤러 vo : " + vo);
		System.out.println("로그인 컨트롤러 : " + authentication.getPrincipal() + ", " + authentication.getCredentials() + ", "
				+ authentication.getAuthorities());

		return "redirect:/";
	}

	@RequestMapping(value = "/account/denied", method = RequestMethod.POST)
	public String logout() {
		return "frontend/account/denied";
	}

	@GetMapping("/account/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
