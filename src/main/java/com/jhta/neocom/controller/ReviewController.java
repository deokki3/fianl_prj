package com.jhta.neocom.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.ReviewVo;
import com.jhta.neocom.service.ReviewService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class ReviewController {
	@Autowired private ReviewService r_service;

	
	// 리뷰게시판 삭제
	@RequestMapping(value = "community/review_delete", method = RequestMethod.GET)
	public String review_delete(Model model, int board_num) {
		
		r_service.delete(board_num);
		return "frontend/community/review_list";
	}

	// 리뷰게시판 수정 페이지 이동
	@GetMapping(value = "community/review_update")
	public String review_update(Model model ,int board_num) {
	
		ReviewVo vo = r_service.detail(board_num);
		System.out.println(board_num);
		model.addAttribute("vo", vo);
		return "frontend/community/review_update";
		
	}

	// 리뷰게시판 수정 등록
	@PostMapping(value = "community/review_update")
	public String review_updateOk(ReviewVo vo) {
		
		r_service.update(vo);
		return "redirect:/community/review_update";
	}

	// 리뷰게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/review_list")
	public String review_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, Model model, HashMap<String, Object> map, Authentication authentication,int product_id) {
 

		map.put("field", field);
		map.put("keyword", keyword);
		map.put("product_id", product_id);

		int totalRowCount = r_service.getCount(map); // 전체 글 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow() - 1;
//		int endRow = pu.getEndRow();

		map.put("startRow", startRow);
//		map.put("endRow", endRow);

		model.addAttribute("list", r_service.list(map));
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		if(authentication!=null) {
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		model.addAttribute("id", mvo.getId()); // 세션에 있는 로그인 정보 가져오기
		}
		System.out.println(map);

		return "frontend/community/review_list";
	}

	// 리뷰게시판 상세 페이지 이동
	@RequestMapping(value = "/community/review_detail", method = RequestMethod.GET)
	public String review_detail(Model model, int board_num) {
			
			
			ReviewVo rvo = r_service.detail(board_num);
			model.addAttribute("rvo", rvo);
			
			

			return "frontend/community/review_detail";
		}
	}

