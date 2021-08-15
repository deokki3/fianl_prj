package com.jhta.neocom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;

@Controller
public class ProductController {
	 @Value("${spring.servlet.multipart.location}")
	    private String uploadFilePath;
	@Autowired ProductService service;
	@Autowired ImgFileService service1;
	
	
	@RequestMapping(value = "/shop/product_list")
    public String frontendProductList() {
        return "frontend/shop/product_list";
    }
	
	@RequestMapping(value = "/shop/product_detail", method=RequestMethod.GET)
    public ModelAndView frontendProductDetail(@RequestParam("n") int product_id) {
		ProductVo vo=service.select(product_id);
//		ProductVo pvo=service.selectone(product_id, img_category);
		List<Product_ImgVo> vo1=service1.find(product_id);
		System.out.println(vo1);
		ModelAndView mv = new ModelAndView("/frontend/shop/product_detail");
		mv.addObject("goods", vo); //ProductVo의 vo
		mv.addObject("img", vo1); //Product_img의 vo
//		mv.addObject("pvo", pvo);  //상품 한개당 이미지가 2개이상일 경우 select 매핑 따로 추가 (detail 넘어갈 때 필요)
		return mv;
    }
	
}
