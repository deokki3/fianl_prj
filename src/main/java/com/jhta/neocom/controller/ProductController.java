package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.service.CategoryService;
import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.ProductService;
import com.jhta.neocom.service.ReviewService;
import com.jhta.neocom.util.PageUtil;

@RestController
public class ProductController {
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;
	@Autowired
	ProductService service;
	@Autowired
	ImgFileService service1;
	@Autowired
	CategoryService service2;
	@Autowired
	MemberService service3;
	@Autowired
	ReviewService r_service;

	// 상품 리스트ajax
	@RequestMapping(value = "/shop/ajaxlist", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> cpulist(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String order, int category_id,
			String keyword, String minPrice, String maxPrice) {

		HashMap<String, Object> pmap = new HashMap<String, Object>(); // 매퍼에 넣을거
		HashMap<String, Object> map = new HashMap<String, Object>(); // list ,grid에 뿌릴거

		int min = Integer.parseInt(minPrice);
		int max = Integer.parseInt(maxPrice);
		pmap.put("minPrice", min);
		pmap.put("maxPrice", max);
		pmap.put("keyword", keyword);
		pmap.put("category_id", category_id);
		pmap.put("order", order);
		int totalRowCount = service.getCount(pmap);// 전체 글의 갯수
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
		pmap.put("startRow", pu.getStartRow() - 1);

		List<HashMap<String, Object>> list = service.list(pmap);
		List<HashMap<String, Object>> detail = service.findcate(pmap);

		map.put("next", pu.isNextPage());
		map.put("prev", pu.isPrevPage());
		if (category_id > 100 && category_id != 20000 && category_id != 10000 && category_id!=1500) {
			map.put("list", detail);

		} else {
			map.put("list", list);
		}
		map.put("startPageNum", pu.getStartPageNum());
		map.put("minPrice", min);
		map.put("maxPrice", max);
		map.put("endPageNum", pu.getEndPageNum());
		map.put("pageCount", pu.getTotalPageCount());
		map.put("pageNum", pageNum);
		map.put("keyword", keyword);

		return map;

	}

	// 상품 리스트(product_list) 페이지 list
	@RequestMapping(value = "/shop/product_list", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView frontendProductList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword, String order, int category_id, String minPrice, String maxPrice) {

		List<CategoryVo> clist = service2.classification(1);
		List<CategoryVo> extrall = service2.classification(2);

		ModelAndView mv = new ModelAndView("frontend/shop/product_list");
		mv.addObject("category_id", category_id);
		mv.addObject("keyword", keyword);
		mv.addObject("minPrice1", minPrice);
		mv.addObject("maxPrice1", maxPrice);
		mv.addObject("clist", clist);
		mv.addObject("all", extrall);

		return mv;

	}

	// 상품 리스트(product_grid) 페이지 grid
	@RequestMapping(value = "/shop/product_grid", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView frontendProductGrid(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword, String order, int category_id, String minPrice, String maxPrice) {
		List<CategoryVo> clist = service2.classification(1);
		List<CategoryVo> extrall = service2.classification(2);

		ModelAndView mv = new ModelAndView("frontend/shop/product_grid");
		mv.addObject("category_id", category_id);
		mv.addObject("keyword", keyword);
		mv.addObject("minPrice1", minPrice);
		mv.addObject("maxPrice1", maxPrice);
		mv.addObject("clist", clist);
		mv.addObject("all", extrall);

		return mv;

	}

	// 상품 디테일
	@RequestMapping(value = "/shop/product_detail")

	public ModelAndView frontendProductDetail(@RequestParam("n") int product_id, @RequestParam("m") int category_id,
			Authentication authentication) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		double avgStar = 0;
		int stars[] = new int[5];

		map.put("product_id", product_id);
		map.put("category_id", category_id);

		ProductVo vo = service.select(product_id);// 하나만 뽑아오는애 잘 받아옴 알아서
		List<Product_ImgVo> list = service1.findByPid(product_id); // imgVo의 리스트 where product_id
		String cvo = service2.selectone(map); // 카테고리명을 가져오기위함

		List<HashMap<String, Integer>> clist = service2.selectjoin(product_id); // 카테고리 오더순서및 네임을 가져오기 위함 얘는 못받아옴
		List<HashMap<String, Integer>> starlist = r_service.getStar(product_id);
		avgStar = r_service.getAvgStar(product_id);
		ModelAndView mv = new ModelAndView("/frontend/shop/product_detail");

		for (int i = 0; i <= 4; i++) {
			map.put("star", i + 1);
			stars[i] = r_service.getCountStar(map);
			mv.addObject("star" + (i + 1), stars[i]);
		} // 별점
		mv.addObject("avg", avgStar);
		mv.addObject("goods", vo); // ProductVo의 vo
		mv.addObject("cvo", cvo);// cvo ==> name쓰기용

		mv.addObject("clist", clist); // category 리스트
		mv.addObject("starlist", starlist);
		mv.addObject("list", list); // 상품 한개당 이미지가 2개이상일 경우 list
		if (authentication != null) {
			CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
			MemberVo mvo = cud.getMemberVo();
			mv.addObject("id", mvo.getId());

		}

		return mv;
	}

}
