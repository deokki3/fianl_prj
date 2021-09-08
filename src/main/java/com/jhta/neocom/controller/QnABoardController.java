package com.jhta.neocom.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.QnABoardVo;
import com.jhta.neocom.service.QnABoardService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class QnABoardController {
	@Autowired
	private QnABoardService service;

	// 문의게시판 문의하기 클릭
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/qnaboard_insert";
	}

	// 문의게시판 글 작성
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.POST)
	public String qnaboard_insertOk(Model model, QnABoardVo vo, Authentication auth) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);

		service.insert(vo);

		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 답변하기 클릭
	@RequestMapping(value = "/community/qnaboard_reply", method = RequestMethod.GET)
	public String qnaboard_insertReply(Model model, int qna_board_no) {
		HashMap<String, Object> map = service.detail(qna_board_no);
		model.addAttribute("map", map);

		return "frontend/community/qnaboard_reply";
	}

	// 문의게시판 답변 작성
	@RequestMapping(value = "/community/qnaboard_reply", method = RequestMethod.POST)
	public String qnaboard_replyOk(Model model, QnABoardVo vo, Authentication auth, int qna_board_no) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);

		HashMap<String, Object> map = service.detail(qna_board_no);
		// System.out.println(map);
		int groupNo = Integer.parseInt(map.get("qna_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("qna_group_order").toString());
		int groupDepth = Integer.parseInt(map.get("qna_group_depth").toString());
		String qna_secret_chk = map.get("qna_secret_chk").toString();

		if (!qna_secret_chk.equals(null)) { // 문의글이 비밀글인지 아닌지에 따라 등록됨
			if (qna_secret_chk.equals("true")) {
				String qna_password = map.get("qna_password").toString();
				vo.setQna_secret_chk(1);
				vo.setQna_password(qna_password); // 비밀글일 경우 문의작성자가 등록한 비밀번호로 등록
			} else {
				vo.setQna_secret_chk(0);
				vo.setQna_password(null);
			}
		}

		vo.setQna_group_no(groupNo);
		vo.setQna_group_order(groupOrder);
		vo.setQna_group_depth(groupDepth);
		vo.setQna_status(1);

		// System.out.println();
		// System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + vo);
		// System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + groupNo + "ㅇㅇㅇ" + groupOrder + "ㅇㅇㅇ" +
		// groupDepth);
		// System.out.println();

		service.ReRe(vo);
		service.insertReply(vo);
		service.status(vo); // 답변상태 변경

		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 글 삭제
	@RequestMapping(value = "/community/qnaboard_delete", method = RequestMethod.GET)
	public String qnaboard_delete(Model model, int qna_board_no, QnABoardVo vo) {
		HashMap<String, Object> map = service.detail(qna_board_no);
		int groupNo = Integer.parseInt(map.get("qna_group_no").toString());
		int mem_no = Integer.parseInt(map.get("mem_no").toString());
		int groupOrder = Integer.parseInt(map.get("qna_group_order").toString());

		int countReply = service.countReply(qna_board_no);
		if (countReply == (groupOrder + 1)) { // 답글이 없는 경우 혹은 그룹 내 마지막글일 경우
			service.delete(qna_board_no);
		} else if (mem_no == 1 || mem_no == 2) { // 답글이 있어도 관리자일 경우 바로 삭제 + 원글은 답변대기 상태로 변경됨
			vo.setQna_group_no(groupNo);
			vo.setQna_status(0);

			service.delete(qna_board_no);
			service.status(vo);
		} else { // 답글이 있을 경우 제목과 내용 수정해서 삭제글로 표시
			service.showDeletePost(qna_board_no);
		}

		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 수정 페이지 이동
	@RequestMapping(value = "/community/qnaboard_update", method = RequestMethod.GET)
	public String qnaboard_update(Model model, int qna_board_no) {
		HashMap<String, Object> map = service.detail(qna_board_no);
		model.addAttribute("map", map);
		return "frontend/community/qnaboard_update";
	}

	// 문의게시판 수정 등록
	@RequestMapping(value = "/community/qnaboard_update", method = RequestMethod.POST)
	public String qnaboard_updateOk(QnABoardVo vo) {
		System.out.println(vo);
		service.update(vo);

		return "redirect:/community/qnaboard_list";
	}

	// 문의게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/qnaboard_list")
	public String qnaboard_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, Model model, HashMap<String, Object> map, Authentication auth, HttpSession session) {

		// String id = (String) session.getAttribute("id"); // 로그인 되있는 상태에서만 문의하기 버튼 사용 가능
		// CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		// MemberVo mvo = cud.getMemberVo();
		// int mem_no = mvo.getMem_no();
		// String id = mvo.getId();

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
		// model.addAttribute("id", id); // 세션에 있는 로그인 정보 가져오기
		// System.out.println(map);

		return "frontend/community/qnaboard_list";
	}

	// 문의게시판 상세 페이지 이동
	@RequestMapping(value = "/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail(int qna_board_no, boolean qna_secret_chk, Model model, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();

		HashMap<String, Object> map = service.detail(qna_board_no);
		model.addAttribute("map", map);
		model.addAttribute("mvo", mvo);

		if (qna_secret_chk == false) {
			service.cntHit(qna_board_no); // 조회수 증가 쿼리
			return "frontend/community/qnaboard_detail";
		} else if (mem_no == 1 || mem_no == 2) { // 관리자일 경우 바로 읽기
			service.cntHit(qna_board_no); // 조회수 증가 쿼리
			return "frontend/community/qnaboard_detail";
		} else { // 비밀글일 경우 비밀번호 확인 페이지로 이동

			return "frontend/community/qnaboard_detailLock";
		}
	}

	// 문의게시판 비밀글 확인
	@RequestMapping(value = "/community/qnaboard_detailLock")
	public String qnaboard_detailLock(int qna_board_no, Model model, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();

		HashMap<String, Object> map = service.detail(qna_board_no);
		model.addAttribute("map", map);
		model.addAttribute("mvo", mvo);
		service.cntHit(qna_board_no); // 조회수 증가 쿼리

		return "frontend/community/qnaboard_detail";
	}

}
