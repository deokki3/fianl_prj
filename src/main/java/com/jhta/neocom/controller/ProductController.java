package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.service.CategoryService;
import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;


@Controller
public class ProductController {
	 @Value("${spring.servlet.multipart.location}")
	    private String uploadFilePath;
	@Autowired ProductService service;
	@Autowired ImgFileService service1;
	@Autowired CategoryService service2;
	
	
	@RequestMapping(value = "/shop/product_list")
    public String frontendProductList() {
        return "frontend/shop/product_list";
    }
	
	@RequestMapping(value = "/shop/product_detail")
    public ModelAndView frontendProductDetail(@RequestParam("n") int product_id,@RequestParam("m") int category_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("product_id", product_id);
		map.put("category_id", category_id);
		
		ProductVo vo=service.select(product_id);//하나만 뽑아오는애 잘 받아옴 알아서
		List<Product_ImgVo> list=service1.find(product_id);  //imgVo의 리스트 where product_id
		String cvo=service2.selectone(map); //카테고리명을 가져오기위함
		
//		List<HashMap<String, Integer>> rlist = service.list(map);
		List<HashMap<String, Integer>> clist=service2.selectjoin(product_id); // 카테고리 오더순서및 네임을 가져오기 위함 얘는 못받아옴
		System.out.println(vo);   
//		System.out.println("rlist====="+rlist);
		ModelAndView mv = new ModelAndView("/frontend/shop/product_detail");
		mv.addObject("goods", vo); //ProductVo의 vo
		mv.addObject("cvo", cvo);//cvo ==> name쓰기용
		System.out.println("cvo===="+cvo);
		System.out.println("clist======"+clist);
		mv.addObject("clist", clist); //category 리스트

		mv.addObject("list", list);  //상품 한개당 이미지가 2개이상일 경우 list
	

		return mv;
    }
	
}
