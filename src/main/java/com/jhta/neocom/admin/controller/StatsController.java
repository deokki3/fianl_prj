package com.jhta.neocom.admin.controller;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.service.StatsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StatsController {
    @Autowired
    StatsService service;

    @RequestMapping(value = "/admin/stats/totsales")
    public @ResponseBody HashMap<String, Object> totsales(@RequestParam HashMap<String, Object> map) {
        HashMap<String, Object> result = new HashMap<String, Object>();
        System.out.println(map.get("startDate"));
        System.out.println(map.get("endDate"));

        result.put("totSales", service.selectTotSales(map).get("totSales"));
        result.put("orderCount", service.selectTotSales(map).get("orderCount"));
        result.put("cartCount", service.selectCartCount().get("cartCount"));
        result.put("allOrderCount", service.selectAllOrderCount().get("allOrderCount"));
        result.put("cancleCount", service.selectCancleCount().get("cancleCount"));
        result.put("memberCount", service.selectMemberCount(map).get("memberCount"));
        result.put("allMemberCount", service.selectAllMemberCount().get("allMemberCount"));

        List<HashMap<String, Object>> topSellingList = service.selectTopSelling();
        result.put("topSellingList", topSellingList);

        return result;
    }
}