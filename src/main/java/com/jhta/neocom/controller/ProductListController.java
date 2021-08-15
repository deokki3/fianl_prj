package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.service.ProductService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class ProductListController {
	@Autowired
	ProductService service;

	@RequestMapping("admin/product/productlist")
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);

		int totalRowCount = service.getCount(map);// 전체 글의 갯수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		System.out.println(pu);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<HashMap<String, Object>> list = service.list(map);
		

		ModelAndView mv = new ModelAndView("/admin/menu/product/imglist");
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		// mv.setViewName("/admin/cate/catelist");
		return mv;

	}
}
