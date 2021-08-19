package com.jhta.neocom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.service.OrderMainService;

@Controller
public class MyPageController {
	@Autowired private OrderMainService service;
	
	@RequestMapping(value = "/account/mypage_order")
    public ModelAndView frontendMyPageOrder(HttpSession session) {
		int mem_no=(Integer)session.getAttribute("mem_no");
		List<OrderMainVo> myOrderList=service.myOrderList(mem_no);
		ModelAndView mv=new ModelAndView("frontend/account/mypage_order");
		mv.addObject("myOrderList",myOrderList);
		return mv;

    }

	@RequestMapping(value = "/account/mypage_delivery")
    public String frontendMyPageDelivery() {
        return "frontend/account/mypage_delivery";
    }
	
}
