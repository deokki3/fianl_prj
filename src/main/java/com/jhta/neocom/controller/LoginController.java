package com.jhta.neocom.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.neocom.model.MemberInfoVo;
import com.jhta.neocom.service.MemberInfoService;

@Controller
public class LoginController {
	@Autowired
	private MemberInfoService service;

	@GetMapping("/login")
	public String login() {
		return "frontend/login";
	}

	@PostMapping("/login")
	public String login(String id, String pwd, HttpSession session, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		int mem_no = service.searchNo(id);
		System.out.println(mem_no);
		map.put("id", id);
		map.put("password", pwd);
		MemberInfoVo vo = service.isMember(map);
		System.out.println(vo);
		if (vo != null) { // 회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			session.setAttribute("mem_no", mem_no);
			return "redirect:/";

		} else {
			model.addAttribute("errMsg", "아이디 또는 비밀번호가 맞지않습니다.");
			return "frontend/login";
		}
	}

	@GetMapping("/memlogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
