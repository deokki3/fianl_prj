package com.jhta.neocom.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CartVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
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
	   @PostMapping("/member/purchase0")
	   public ModelAndView purchase0(int product_count, int product_id, String product_name, int selling_price,
	         String img_name_save, Model model) {
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
	public HashMap<String, Object> purchase1(HttpSession session, Model model,@RequestParam("id") HashMap<String, Object> cart_vo_list) {
	/*public ModelAndView purchase1(HttpSession session, Model model, @RequestParam("chkbox") ArrayList<Integer> chkbox,
			@RequestParam("cnt") ArrayList<Integer> cnt) {
		
		 * if(session!=null) { //회원인 경우 세션에 아이디 담기 session.setAttribute("id", id);
		 * return "order_dc/purchase"; }else {
		 */
		System.out.println(cart_vo_list);
		/*
		//int a = Integer.parseInt(chkbox.get(0));
		ArrayList<ProductVo> purchaseList = new ArrayList<ProductVo>();
		/*for (int i = 0; i < chkbox.size(); i++) {
			purchaseList.addAll(productservice.purchaseList(chkbox.get(i)));
		}
		System.out.println(purchaseList);
		ModelAndView mv = new ModelAndView("frontend/order/purchase");
		
		mv.addObject("purchaseList", purchaseList);
		//mv.addObject("cnt", cnt);
		*/
		HashMap<String, Object> map=new HashMap<String, Object>();
		return map;

		/* } */

	}

	// 주문 등록
	// 주문 번호 만들기..
	@PostMapping("/purchase")
	public ModelAndView purchase(OrderMainVo vo,String[] order_price, String[] product_count,
			String[] product_id, Authentication authentication, Model model) {
		try {
			CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
			MemberVo mvo = cud.getMemberVo();
			int mem_no = mvo.getMem_no();
			vo.setMem_no(mem_no);
			System.out.println(order_price[0]+"원"+product_count[0]+": 개수");
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
			mv.addObject("orderer_name",vo.getOrderer_name());
			mv.addObject("zip_code",vo.getZip_code());
			mv.addObject("order_address",vo.getOrder_address());
			mv.addObject("order_address_detail",vo.getOrder_address_detail());
			
//			OrderDetailVo odvo0 = new OrderDetailVo();
//			odvo0.setMem_no(mem_no);
//			int a0 = Integer.parseInt(product_count);
//			odvo0.setProduct_count(a0);
//			odvo0.setProduct_id(product_id);
//			odvo0.setOrder_price(order_price);
//			odvo0.setOrder_no(order_num_update);
			
//			vo3.setOrder_no(order_num_update); vo3.setMem_no(mem_no);
//			System.out.println(vo3); odservice.insert(vo3);
			
			System.out.println("id랭쓰"+product_id.length);
			OrderDetailVo odvo1 = new OrderDetailVo();
			if(product_id.length==1) {
				int a = Integer.parseInt(product_count[0]);
				System.out.println(a + 2 + "count");
				int b = Integer.parseInt(product_id[0]);
				int c =Integer.parseInt(order_price[0]);
				System.out.println(b + 2 + "id");
				odvo1.setProduct_count(a);
				odvo1.setProduct_id(b);
				odvo1.setOrder_price(c);
				odvo1.setOrder_no(order_num_update);
				System.out.println(odvo1);
				odservice.insert(odvo1);
			}
			odvo1.setMem_no(mem_no);
			for (int i = 0; i < product_id.length - 1; i++) {
				System.out.println(product_count[i]);
				int a = Integer.parseInt(product_count[i]);
				System.out.println(a + 2 + "count");
				int b = Integer.parseInt(product_id[i]);
				int c =Integer.parseInt(order_price[i]);
				System.out.println(b + 2 + "id");
				odvo1.setProduct_count(a);
				odvo1.setProduct_id(b);
				odvo1.setOrder_price(c);
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
	
	//결제 페이지
	@GetMapping("/purchase2")
	public String purchase(String id, int order_no,Authentication authentication, Model model) {
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		HashMap<String, Object> map = new HashMap<String, Object>();
		model.addAttribute("order_no", order_no);
		model.addAttribute("mem_no",mem_no);
		System.out.println(order_no);
		return "frontend/order/purchase2";
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
	
	@GetMapping("/paymentSuccess")
	public String paymentSuccess(HttpSession session, Model model,int order_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order_no",order_no );	
		map.put("order_status","배송 준비중" );
		map.put("payment_status","결제 완료" );
		omservice.update(map);
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("order_no",order_no );	
		map2.put("payment_status","결제 완료" );
		pservice.update(map);
		model.addAttribute("order_no", order_no);
		return "frontend/order/paymentSuccess";
	}
	
	@GetMapping("/paymentFail")
	public String paymentFail(HttpSession session, Model model,String payment_status,int order_no) {
		model.addAttribute("order_no", order_no);
		return "frontend/order/paymentFail";
	}

}