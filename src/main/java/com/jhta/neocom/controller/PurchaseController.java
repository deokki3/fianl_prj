package com.jhta.neocom.controller;

import java.text.DecimalFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.model.PaymentVo;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.PaymentService;


@Controller
public class PurchaseController {
	@Autowired private OrderMainService omservice;
	@Autowired private PaymentService pservice;
	
	@GetMapping("/purchase")
	public ModelAndView purchase(int product_id,String product_name,int selling_price,int product_count,
			HttpSession session,Model model) {
	/*	if(session!=null) { //회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "order_dc/purchase";
		}else { */
		System.out.println(product_count);
		ModelAndView mv=new ModelAndView("frontend/order/purchase");
		mv.addObject("product_count",product_count);
		mv.addObject("product_name",product_name);
		mv.addObject("product_id",product_id);
		Object mem_no=session.getAttribute("mem_no");
		System.out.println(mem_no+"gd");
		mv.addObject("selling_price",selling_price);
		return mv;
	/*	} */
		
	}
	
	//주문 등록
	//주문 번호 만들기..
	@PostMapping("/purchase")
	public ModelAndView purchase(OrderMainVo vo,HttpSession session,int product_id,Model model) {
		try {
			int mem_no=(Integer)session.getAttribute("mem_no");
			vo.setMem_no(mem_no);
			
			//주문 번호 만들기(ex:210817 + order_no )
			Calendar cal= Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			String ym= year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) +1);
			String ymd2= ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
			String ymd=ymd2.substring(2,8);
			String order_id2=ymd;
			int order_num=(int)((Math.random()*1000));
			System.out.println("랜덤넘 1번: "+order_num);
			HashMap<String , Object> map1=new HashMap<String, Object>();
			map1.put("order_num",order_num);
			map1.put("mem_no",mem_no);
			OrderMainVo vo2=omservice.searchRndNo(map1);
			System.out.println("vo2 는" + vo2);
			while(vo2!=null) {
				order_num=(int)((Math.random()*1000));
				System.out.println("랜덤2번 : "+order_num);
				map1=new HashMap<String, Object>();
				map1.put("order_num",order_num);
				map1.put("mem_no",mem_no);
				vo2=omservice.searchRndNo(map1);
				
			}
			
			if(vo2==null) {
				System.out.println("else 랜덤 : "+order_num);
				//int order_num=Integer.parseInt(order_id2+rnd);
				vo.setOrder_num(order_num);
			}
			
		
			
			//vo.setMem_no(mem_no);
			//int mem_no=Integer.parseInt(mem_no2);
			System.out.println(product_id);
			System.out.println(vo.getDiscount_ref_no());
			System.out.println(vo);
			omservice.insert(vo);
			
			HashMap<String , Object> map2=new HashMap<String, Object>();
			map2.put("order_num",order_num);
			map2.put("mem_no",mem_no);
			int n2=omservice.searchno(map2);
			System.out.println("searchResult: "+n2);
			HashMap<String , Object> map3=new HashMap<String, Object>();
			String order_num_update2=order_id2+n2;
			int order_num_update=Integer.parseInt(order_num_update2);
			
			System.out.println("num값: "+order_num_update);
			map3.put("order_no",order_num_update);
			
			map3.put("order_no2",n2);
			omservice.updateno(map3);
				ModelAndView mv=new ModelAndView("frontend/order/purchase2");
				mv.addObject("order_no",order_num_update);
				System.out.println("updateResult: "+vo);
				return mv;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			ModelAndView mv=new ModelAndView("redirect:/frontend/order/purchase");
			return mv;
		}
		
		
		
	}
	
	@GetMapping("/purchase2")
	public String perchase(String id,String pwd,HttpSession session,Model model) {
		if(session!=null) { //회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "frontend/order/purchase2";
		}else {
			return "frontend/order/purchase2";
		}
		
	}
	
	@RequestMapping(value="/paymentInsert",produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String,Object> insert(PaymentVo vo){
		HashMap<String,Object> map=new HashMap<String, Object>();
		try {
			System.out.println(vo);
			pservice.insert(vo);
			map.put("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code","fail");
		}
		return map;
	}

}