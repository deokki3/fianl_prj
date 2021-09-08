package com.jhta.neocom.admin.controller;

import com.jhta.neocom.model.PaymentVo;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.PaymentService;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@Autowired
	OrderMainService service;
	@Autowired
	PaymentService pservice;

	@GetMapping("/admin/order/orderlist")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("admin/menu/order/orderlist");
		mv.addObject("list", service.list());

		return mv;
	}

	@GetMapping("/admin/order/paymentlist")
	public ModelAndView paymentList() {
		ModelAndView mv = new ModelAndView("admin/menu/order/paymentlist");
		mv.addObject("list", pservice.list());
		return mv;
	}

	@RequestMapping(value = "/admin/order/payback", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public HashMap<String, Object> payback(PaymentVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("이동완료!");
		return map;
	}

	// 배송중 으로 변경
	@GetMapping("/admin/order/changeStatus")
	public ModelAndView changeStatus(int order_no) {
		System.out.println(order_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order_status", "배송중");
		map.put("order_no", order_no);
		service.updateDelivery(map);
		ModelAndView mv = new ModelAndView("admin/menu/order/orderlist");
		mv.addObject("list", service.list());
		return mv;
	}

	// 배송 완료 로 변경
	@GetMapping("/admin/order/changeStatus2")
	public ModelAndView changeStatus2(int order_no) {
		System.out.println(order_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order_status", "배송 완료");
		map.put("order_no", order_no);
		service.updateDelivery(map);
		ModelAndView mv = new ModelAndView("admin/menu/order/orderlist");
		mv.addObject("list", service.list());
		return mv;
	}
}
