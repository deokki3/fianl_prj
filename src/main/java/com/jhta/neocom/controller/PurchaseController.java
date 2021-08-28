package com.jhta.neocom.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.OrderDetailVo;
import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.model.PaymentVo;
import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.service.OrderDetailService;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.PaymentService;
import com.jhta.neocom.service.ProductService;

@Controller
public class PurchaseController {
	@Autowired
	private OrderMainService omservice;
	@Autowired
	private PaymentService pservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private OrderDetailService odservice;

	// 직접 상품페이지에서 주문
	@PostMapping("/purchase0")
	public ModelAndView purchase0(int product_count, int product_id, String product_name, int selling_price,
			String img_name_save, HttpSession session, Model model) {
		/*
		 * if(session!=null) { //회원인 경우 세션에 아이디 담기 session.setAttribute("id", id);
		 * return "order_dc/purchase"; }else {
		 */
		System.out.println(product_count);
		ModelAndView mv = new ModelAndView("frontend/order/purchase");
		mv.addObject("product_count", product_count);
		mv.addObject("product_id", product_id);
		mv.addObject("product_name", product_name);
		mv.addObject("selling_price", selling_price);
		mv.addObject("img_name_save", img_name_save);
		System.out.println(product_id+"aa"+img_name_save);
		return mv;
		/* } */

	}

	// 장바구니에서 주문
	@RequestMapping(value = "/purchase1", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ModelAndView purchase1(HttpSession session, Model model, @RequestParam("chkbox") ArrayList<Integer> chkbox,
			@RequestParam("cnt") ArrayList<Integer> cnt) {
		/*
		 * if(session!=null) { //회원인 경우 세션에 아이디 담기 session.setAttribute("id", id);
		 * return "order_dc/purchase"; }else {
		 */

		System.out.println(chkbox.size());
		System.out.println(cnt);
		System.out.println(chkbox);

		//int a = Integer.parseInt(chkbox.get(0));
		ArrayList<ProductVo> purchaseList = new ArrayList<ProductVo>();
		for (int i = 0; i < chkbox.size(); i++) {
			purchaseList.addAll(productservice.purchaseList(chkbox.get(i)));
		}
		System.out.println(purchaseList);
		ModelAndView mv = new ModelAndView("frontend/order/purchase");

		mv.addObject("purchaseList", purchaseList);
		mv.addObject("cnt", cnt);
		return mv;

		/* } */

	}

	// 주문 등록
	// 주문 번호 만들기..
	@PostMapping("/purchase")
	public ModelAndView purchase(OrderMainVo vo, String[] product_count, String[] product_id, HttpSession session,
			Model model) {
		try {
			int mem_no = (Integer) session.getAttribute("mem_no");
			vo.setMem_no(mem_no);
			System.out.println(product_count[0]);
			System.out.println(product_id[0]);
			// 주문 번호 만들기(ex:210817 + order_no )
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
			String ymd2 = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
			String ymd = ymd2.substring(2, 8);
			String order_id2 = ymd;
			int order_num = (int) ((Math.random() * 1000));
			System.out.println("랜덤넘 1번: " + order_num);
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("order_num", order_num);
			map1.put("mem_no", mem_no);
			OrderMainVo vo2 = omservice.searchRndNo(map1);
			System.out.println("vo2 는" + vo2);
			while (vo2 != null) {
				order_num = (int) ((Math.random() * 1000));
				System.out.println("랜덤2번 : " + order_num);
				map1 = new HashMap<String, Object>();
				map1.put("order_num", order_num);
				map1.put("mem_no", mem_no);

				// 임시 주문 번호 랜덤값 불러오기.
				vo2 = omservice.searchRndNo(map1);

			}

			// 임시 주문 번호 없을시
			if (vo2 == null) {
				System.out.println("else 랜덤 : " + order_num);
				// int order_num=Integer.parseInt(order_id2+rnd);

				// 임시 주문 번호 vo에 넣기
				vo.setOrder_num(order_num);
			}

			// vo.setMem_no(mem_no);
			// int mem_no=Integer.parseInt(mem_no2);
			System.out.println(vo);

			// 주문 테이블에 추가
			omservice.insert(vo);

			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("order_num", order_num);
			map2.put("mem_no", mem_no);
			int n2 = omservice.searchno(map2);
			System.out.println("searchResult: " + n2);
			HashMap<String, Object> map3 = new HashMap<String, Object>();
			String order_num_update2 = order_id2 + n2;
			int order_num_update = Integer.parseInt(order_num_update2);

			System.out.println("num값: " + order_num_update);
			map3.put("order_no", order_num_update);

			map3.put("order_no2", n2);
			omservice.updateno(map3);
			ModelAndView mv = new ModelAndView("frontend/order/purchase2");
			mv.addObject("order_no", order_num_update);
			
//			vo3.setOrder_no(order_num_update); vo3.setMem_no(mem_no);
//			System.out.println(vo3); odservice.insert(vo3);
			

			OrderDetailVo odvo1 = new OrderDetailVo();

			odvo1.setMem_no(mem_no);
			for (int i = 0; i < product_id.length - 1; i++) {
				System.out.println(product_count[i]);
				int a = Integer.parseInt(product_count[i]);
				System.out.println(a + 2 + "count");
				int b = Integer.parseInt(product_id[i]);

				System.out.println(b + 2 + "id");
				odvo1.setProduct_count(a);
				odvo1.setProduct_id(b);
				odvo1.setOrder_no(order_num_update);
				System.out.println(odvo1);
				odservice.insert(odvo1);
			}

			return mv;

		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mv = new ModelAndView("redirect:/frontend/order/purchase");
			return mv;
		}

	}

	@GetMapping("/purchase2")
	public String perchase(String id, String pwd, HttpSession session, Model model) {
		if (session != null) { // 회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "frontend/order/purchase2";
		} else {
			return "frontend/order/purchase2";
		}

	}

	@RequestMapping(value = "/paymentInsert", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public HashMap<String, Object> insert(PaymentVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			System.out.println(vo);
			pservice.insert(vo);
			map.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}

}