package com.jhta.neocom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.neocom.service.ProductService;

@Controller
public class ProductController {
	@Autowired ProductService service;
	
	
	@RequestMapping(value = "/shop/product_list")
    public String frontendProductList() {
        return "frontend/shop/product_list";
    }
	
	@RequestMapping(value = "/shop/product_detail")
    public String frontendProductDetail() {
        return "frontend/shop/product_detail";
    }
	
}
