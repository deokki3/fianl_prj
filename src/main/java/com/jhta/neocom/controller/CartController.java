package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CartVo;
import com.jhta.neocom.service.CartService;




@Controller
public class CartController {
	@Autowired private CartService service;
	
	@RequestMapping("/cartlist")
	public ModelAndView list(HttpSession session,Model model) {
		List<CartVo> cartList=service.cartList(99);

		ModelAndView mv=new ModelAndView("order_dc/cartlist");
		mv.addObject("cartlist",cartList);
		return mv;
	}
	
	@GetMapping("/insertCart")
	public String insertCart(int mem_no,String product_id) {
		HashMap<String , Object> map=new HashMap<String, Object>();
	
		map.put("mem_no",mem_no);
		map.put("product_id",product_id);
		int n=service.insert(map);
			
		return "redirect:/";
	}
	
	@GetMapping("/deleteCart")
	public String deleteCart(int cart_no) {
		int n=service.delete(cart_no);
			
		return "redirect:/cartlist";
	}
	
}
