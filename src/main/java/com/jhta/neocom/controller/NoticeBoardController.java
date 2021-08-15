package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeBoardController {
	
	@RequestMapping(value = "/community/notice_board")
    public String frontendNoticeBoard() {
        return "frontend/community/notice_board";
    }
	
}
