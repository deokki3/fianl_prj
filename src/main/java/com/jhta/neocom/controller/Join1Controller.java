package com.jhta.neocom.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.MemberVo;

@Controller
public class Join1Controller {
	@RequestMapping(value="/account/join1", method = RequestMethod.GET)
	public String join1Form() {
		return "frontend/account/join1";
	}
	
	@RequestMapping(value="/account/join1", method = RequestMethod.POST)
	public String join1(@RequestParam(value = "agree",defaultValue = "false")Boolean agree, Model model) {
		if(!agree) {
			return "/frontend/account/join1";
		}else {
			model.addAttribute("memberVo", new MemberVo());
			return "/frontend/account/join2";
		}
		
		
	}
}
