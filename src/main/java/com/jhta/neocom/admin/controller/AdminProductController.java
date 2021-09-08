package com.jhta.neocom.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.neocom.dto.Product_ImgDTO;
import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.model.Category_relVo;
import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.service.CategoryService;
import com.jhta.neocom.service.Category_relService;
import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;

@Controller
public class AdminProductController {

	@Autowired
	private ProductService service;
	@Autowired
	private ImgFileService service1;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private Category_relService cate_relService;

	@GetMapping("/admin/product/productinsert")
	public String insertForm() {
		return "/admin/menu/product/productinsert";

	}

	@PostMapping("/admin/product/productInsert")
	public String insert(ProductVo vo, Model model, @RequestParam(value = "category_ids") List<String> category_ids) {

		service.insert(vo);
		for (String category_id : category_ids) {
			Category_relVo cate_relVo = new Category_relVo(0, vo.getProduct_id(), Integer.parseInt(category_id));
			cate_relService.insert(cate_relVo);
		}

		for (Product_ImgVo img_vo : vo.getImg_List()) {
			String uploadPath = img_vo.getUploadPath().substring(img_vo.getUploadPath().length() - 10,
					img_vo.getUploadPath().length());
			img_vo.setProduct_id(vo.getProduct_id());
			img_vo.setUploadPath(uploadPath);
			service1.insert(img_vo);
		}

		return "redirect:/admin/product/addimg";
	}

	@GetMapping("/admin/product/productlist")
	public String adminProductList(Model model) {
		model.addAttribute("img_list", service1.list());
		model.addAttribute("product_list", service.selectAll());
		return "/admin/menu/product/productlist";
	}

	@PostMapping("/admin/product/update")
	public String update(ProductVo vo) {

		service.update(vo);
		return "redirect:/admin/product/productlist";
	}

	@GetMapping("/admin/product/addimg")
	public String addImg(Model model) {
		model.addAttribute("img_list", service1.list());
		model.addAttribute("product_list", service.selectAll());
		return "/admin/menu/product/addimg";

	}

	@GetMapping("/admin/product/imgdisplay")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		File file = new File(fileName);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/admin/product/addimg", method = { RequestMethod.POST })
	public @ResponseBody ResponseEntity<List<Product_ImgDTO>> insertImg(Model model,
			@RequestParam(name = "main_img", required = false) MultipartFile main_img,
			@RequestParam(name = "description_img", required = false) MultipartFile description_img) {
		List<Product_ImgDTO> list = new ArrayList<>();

		if (main_img != null) {
			Product_ImgDTO main_ImgDTO = service1.uploadImg(main_img, "main");
			list.add(main_ImgDTO);
		}

		if (description_img != null) {
			Product_ImgDTO description_ImgDTO = service1.uploadImg(description_img, "description");
			list.add(description_ImgDTO);
		}

		return new ResponseEntity<>(list, HttpStatus.OK);

	}

	@PostMapping("/admin/product/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		File file;
		try {
			// 일반 파일일 경우, 파일만 삭제
			file = new File(URLDecoder.decode(fileName, "UTF-8"));
			file.delete();

			// 이미지일 경우, 썸네일을 삭제 후 원본 삭제
			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	// 첨부파일 목록
	@GetMapping(value = "/admin/product/getAttachList")
	@ResponseBody
	public ResponseEntity<List<Product_ImgVo>> getAttachList(int product_id) {
		return new ResponseEntity<>(service1.findByPid(product_id), HttpStatus.OK);
	}

	@RequestMapping(value = "/admin/product/findCategories")
	public @ResponseBody HashMap<String, Object> findChildCategories(int category_parent) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<CategoryVo> list = cateService.findChild(category_parent);

		map.put("upperCategoryList", list);

		for (CategoryVo vo : list) {
			map.put(vo.getCategory_id() + "_list", cateService.findChild(vo.getCategory_id()));
		}

		return map;
	}

}
