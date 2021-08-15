package com.jhta.neocom.admin.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;

@Controller
public class ProductInsertController {
    @Value("${spring.servlet.multipart.location}")
    private String uploadFilePath;

	@Autowired
	private ProductService service;
	@Autowired
	private ImgFileService service1;
	@Autowired
	ServletContext sc;


	@GetMapping("/admin/product/productinsert")
	public String insertForm() {
		return "/admin/menu/product/productinsert";

	}
	

	@PostMapping("/admin/product/productInsert")
	public String insert(ProductVo vo, Model model, MultipartFile img, Product_ImgVo vo1, String img_category) {
		// 업로드할 폴더의 절대 경로 구하기
		
		String img_path = uploadFilePath;
		
		System.out.println(img_path);
		String img_name_origin = img.getOriginalFilename(); // 전송된 파일명
		String img_name_save = UUID.randomUUID() + "_" + img_name_origin;
		long img_size = img.getSize();
	
		
		try {
			service.insert(vo);
			InputStream is = img.getInputStream();
			FileOutputStream fos = new FileOutputStream(img_path + "\\" + img_name_save);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			// 2.업로드된 파일정보 DB에 저장하기
			
			System.out.println(vo.getProduct_id());
			vo1 = new Product_ImgVo(0, vo.getProduct_id(), img_name_save, img_name_origin, img_path, img_size,
					img_category);

   


			service1.insert(vo1);

			model.addAttribute("code", "successs");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("code", "fail");
		}
		return "/admin/menu/product/result";
	}

}
