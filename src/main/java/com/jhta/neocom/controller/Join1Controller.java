package com.jhta.neocom.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	public String join1(@RequestParam(value = "agree",defaultValue = "false")Boolean agree, Model model,HttpServletResponse response) throws IOException {
		if(!agree) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('약관동의체크는 필수사항입니다.');</script>");
			out.flush();
			return "/frontend/account/join1";
		}else {
			model.addAttribute("memberVo", new MemberVo());
			return "/frontend/account/join2";
		}
		
		
	}
}
