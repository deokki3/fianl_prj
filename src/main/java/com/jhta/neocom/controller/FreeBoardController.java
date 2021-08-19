package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {
	
	@RequestMapping(value = "community/freeboard_list")
	public String freeboard_list(Model model) {
		return "frontend/community/freeboard_list";
	}
}
