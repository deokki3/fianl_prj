package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class IndexController {
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;

	@Autowired
	ProductService service;
	@Autowired
	ImgFileService service1;
	@Autowired
	ServletContext sc;

	@RequestMapping(value = "/")

	public ModelAndView frontend(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);

		int totalRowCount = service.getCount(map);// 전체 글의 갯수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);

		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<HashMap<String, Object>> list = service.list(map);

		ModelAndView mv = new ModelAndView("/frontend/index");
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);

		return mv;

	}

	@RequestMapping(value = "/index_original")
	public String frontendIndex_original() {

		return "frontend/index_original";
	}

}
