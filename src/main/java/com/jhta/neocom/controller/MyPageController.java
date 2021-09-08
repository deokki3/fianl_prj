package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.OrderCancelVo;
import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.model.SendBackVo;
import com.jhta.neocom.service.OrderCancelService;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.PaymentService;
import com.jhta.neocom.service.SendBackService;
import com.jhta.neocom.util.PageUtil;

@RestController
public class MyPageController {
    @Autowired
    private OrderMainService service;
    @Autowired
    private PaymentService pservice;
    @Autowired
    private OrderCancelService occservice;
    @Autowired
    private SendBackService sbservice;

    @RequestMapping(value = "/account/mypage_order", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ModelAndView frontendMyPageOrder(Authentication authentication) {
        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        System.out.println("mem_no은 :" + mem_no);
        int totalRowCount = service.getCount(mem_no);
        PageUtil pu = new PageUtil(1, 10, 10, totalRowCount);
        int startRow = pu.getStartRow() - 1;
        HashMap<String, Object> map2 = new HashMap<String, Object>();
        map2.put("mem_no", mem_no);
        map2.put("startRow", startRow);
        List<OrderMainVo> myOrderList = service.myOrderList(map2);
        ModelAndView mv = new ModelAndView("frontend/account/mypage_order");
        mv.addObject("pu", pu);
        mv.addObject("myOrderList", myOrderList);

        return mv;

    }

    @RequestMapping(value = "/account/mypage_order3", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ModelAndView frontendMyPageOrder3(Authentication authentication, int pageNum) {
        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        System.out.println("mem_no은 :" + mem_no);
        int totalRowCount = service.getCount(mem_no);
        System.out.println("페이지넘:" + pageNum);
        PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
        int startRow = pu.getStartRow() - 1;
        HashMap<String, Object> map2 = new HashMap<String, Object>();
        map2.put("mem_no", mem_no);
        map2.put("startRow", startRow);
        List<OrderMainVo> myOrderList = service.myOrderList(map2);
        ModelAndView mv = new ModelAndView("frontend/account/mypage_order");
        mv.addObject("pu", pu);
        mv.addObject("pageNum3", pageNum);
        mv.addObject("myOrderList", myOrderList);

        return mv;

    }

    @RequestMapping(value = "/account/mypage_order2", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> MyPageOrderList(Authentication authentication, int pageNum) {
        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        int totalRowCount = service.getCount(mem_no);
        PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
        int startRow = pu.getStartRow() - 1;
        HashMap<String, Object> map2 = new HashMap<String, Object>();
        map2.put("mem_no", mem_no);
        map2.put("startRow", startRow);
        System.out.println(pageNum);
        System.out.println(pu + "puuuuu");
        HashMap<String, Object> map = new HashMap<String, Object>();

        List<OrderMainVo> myOrderList = service.myOrderList(map2);
        map.put("pu", pu);
        map.put("myOrderList", myOrderList);

        return map;

    }

    @RequestMapping(value = "/OrderCC", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> deleteOrder(Authentication authentication, int order_no) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("order_no", order_no);
        map.put("order_status", "취소 완료");
        service.updateCC(map);

        return map;
    }

    @RequestMapping(value = "/OrderPaymentCC", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> OrderPaymentCC(Authentication authentication, int order_no) {
        List<OrderMainVo> searchOrder = service.searchOrder(order_no);
        System.out.println(order_no);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("searchOrder", searchOrder);
        return map;
    }

    @PostMapping("/orderCancelSuccess")
    public ModelAndView order_cc(OrderCancelVo vo, Model model) {
        System.out.println(vo.getOrder_no());
        int pnum = pservice.searchnum(vo.getOrder_no());
        vo.setPayment_num(pnum);
        vo.setOd_cc_status("취소 접수");
        System.out.println(vo + ":변경후");
        occservice.insert(vo);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("order_no", vo.getOrder_no());
        map.put("order_status", "취소 접수");
        map.put("od_cc_status", "취소 접수");
        service.updateCC(map);
        ModelAndView mv = new ModelAndView("frontend/account/mypage_order");
        return mv;
    }

    @GetMapping("/orderCCInfo")
    public ModelAndView OrderCCInfo(Authentication authentication, int order_no) {
        System.out.println(order_no);

        ModelAndView mv = new ModelAndView("frontend/account/orderCCInfo");
        return mv;
    }

    @RequestMapping(value = "/orderReturn", produces = { MediaType.APPLICATION_JSON_VALUE })
    public HashMap<String, Object> orderReturn(Authentication authentication, int order_no) {
        List<OrderMainVo> searchOrder = service.searchOrder(order_no);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("searchOrder", searchOrder);

        return map;
    }

    @PostMapping("/orderReturnSuccess")
    public ModelAndView orderReturnSuccess(SendBackVo vo, Model model) {
        int pnum = pservice.searchnum(vo.getOrder_no());
        vo.setPayment_num(pnum);
        vo.setReturn_status("반품 접수");
        System.out.println(vo + ":변경후");
        sbservice.insert(vo);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("order_no", vo.getOrder_no());
        map.put("order_status", "반품 접수");
        map.put("od_cc_status", "반품 접수");
        service.updateCC(map);
        ModelAndView mv = new ModelAndView("frontend/account/mypage_order");
        return mv;
    }
}
