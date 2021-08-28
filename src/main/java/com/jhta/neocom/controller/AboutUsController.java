package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {
	@RequestMapping(value = "/aboutus/introduction")
    public String frontendAboutUsIntroduction() {
        return "frontend/aboutus/introduction";
    }
	
	@RequestMapping(value = "/aboutus/agreement")
	public String frontendAgreement() {
		return "frontend/aboutus/agreement";
	}
	
	@RequestMapping(value = "/aboutus/privacypolicy")
	public String frontendPrivacyPolicy() {
		return "frontend/aboutus/privacypolicy";
	}
}
