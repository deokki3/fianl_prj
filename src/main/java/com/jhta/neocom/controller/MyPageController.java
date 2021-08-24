package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.service.OrderMainService;

@RestController
public class MyPageController {
    @Autowired
    private OrderMainService service;


    @RequestMapping(value = "/account/mypage_order", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ModelAndView frontendMyPageOrder(Authentication authentication) {
        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        List<OrderMainVo> myOrderList = service.myOrderList(mem_no);
        System.out.println("mem_no은"+mem_no+"리시트는"+myOrderList);
        ModelAndView mv = new ModelAndView("frontend/account/mypage_order");
        mv.addObject("myOrderList", myOrderList);
        
        return mv;

    }
    
    @RequestMapping(value = "/account/mypage_order2", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> MyPageOrderList(Authentication authentication) {
        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        
        List<OrderMainVo> myOrderList = service.myOrderList(mem_no);
        map.put("myOrderList", myOrderList);
        
        return map;

    }
    

    @RequestMapping(value = "/OrderCC", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> deleteOrder(Authentication authentication,int order_no) {
    	CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo vo = cud.getMemberVo();
		int mem_no = vo.getMem_no();
		System.out.println(order_no);
    	HashMap<String, Object> map=new HashMap<String, Object>();
    	map.put("order_no",order_no);
    	map.put("order_status", "취소 완료");
    	service.updateCC(map);
    	
    	return map;
    }
    
    @RequestMapping(value = "/OrderPaymentCC", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> OrderPaymentCC(Authentication authentication,int order_no) {
    	CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo vo = cud.getMemberVo();
		int mem_no = vo.getMem_no();
		System.out.println(order_no);
		HashMap<String, Object> map=new HashMap<String, Object>();
    	return map;
    }

    @RequestMapping(value = "/account/mypage_delivery")
    public String frontendMyPageDelivery() {
        return "frontend/account/mypage_delivery";
    }

    @RequestMapping(value = "/account/mypage_question")
    public String frontendMyPageQuestion() {
        return "frontend/account/mypage_question";
    }

    @RequestMapping(value = "/account/mypage_wishlist")
    public String frontendMyPageWishlist() {
        return "frontend/account/mypage_wishlist";
    }

    @RequestMapping(value = "/account/mypage_myreview")
    public String frontendMyPageMyreview() {
        return "frontend/account/mypage_myreview";
    }

    @RequestMapping(value = "/account/mypage_modify")
    public String frontendMyPageModify() {
        return "frontend/account/mypage_modify";
    }

}
