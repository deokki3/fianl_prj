package com.jhta.neocom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
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

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.ReviewVo;
import com.jhta.neocom.service.ReviewService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class ReviewController {
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;
	@Autowired
	private ReviewService r_service;

	// 리뷰게시판 삭제

	@RequestMapping(value = "/review_delete")
	public String review_delete(int board_num, int product_id) {
		r_service.delete(board_num);
		return "redirect:/review_list?product_id=" + product_id;
	}

	// 리뷰게시판 수정 페이지 이동
	@GetMapping(value = "/review_update")
	public String review_update(Model model, int board_num) {

		ReviewVo vo = r_service.detail(board_num);

		model.addAttribute("vo", vo);
		return "frontend/community/review_update";

	}

	// 리뷰게시판 수정 등록
	@PostMapping(value = "/review_update")
	public String review_updateOk(ReviewVo vo) {

		r_service.update(vo);
		return "redirect:/community/review_list?product_id=" + vo.getProduct_id();
	}

	// 리뷰게시판 리스트 페이지 이동
	@RequestMapping(value = "/review_list")
	public String review_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, Model model, HashMap<String, Object> map, Authentication authentication, int product_id) {

		map.put("field", field);
		map.put("keyword", keyword);
		map.put("product_id", product_id);

		int totalRowCount = r_service.getCount(map); // 전체 글 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow() - 1;
		// int endRow = pu.getEndRow();

		map.put("startRow", startRow);
		// map.put("endRow", endRow);

		model.addAttribute("list", r_service.list(map));
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("product_id", product_id);
		if (authentication != null) {
			CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
			MemberVo mvo = cud.getMemberVo();
			model.addAttribute("id", mvo.getId()); // 세션에 있는 로그인 정보 가져오기
		}

		return "frontend/community/review_list";
	}

	// 리뷰게시판 상세 페이지 이동
	@RequestMapping(value = "/review_detail", method = RequestMethod.GET)
	public String review_detail(Model model, int board_num) {

		ReviewVo rvo = r_service.detail(board_num);
		model.addAttribute("rvo", rvo);

		return "frontend/community/review_detail";
	}

	// 리뷰 AJAX 등록
	@RequestMapping(value = "/review/insert", produces = { MediaType.APPLICATION_JSON_VALUE })

	public @ResponseBody HashMap<String, Object> insert(String review_title, String review_content,
			Authentication authentication, int star, int product_id, MultipartFile file1) {
		// String id = (String) session.getAttribute("id");
		// MemberVo mvo = service3.select(id);
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo mvo = cud.getMemberVo();

		String img_path = uploadFilePath + "\\review_img";
		File dir = new File(img_path);
		if (!dir.isDirectory()) {
			dir.mkdir();

		}

		String review_img_origin = file1.getOriginalFilename(); // 전송된 파일명
		String review_img = UUID.randomUUID() + "_" + review_img_origin;

		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			// 1.파일업로드 하기
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(img_path + "\\" + review_img);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();

			// 2.업로드된 파일정보 DB에 저장하기

			ReviewVo vo = new ReviewVo(0, mvo.getMem_no(), mvo.getNickname(), product_id, review_title, review_content,
					star, review_img, review_img_origin, null);
			r_service.insert(vo);
			map.put("code", "success");

		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}

	// 리뷰 리스트 ajax
	@RequestMapping(value = "/review/ajaxlist", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> reviewlist(
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, int product_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int totalRowCount = r_service.getCount(map);// 전체 글의 갯수

		PageUtil pu = new PageUtil(pageNum, 3, 10, totalRowCount);
		int startRow = pu.getStartRow() - 1;

		map.put("startRow", startRow);
		map.put("product_id", product_id);

		List<HashMap<String, Object>> review = r_service.ajaxlist(map);

		map.put("review", review);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("pageCount", pu.getTotalPageCount());
		map.put("pu", pu);

		map.put("pageNum", pageNum);
		return map;
	}
}
