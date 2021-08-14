package com.jhta.neocom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.service.MemberInfoService;
import com.jhta.neocom.service.OrderMainService;

@Controller
public class PurchaseController {
	@Autowired private MemberInfoService service;
	@Autowired private OrderMainService omservice;
	
	@GetMapping("/purchase")
	public ModelAndView purchase(int product_id,String product_name,int selling_price,int product_count,
			HttpSession session,Model model) {
	/*	if(session!=null) { //회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "order_dc/purchase";
		}else { */
		System.out.println(product_count);
		ModelAndView mv=new ModelAndView("order_dc/purchase");
		mv.addObject("product_count",product_count);
		mv.addObject("product_name",product_name);
		mv.addObject("product_id",product_id);
		Object mem_no=session.getAttribute("mem_no");
		System.out.println(mem_no+"gd");
		mv.addObject("selling_price",selling_price);
		return mv;
	/*	} */
		
	}
	@PostMapping("/purchase")
	public String purchase(OrderMainVo vo,HttpSession session,int product_id,Model model) {
		try {
			int mem_no=(Integer)session.getAttribute("mem_no");
			vo.setMem_no(mem_no);
			System.out.println(mem_no);
			
			//vo.setMem_no(mem_no);
			//int mem_no=Integer.parseInt(mem_no2);
			System.out.println(product_id);
			System.out.println(vo.getDiscount_ref_no());
			System.out.println(vo);
			int n=omservice.insert(vo);
			
			return "order_dc/purchase2";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/order_dc/purchase";
		}
		
		
		
	}
	
	@GetMapping("/purchase2")
	public String perchase(String id,String pwd,HttpSession session,Model model) {
		if(session!=null) { //회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "order_dc/purchase2";
		}else {
			return "order_dc/purchase2";
		}
		
	}

}
