package com.jhta.neocom.admin.controller;

import com.jhta.neocom.service.OrderMainService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
    @Autowired
    OrderMainService service;

    @GetMapping("/admin/order/orderlist")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("admin/menu/order/orderlist");
        mv.addObject("list", service.list());

        return mv;
    }
}
