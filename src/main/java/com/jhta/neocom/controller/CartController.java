package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CartVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.CartService;

@RestController
public class CartController {
	@Autowired
	private CartService service;

	@RequestMapping(value = "/cart", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ModelAndView list(Authentication authentication, Model model) {
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo vo = cud.getMemberVo();
		int mem_no = vo.getMem_no();
		List<CartVo> cartList = service.cartList(mem_no);

		ModelAndView mv = new ModelAndView("frontend/order/cart");
		mv.addObject("cart", cartList);
		return mv;
	}

	@RequestMapping(value = "/cart2", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> list2(Authentication authentication, Model model) {
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo vo = cud.getMemberVo();
		int mem_no = vo.getMem_no();

		HashMap<String, Object> map = new HashMap<String, Object>();
		List<CartVo> cartList = service.cartList(mem_no);
		map.put("list", cartList);
		return map;
	}

	@GetMapping("/insertCart")
	public String insertCart(Authentication authentication, String product_id) {
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo vo = cud.getMemberVo();
		int mem_no = vo.getMem_no();

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("mem_no", mem_no);
		map.put("product_id", product_id);
		service.insert(map);

		return "redirect:/";
	}

	@GetMapping("/deleteCart")
	public String deleteCart(int cart_no) {
		service.delete(cart_no);

		return "redirect:/cart";
	}

	@RequestMapping(value = "/deleteC", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> delete(int cart_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			service.delete(cart_no);
			map.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}

	@RequestMapping(value = "/updateC", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> update(int product_count, int cart_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		try {
			System.out.println(product_count);
			System.out.println(cart_no);
			map.put("product_count", product_count);
			map.put("cart_no", cart_no);
			service.update(map);
			map2.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map2.put("code", "fail");
		}
		return map;
	}

}