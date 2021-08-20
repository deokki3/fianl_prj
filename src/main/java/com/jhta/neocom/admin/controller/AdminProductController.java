package com.jhta.neocom.admin.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;
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
		Product_ImgVo img_vo = new Product_ImgVo(0, vo.getProduct_id(), "no_img_main.jpg", "no_img_main.jpg", 22314,
				"main");
		service1.insert(img_vo);
		for (String category_id : category_ids) {
			Category_relVo cate_relVo = new Category_relVo(0, vo.getProduct_id(), Integer.parseInt(category_id));
			cate_relService.insert(cate_relVo);
		}

		return "/admin/menu/product/addimg";
	}

	@GetMapping("/admin/product/addimg")
	public String addImg(Model model) {
		model.addAttribute("img_list", service1.list());
		model.addAttribute("product_list", service.selectAll());
		return "/admin/menu/product/addimg";

	}

	@PostMapping("/admin/product/addimg")
	public String insertImg(Model model, List<MultipartFile> imgs,
			@RequestParam(value = "img_categories") List<String> img_categories, int product_id) {
		// 업로드할 폴더의 절대 경로 구하기
		String img_path = uploadFilePath + "\\product_img";

		System.out.println(img_path);

		for (MultipartFile img : imgs) {
			String img_name_origin = img.getOriginalFilename(); // 전송된 파일명
			String img_name_save = UUID.randomUUID() + "_" + img_name_origin;
			long img_size = img.getSize();

			try {
				InputStream is = img.getInputStream();
				FileOutputStream fos = new FileOutputStream(img_path + "\\" + img_name_save);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				// 업로드된 파일정보 DB에 저장하기

				Product_ImgVo vo = new Product_ImgVo(0, product_id, img_name_save, img_name_origin, img_size, null);

				service1.insert(vo);

				model.addAttribute("code", "successs");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("code", "fail");
			}
		}

		return "/admin/menu/product/addimg";
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
