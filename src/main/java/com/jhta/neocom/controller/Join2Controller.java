package com.jhta.neocom.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;


@Controller
public class Join2Controller {
	@Autowired MemberService service;
	
	
	/*
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		model.addAttribute("memberVo", new MemberVo());
		return "/frontend/join";
		
	}
	*/
	@RequestMapping(value="/account/join2", method = RequestMethod.POST) 
	public String join(@Valid @ModelAttribute MemberVo memberVo,BindingResult result, Model model) {
		if(result.hasErrors()) {
			System.out.println("에러발생!!");
			return "/frontend/account/join2";
		}
		System.out.println("오예성공");
		service.insert(memberVo);
		return "/frontend/account/join3";
		
	}
		 
}
