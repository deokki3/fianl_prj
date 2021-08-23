package com.jhta.neocom.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.model.ReviewVo;
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
	@Autowired ProductService service;
	@Autowired ImgFileService service1;
	@Autowired CategoryService service2;
	@Autowired MemberService service3;
	@Autowired ReviewService r_service;
	
	//상품 리스트ajax
	@RequestMapping(value = "/shop/ajaxlist",produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String,Object> cpulist(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,String order,int category_id,
			String keyword){
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount = service.getCount(map);// 전체 글의 갯수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		HashMap<String,Object> pmap=new HashMap<String, Object>();
		pmap.put("startRow",pu.getStartRow());
		pmap.put("endRow", pu.getEndRow());
		map.put("order",order);
		map.put("category_id", category_id);
		map.put("keyword", keyword);
		List<HashMap<String, Object>> list = service.list(map);
		map.put("list", list);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("pageCount", pu.getTotalPageCount());
		map.put("pageNum", pageNum);
		return map;
	} 
	
	//상품 리스트(product_list) 페이지 
	@GetMapping(value = "/shop/product_list") 
    public ModelAndView frontendProductList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword,String order,int category_id) { 
  		ModelAndView mv = new ModelAndView("frontend/shop/product_list");
  			mv.addObject("category_id", category_id);
  			mv.addObject("keyword",keyword);

  	


  		return mv; 
       
    }
 //상품 디테일
	@RequestMapping(value = "/shop/product_detail")
    public ModelAndView frontendProductDetail(@RequestParam("n") int product_id,@RequestParam("m") int category_id) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		
		map.put("product_id", product_id);
		map.put("category_id", category_id);
		
		ProductVo vo=service.select(product_id);//하나만 뽑아오는애 잘 받아옴 알아서
		List<Product_ImgVo> list=service1.find(product_id);  //imgVo의 리스트 where product_id
		String cvo=service2.selectone(map); //카테고리명을 가져오기위함
		

		List<HashMap<String, Integer>> clist=service2.selectjoin(product_id); // 카테고리 오더순서및 네임을 가져오기 위함 얘는 못받아옴

		ModelAndView mv = new ModelAndView("/frontend/shop/product_detail");
		
		mv.addObject("goods", vo); //ProductVo의 vo
		mv.addObject("cvo", cvo);//cvo ==> name쓰기용

		mv.addObject("clist", clist); //category 리스트

		mv.addObject("list", list);  //상품 한개당 이미지가 2개이상일 경우 list
		

		return mv;
    }
	
	

	
		@RequestMapping(value="/review/insert",produces= {MediaType.APPLICATION_JSON_VALUE})

		public @ResponseBody HashMap<String,Object> insert(String review_title,String review_content, HttpSession session,int star,int product_id,MultipartFile file1){
			String id = (String) session.getAttribute("id");
			MemberVo mvo = service3.select(id);
		
			
			
			String img_path = uploadFilePath + "\\product_img";
			String review_img_origin=file1.getOriginalFilename(); //전송된 파일명
			String review_img=UUID.randomUUID() + "_" +review_img_origin;
		
			HashMap<String,Object> map=new HashMap<String,Object>();
			try {
				//1.파일업로드 하기
				InputStream is=file1.getInputStream();
				FileOutputStream fos=new FileOutputStream(img_path+"\\"+review_img);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				
				//2.업로드된 파일정보 DB에 저장하기 
			
				ReviewVo vo =new ReviewVo(0,mvo.getMem_no(),mvo.getNickname(),product_id,review_title,review_content,
						star,review_img,review_img_origin,null);
				int n=r_service.insert(vo);
				map.put("code","success");
				
			}catch(Exception e) {
				e.printStackTrace();
				map.put("code","fail");
			}
			return map;
		}
	

	
	//상품 리스트ajax
		@RequestMapping(value = "/review/ajaxlist",produces= {MediaType.APPLICATION_JSON_VALUE})
		public @ResponseBody HashMap<String,Object> reviewlist(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,int product_id){
			HashMap<String,Object> map=new HashMap<String, Object>();
		
			int totalRowCount = r_service.getCount(map);// 전체 글의 갯수
		
			PageUtil pu = new PageUtil(pageNum, 3, 10, totalRowCount);
			int startRow = pu.getStartRow() - 1;
			

			map.put("startRow",startRow);
			map.put("product_id", product_id);
		
			List<HashMap<String, Object>> review = r_service.ajaxlist(map);
		
			map.put("review", review);
			map.put("startPageNum", pu.getStartPageNum());
			map.put("endPageNum", pu.getEndPageNum());
			map.put("pageCount", pu.getTotalPageCount());
		
			map.put("pageNum", pageNum);
			return map;
		} 
	

	
}
