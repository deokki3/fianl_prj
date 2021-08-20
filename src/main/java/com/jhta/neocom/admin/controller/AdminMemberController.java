package com.jhta.neocom.admin.controller;

import com.jhta.neocom.service.MemberInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMemberController {
    @Autowired
    MemberInfoService service;

    @GetMapping("/admin/member/memlist")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("admin/menu/member/memberlist");
        mv.addObject("list", service.list());

        return mv;
    }
}
