package com.jhta.neocom.controller;

import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.AdvBoardVo;
import com.jhta.neocom.service.AdvBoardService;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class AdvBoardController {

	@Autowired
	AdvBoardService service;
	@Autowired
	MemberService m_service;

	// 글 작성 get
	@RequestMapping(value = "/service/advboard_insert", method = RequestMethod.GET)
	public String getWrite() throws Exception {
		return "frontend/service/advboard_insert";
	}

	// 글 작성 post
	@RequestMapping(value = "/service/advboard_insert", method = RequestMethod.POST)
	public String postWrite(AdvBoardVo vo, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		int mem_no = m_service.searchNo(id);
		vo.setMem_no(mem_no);
		service.create(vo);
		return "redirect:/service/advboard_list";
	}

	// 글 목록
	@RequestMapping("/service/advboard_list")
	public ModelAndView list(HttpSession HttpSession, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.count(map);// 전체 글의 갯수

		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow();// 첫행번호
		int endRow = pu.getEndRow(); // 끝행번호

		System.out.println(startRow);
		System.out.println(endRow);
		System.out.println(pu);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<HashMap<String, Object>> list = service.selectBoardList(map);
		System.out.println(list);
		ModelAndView mv = new ModelAndView("frontend/service/advboard_list");
		mv.addObject("advboardlist", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);

		return mv;
	}

	// 글 삭제
	@GetMapping("advboard/delete")
	public String getDelete(int adv_board_no) throws Exception {
		service.delete(adv_board_no);
		return "redirect:/service/advboard_list";
	}

	// 글 수정 post
	@PostMapping("advboard/update")
	public String postupdate(AdvBoardVo vo, Model model) {
		System.out.println(vo);
		service.update(vo);
		return "redirect:/service/advboard_list";

	}

	// 글 수정 get
	@GetMapping("advboard/update")
	public ModelAndView update(int adv_board_no, Model model) {
		AdvBoardVo vo = service.find(adv_board_no);
		ModelAndView mv = new ModelAndView("frontend/board/BoardUpdate");
		mv.addObject("vo", vo);
		return mv;

	}

}