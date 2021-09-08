package com.jhta.neocom.admin.controller;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminMemberController {
   @Autowired
   MemberService service;
	

    @GetMapping("/admin/member/memlist")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("admin/menu/member/memberlist");
        mv.addObject("list", service.list());

        return mv;
    }

    @PostMapping("/admin/member/update")
    public ModelAndView update(MemberVo vo, Model model) {
        ModelAndView mv = new ModelAndView("admin/menu/member/memberlist");
        service.update(vo);
        mv.addObject("list", service.list());

        return mv;
    }

    @GetMapping("/admin/member/delete")
    public ModelAndView delete(int mem_no) {
        ModelAndView mv = new ModelAndView("admin/menu/member/memberlist");
        service.delete(mem_no);
        mv.addObject("list", service.list());

        return mv;
    }

}
