package com.jhta.neocom.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.FreeBoardVo;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.FreeBoardService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class FreeBoardController {
	@Autowired private FreeBoardService service;
	
	// 자유게시판 등록 페이지 이동
	@RequestMapping(value = "/community/freeboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/freeboard_insert";
	}
	
	// 자유게시판 글 작성
	@RequestMapping(value = "/community/freeboard_insert", method = RequestMethod.POST)
	public String freeboard_insertOk(Model model, FreeBoardVo vo, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);
		
		service.insert(vo);
		
		return "redirect:/community/freeboard_list";
	}
	
	// 자유게시판 답변하기 클릭
	@RequestMapping(value = "/community/freeboard_reply", method = RequestMethod.GET)
	public String freeboard_insertReply(Model model, int free_board_no) {
		HashMap<String, Object> map = service.detail(free_board_no);
		model.addAttribute("map", map);
		
		return "frontend/community/freeboard_reply";
	}
	
	// 자유게시판 답변 작성
	@RequestMapping(value = "/community/freeboard_reply", method = RequestMethod.POST)
	public String freeboard_replyOk(Model model, FreeBoardVo vo, Authentication auth, int free_board_no) throws Exception{
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);
		
		HashMap<String, Object> map = service.detail(free_board_no);
		
		int groupNo = Integer.parseInt(map.get("free_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("free_group_order").toString());
		int groupDepth = Integer.parseInt(map.get("free_group_depth").toString());
		
		vo.setFree_group_no(groupNo);
		vo.setFree_group_order(groupOrder);
		vo.setFree_group_depth(groupDepth);
		
		System.out.println();
		System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + vo);
		System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + groupNo + "ㅇㅇㅇ" + groupOrder + "ㅇㅇㅇ" + groupDepth);
		System.out.println();
		
		service.ReRe(vo);
		service.insertReply(vo);
		
		return "redirect:/community/freeboard_list";
	}
	
	// 자유게시판 글 삭제
	@RequestMapping(value = "/community/freeboard_delete",method = RequestMethod.GET)
	public String freeboard_delete(Model model, int free_board_no, FreeBoardVo vo) {
		HashMap<String,Object> map = service.detail(free_board_no);
		int groupNo = Integer.parseInt(map.get("free_group_no").toString());
		int mem_no = Integer.parseInt(map.get("mem_no").toString());
		
		int countReply = service.countReply(free_board_no);
		if(countReply == 1) {  //답글 없을 경우 바로 삭제
			service.delete(free_board_no);
		}else if(mem_no == 1 || mem_no == 2) {  // 답글이 있어도 관리자는 바로 삭제 가능
			vo.setFree_group_no(groupNo);
			
			service.delete(free_board_no);
		}else {  // 답글 있을 경우 삭제글로 표시
			service.showDeletePost(free_board_no);
		}
		
		return "redirect:/community/freeboard_list";
	}
	
	// 자유게시판 수정 페이지 이동
	@RequestMapping(value = "/community/freeboard_update", method = RequestMethod.GET)
	public String freeboard_update(Model model, int free_board_no) {
		HashMap<String, Object> map = service.detail(free_board_no);
		model.addAttribute("map", map);
		
		return "frontend/community/freeboard_update";
	}
	
	// 자유게시판 수정 등록
	@RequestMapping(value = "/community/freeboard_update", method = RequestMethod.POST)
	public String freeboard_updateOk(FreeBoardVo vo) {
		service.update(vo);
		
		return "redirect:/community/freeboard_list";
	}
	
	// 자유게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/freeboard_list")
	public String freeboard_list(@RequestParam(value = "pageNum", defaultValue = "1") 
								int pageNum, String field, String keyword, Model model, HashMap<String, Object> map, 
								Authentication auth) {
		
//		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
//		MemberVo mvo = cud.getMemberVo();
//		int mem_no = mvo.getMem_no();
//		String id = mvo.getId();
		
		map.put("field", field);
		map.put("keyword", keyword);
		
		int totalRowCount = service.getCount(map);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow() -1;
		int endRow = pu.getEndRow();
		
		map .put("startRow", startRow);
		map.put("endRow", endRow);
		
		model.addAttribute("list", service.list(map));
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
//		model.addAttribute("id", id);
		
		return "frontend/community/freeboard_list";
	}
	
	// 자유게시판 상세 페이지 이동
	@RequestMapping(value = "/community/freeboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail(int free_board_no, Model model, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		
		HashMap<String, Object> map = service.detail(free_board_no);
		service.cntHit(free_board_no);  // 조회수 증가 쿼리
		model.addAttribute("map", map);
		model.addAttribute("mvo", mvo);
		
		FreeBoardVo prev = service.prev(free_board_no);
		FreeBoardVo next = service.next(free_board_no);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		System.out.println(prev + ", " + next);
		
		return "frontend/community/freeboard_detail";
	}
}


