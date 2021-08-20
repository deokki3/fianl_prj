package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {
	@RequestMapping(value = "/aboutus/introduce")
    public String frontendAboutUsIntroduce() {
        return "frontend/aboutus/introduce";
    }
}
