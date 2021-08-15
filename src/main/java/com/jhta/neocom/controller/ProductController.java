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
	
	@RequestMapping(value = "/shop/product_detail")
    public ModelAndView frontendProductDetail(@RequestParam("n") int product_id ) {
		ProductVo vo=service.select(product_id);//하나만 뽑아오는애
		List<Product_ImgVo> list=service1.find(product_id);  //imgVo의 리스트 where product_id
		
//		Product_ImgVo vo1=service1.selectone(product_id);  
		System.out.println(vo);   
		ModelAndView mv = new ModelAndView("/frontend/shop/product_detail");
		mv.addObject("goods", vo); //ProductVo의 vo
//		System.out.println("vo= "+vo);
//		mv.addObject("img", vo1); //Product_img의 vo
//		System.out.println("vo1="+vo1);
		mv.addObject("list", list);  //상품 한개당 이미지가 2개이상일 경우 select 매핑 따로 추가 (detail 넘어갈 때 필요)
	
//		System.out.println("pvo= "+pvo); 
		return mv;
    }
	
}
