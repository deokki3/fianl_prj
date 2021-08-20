package com.jhta.neocom.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.NoticeBoardVo;
import com.jhta.neocom.service.NoticeBoardService;
import com.jhta.neocom.util.PageUtil;


@Controller
public class NoticeBoardController {
	@Autowired private NoticeBoardService service;
	
	//공지사항 리스트 페이지 이동
	@RequestMapping(value = "/community/noticeboard_list")
    public String noticeboard_list(@RequestParam(value = "pageNum",defaultValue = "1")
    								int pageNum,String field,String keyword,Model model,HashMap<String,Object> map) {
		map.put("field", field);
		map.put("keyword", keyword);
		
		int totalRowCount = service.getCount(map);  //전체 공지사항 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow()-1;
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		model.addAttribute("list",service.list(map));
		model.addAttribute("pu",pu);
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		
        return "frontend/community/noticeboard_list";
    }
	
	//공지사항 상세 페이지 이동
	@RequestMapping(value = "/community/noticeboard_detail", method = RequestMethod.GET)
	public String noticeboard_detail(Model model,int n_board_no) {
		HashMap<String,Object> map = service.detail(n_board_no);
		service.cntHit(n_board_no);  //조회수 증가 쿼리
		NoticeBoardVo prev = service.prev(n_board_no);
		NoticeBoardVo next = service.next(n_board_no);
		model.addAttribute("map",map);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		return "frontend/community/noticeboard_detail";
	}
	
}