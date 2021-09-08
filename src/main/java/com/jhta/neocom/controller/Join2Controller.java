package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;

@Controller
public class Join2Controller {
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/account/join2", method = RequestMethod.GET)
	public String joinForm(Model model) {
		model.addAttribute("memberVo", new MemberVo());
		return "/frontend/account/join2";

	}

	@RequestMapping(value = "/account/join2", method = RequestMethod.POST)
	public String join(@Valid @ModelAttribute MemberVo memberVo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			System.out.println("에러발생!!");
			return "/frontend/account/join2";
		}
		System.out.println("오예성공");
		memberVo.setPassword(bCryptPasswordEncoder.encode(memberVo.getPassword()));
		service.insert(memberVo);
		service.insert_role(memberVo.getMem_no());
		return "/frontend/account/join3";

	}

	@RequestMapping(value = "/idcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestParam("id") String id) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.idcheck(id);
		map.put("cnt", count);

		return map;
	}

	@RequestMapping(value = "/emailcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> emailcheck(@RequestParam("email") String email) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.emailcheck(email);
		map.put("cnt", count);

		return map;
	}

}
