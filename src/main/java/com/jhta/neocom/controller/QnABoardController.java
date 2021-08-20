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
	@Autowired private MemberInfoService m_service;  //접속중인 id 세션값 받아와서 mem_no 회원번호 가져오기
	
	//문의게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/qnaboard_list")
	public String qnaboard_list(@RequestParam(value = "pageNum",defaultValue = "1")
								int pageNum,String field,String keyword,Model model,HashMap<String,Object> map,HttpSession session,HttpServletRequest req) {
		String id = (String)session.getAttribute("id");  //로그인 되있는 상태에서만 문의하기 버튼 사용 가능
	//	String spageNum = req.getParameter("pageNum");
		
	/*	if(spageNum!=null) {
			pageNum = Integer.parseInt(spageNum);
		} */
		
		map.put("field", field);
		map.put("keyword", keyword);
		
		int totalRowCount = service.getCount(map);  //전체 글 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow()-1;
		int endRow = pu.getEndRow();
				
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		model.addAttribute("list",service.list(map));
		model.addAttribute("pu",pu);
	/*	model.addAttribute("pageNum",pageNum); */
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("id",id);  //세션에 있는 로그인 정보 가져오기
		
	/*	System.out.println("리스트" + service.list(map));
		System.out.println("전체글개수" + totalRowCount);
		System.out.println(field + "/" + keyword); */
		
		return "frontend/community/qnaboard_list";
	}
	
	//문의게시판 상세 페이지 이동
	@RequestMapping(value = "/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail(Model model,int qna_board_no) {
		HashMap<String,Object> map = service.detail(qna_board_no);
		service.cntHit(qna_board_no);  //조회수 증가 쿼리
		model.addAttribute("map",map);
		
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
