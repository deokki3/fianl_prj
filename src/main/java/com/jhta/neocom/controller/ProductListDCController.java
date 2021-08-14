package com.jhta.neocom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.service.ProductService;





@Controller
public class ProductListDCController {
	@Autowired private ProductService service;
	
	@RequestMapping("/productlistDC")
	public ModelAndView list(HttpSession session) {
		List<ProductVo> productlist=service.listTest();
		System.out.println(productlist);
		Object mem_no=session.getAttribute("mem_no");
		System.out.println(mem_no+"gd");
		ModelAndView mv=new ModelAndView("order_dc/productlist");
		mv.addObject("productlist",productlist);
		return mv;
	}
	
	@RequestMapping("/productDetail")
	public ModelAndView productDetail(int product_id,HttpSession session) {
		ProductVo vo=service.select(product_id);
		ModelAndView mv=new ModelAndView("order_dc/productDetail");
			Object mem_no=session.getAttribute("mem_no");
			System.out.println(mem_no+"gd");
			mv.addObject("mem_no",mem_no);
			mv.addObject("vo",vo);
		return mv;
	}

}
