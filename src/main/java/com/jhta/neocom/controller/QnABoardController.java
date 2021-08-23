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
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.QnABoardService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class QnABoardController {
	@Autowired
	private QnABoardService service;
	@Autowired
	private MemberService m_service; // 접속중인 id 세션값 받아와서 mem_no 회원번호 가져오기

	// 문의게시판 문의하기 클릭
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/qnaboard_insert";
	}

	// 문의게시판 글 작성
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.POST)
	public String qnaboard_insertOk(Model model, QnABoardVo vo, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		int mem_no = m_service.searchNo(id);
		vo.setMem_no(mem_no);
		
		System.out.println(vo);
		service.insert(vo);

		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 답변하기 클릭
	@RequestMapping(value = "/community/qnaboard_insertReply", method = RequestMethod.GET)
	public String qnaboard_insertReply(Model model, int qna_board_no) {
		HashMap<String, Object> map = service.detail(qna_board_no);
		model.addAttribute("map", map);

		return "frontend/community/qnaboard_insertReply";
	}

	// 문의게시판 답변 작성
	@RequestMapping(value = "/community/qnaboard_insertReply", method = RequestMethod.POST)
	public String qnaboard_insertReplyOk(Model model, QnABoardVo vo, HttpSession session, int qna_board_no)
			throws Exception {
		String id = (String) session.getAttribute("id");
		int mem_no = m_service.searchNo(id);
		vo.setMem_no(mem_no);

		HashMap<String, Object> map = service.detail(qna_board_no);
		System.out.println(map);
		int groupNo = Integer.parseInt(map.get("qna_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("qna_group_order").toString());
		int groupDepth = Integer.parseInt(map.get("qna_group_depth").toString());

		vo.setQna_group_no(groupNo);
		vo.setQna_group_order(groupOrder);
		vo.setQna_group_depth(groupDepth);

		System.out.println();
		System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + vo);
		System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + groupNo + "ㅇㅇㅇ" + groupOrder + "ㅇㅇㅇ" + groupDepth);
		System.out.println();

		service.insertReply(vo);

		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 삭제
	@RequestMapping(value = "community/qnaboard_delete", method = RequestMethod.GET)
	public String qnaboard_delete(Model model, int qna_board_no) {
		service.delete(qna_board_no);
		return "frontend/community/qnaboard_list";
	}

	// 문의게시판 수정 페이지 이동
	@RequestMapping(value = "community/qnaboard_update", method = RequestMethod.GET)
	public String qnaboard_update(Model model, int qna_board_no) {
		HashMap<String, Object> map = service.detail(qna_board_no);
		model.addAttribute("map", map);
		return "frontend/community/qnaboard_update";
	}

	// 문의게시판 수정 등록
	@RequestMapping(value = "community/qnaboard_update", method = RequestMethod.POST)
	public String qnaboard_updateOk() {
		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/qnaboard_list")
	public String qnaboard_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, Model model, HashMap<String, Object> map, HttpSession session, HttpServletRequest req) {

		String id = (String) session.getAttribute("id"); // 로그인 되있는 상태에서만 문의하기 버튼 사용 가능

		map.put("field", field);
		map.put("keyword", keyword);

		int totalRowCount = service.getCount(map); // 전체 글 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow() - 1;
		int endRow = pu.getEndRow();

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		model.addAttribute("list", service.list(map));
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("id", id); // 세션에 있는 로그인 정보 가져오기

		System.out.println(map);

		return "frontend/community/qnaboard_list";
	}

	// 문의게시판 상세 페이지 이동
	@RequestMapping(value = "/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail(Model model, int qna_board_no, boolean qna_secret_chk) {
		if (qna_secret_chk == true) { // true, 비밀글일 경우 게시글 비밀번호 확인 페이지로 이동
			HashMap<String, Object> map = service.detail(qna_board_no);
			model.addAttribute("map", map);

			return "frontend/community/qnaboard_detailLock";

		} else { // false, 비밀글이 아닐 경우 바로 디테일페이지로 이동
			HashMap<String, Object> map = service.detail(qna_board_no);
			service.cntHit(qna_board_no); // 조회수 증가 쿼리
			model.addAttribute("map", map);

			return "frontend/community/qnaboard_detail";
		}
	}

	// 문의게시판 비밀글 확인
	@RequestMapping(value = "/community/qnaboard_detailLock")
	public String qnaboard_detailLock() {
		return "frontend/community/qnaboard_detail";
	}

}
