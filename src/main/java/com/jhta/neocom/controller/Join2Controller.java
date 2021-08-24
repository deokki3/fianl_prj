package com.jhta.neocom.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		MemberVo vo=new MemberVo(memberVo.getMem_no(), memberVo.getNickname(), memberVo.getPhone(), memberVo.getBirth_date(), null, memberVo.getName(), memberVo.getId(), memberVo.getPassword(), memberVo.getRoles());
		service.insert(memberVo);
		service.insert_role(memberVo.getMem_no());
		return "/frontend/account/join3";

	}

}
