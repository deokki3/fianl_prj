package com.jhta.neocom.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FreeBoardController {
	
	//자유게시판 리스트 페이지 이동
	@RequestMapping(value = "community/freeboard_list")
	public String freeboard_list(Model model) {
		return "frontend/community/freeboard_list";
	}
	
	//자유게시판 등록 페이지 이동
	@RequestMapping(value = "/community/freeboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/freeboard_insert";
	}
	
	//문의게시판 상세 페이지 이동
	@RequestMapping(value = "/community/freeboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail() {
		return "frontend/community/freeboard_detail";
	}
}
