package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping(value = "/account/mypage_order")
    public String frontendMyPageOrder() {
        return "frontend/account/mypage_order";
    }

	@RequestMapping(value = "/account/mypage_delivery")
    public String frontendMyPageDelivery() {
        return "frontend/account/mypage_delivery";
    }
	
}
