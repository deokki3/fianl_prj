package com.jhta.neocom.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.QnABoardVo;
import com.jhta.neocom.service.MemberInfoService;
import com.jhta.neocom.service.QnABoardService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class QnABoardController {
	@Autowired private QnABoardService service;
	@Autowired private MemberInfoService m_service;
	
	//문의게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/qnaboard_list")
	public String qnaboard_list(@RequestParam(value = "pageNum",defaultValue = "1")int pageNum,String field,String keyword,Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		HashMap<String,Object> map =new HashMap<String,Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		
		int totalRowCount = service.getCount(map);  //전체 글 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow();
//		int endRow = pu.getEndRow();
		map.put("startRow",startRow-1);
//		map.put("endRow",endRow);
		
		model.addAttribute("list",service.list(map));
		model.addAttribute("pu",pu);
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("id",id);
		System.out.println("startRow======"+startRow);
		
		System.out.println("리스트=" + service.list(map));
		System.out.println("전체글개수=" + totalRowCount);
		System.out.println(field + "/" + keyword);
		
		return "frontend/community/qnaboard_list";
	}
	
	//문의게시판 상세 페이지 이동
	@RequestMapping(value = "/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail(Model model,int qna_board_no) {
		QnABoardVo vo = service.detail(qna_board_no);
		model.addAttribute("vo",vo);
		return "frontend/community/qnaboard_detail";
	}
	
	//문의게시판 등록 페이지 이동
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/qnaboard_insert";
	}
	
	//문의게시판 글 작성
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.POST)
	public String qnaboard_insertOk(Model model,QnABoardVo vo,HttpSession session,HttpServletRequest req) throws Exception{
		String id = (String)session.getAttribute("id");
		int mem_no = m_service.searchNo(id);
		vo.setMem_no(mem_no);
		service.insert(vo);
		
		System.out.println(vo);
		return "redirect:/community/qnaboard_list";
	}
}
