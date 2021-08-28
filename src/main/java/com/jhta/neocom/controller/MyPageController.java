package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.OrderCancelVo;
import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.service.OrderCancelService;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.PaymentService;


@RestController
public class MyPageController {
    @Autowired
    private OrderMainService service;
    @Autowired
    private PaymentService pservice;
    @Autowired
    private OrderCancelService occservice;


    @RequestMapping(value = "/account/mypage_order", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ModelAndView frontendMyPageOrder(Authentication authentication) {

        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        List<OrderMainVo> myOrderList = service.myOrderList(mem_no);
        //System.out.println("mem_no은"+mem_no+"리시트는"+myOrderList);
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
		List<OrderMainVo> searchOrder=service.searchOrder(order_no);
		System.out.println(order_no);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("searchOrder", searchOrder);
    	return map;
    }
    
    @PostMapping("/abcd")
    public ModelAndView order_cc(OrderCancelVo vo,Model model) {
    	int pnum=pservice.searchnum(vo.getOrder_no());
    	vo.setPayment_num(pnum);
    	vo.setOd_cc_status("취소 접수");
    	System.out.println(vo+":변경후");
    	occservice.insert(vo);
    	HashMap<String, Object> map=new HashMap<String, Object>();
    	map.put("order_no", vo.getOrder_no());
    	map.put("order_status", "취소 접수");
    	service.updateCC(map);
    	ModelAndView mv = new ModelAndView("frontend/account/mypage_delivery");
        return mv;
    }

}