package com.jhta.neocom.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.AdvBoardVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.FreeBoardVo;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.NoticeBoardVo;
import com.jhta.neocom.model.QnABoardVo;
import com.jhta.neocom.service.AdvBoardService;
import com.jhta.neocom.service.FreeBoardService;
import com.jhta.neocom.service.NoticeBoardService;
import com.jhta.neocom.service.QnABoardService;

@Controller
public class CommunityController {
	@Autowired
	private NoticeBoardService nn_service;
	@Autowired
	private QnABoardService qq_service;
	@Autowired
	private FreeBoardService ff_service;
	@Autowired
	private AdvBoardService aa_service;

	// board_list 내용
	@RequestMapping(value = "/admin/community/board_list", method = RequestMethod.GET)
	public String boardList(Model nn_model, HashMap<String, Object> nn_map, Model qq_model,
			HashMap<String, Object> qq_map, Model ff_model, HashMap<String, Object> ff_map, Model aa_model,
			HashMap<String, Object> aa_map) {
		// 공지사항 리스트
		nn_model.addAttribute("nn_list", nn_service.nn_list(nn_map));

		// 문의게시판 리스트
		qq_model.addAttribute("qq_list", qq_service.qq_list(qq_map));

		// 자유게시판 리스트
		ff_model.addAttribute("ff_list", ff_service.ff_list(ff_map));

		// 견적게시판 리스트
		aa_model.addAttribute("aa_list", aa_service.aa_list(aa_map));

		return "/admin/menu/community/board_list";
	}

	// -------------------------------- 공지사항 --------------------------------
	// 공지사항 등록 페이지 이동
	@RequestMapping(value = "/admin/community/noticeboard_insert", method = RequestMethod.GET)
	public String noticeboardInsert() {
		return "/admin/menu/community/noticeboard_insert";
	}

	// 공지사항 등록 저장
	@RequestMapping(value = "/admin/community/noticeboard_insert", method = RequestMethod.POST)
	public String noticeboardInsertOk(Model model, NoticeBoardVo vo, Authentication auth) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);

		System.out.println(vo);
		nn_service.insert(vo);

		return "redirect:/admin/community/board_list";
	}

	// 공지사항 삭제
	@RequestMapping(value = "/admin/community/noticeboard_delete", method = RequestMethod.GET)
	public String noticeboardDelete(int n_board_no) {
		nn_service.delete(n_board_no);
		return "redirect:/admin/community/board_list";
	}

	// 공지사항 수정
	@RequestMapping(value = "/admin/community/noticeboard_update", method = RequestMethod.POST)
	public String noticeboardUpdate(NoticeBoardVo vo) {
		nn_service.update(vo);
		return "redirect:/admin/community/board_list";
	}

	// -------------------------------- 공지사항 끝 --------------------------------

	// -------------------------------- 문의게시판 ----------------------------------
	// 문의게시판 상세보기 페이지 이동
	@RequestMapping(value = "/admin/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboardDetail(Model model, int qna_board_no) {
		HashMap<String, Object> map = qq_service.detail(qna_board_no);
		qq_service.cntHit(qna_board_no);
		model.addAttribute("map", map);

		return "/admin/menu/community/qnaboard_detail";
	}

	// 문의게시판 답변 페이지 이동
	@RequestMapping(value = "/admin/community/qnaboard_reply", method = RequestMethod.GET)
	public String qnaboardReply(Model model, int qna_board_no) {
		HashMap<String, Object> map = qq_service.detail(qna_board_no);
		model.addAttribute("map", map);

		return "/admin/menu/community/qnaboard_reply";
	}

	// 문의게시판 답변 작성
	@RequestMapping(value = "/admin/community/qnaboard_reply", method = RequestMethod.POST)
	public String qnaboardReplyOk(Model model, QnABoardVo vo, Authentication auth, int qna_board_no) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);
		String Nickname = mvo.getNickname();
		vo.setNickname(Nickname);

		HashMap<String, Object> map = qq_service.detail(qna_board_no);
		// System.out.println("맵:" + map);
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

		qq_service.ReRe(vo);
		qq_service.insertReply(vo);
		qq_service.status(vo); // 답변상태 변경

		return "redirect:/admin/community/board_list";
	}

	// 문의게시판 답변 삭제
	@RequestMapping(value = "/admin/community/qnaboard_delete", method = RequestMethod.GET)
	public String qnaboardDelete(int qna_board_no, QnABoardVo vo) {
		HashMap<String, Object> map = qq_service.detail(qna_board_no);
		int groupNo = Integer.parseInt(map.get("qna_group_no").toString());
		int mem_no = Integer.parseInt(map.get("mem_no").toString());
		int groupOrder = Integer.parseInt(map.get("qna_group_order").toString());

		int countReply = qq_service.countReply(groupNo);

		if (countReply == (groupOrder + 1)) {
			vo.setQna_group_no(groupNo);
			vo.setQna_status(0); // 답변 삭제하면 답변상태는 다시 답변대기로 바꾸기

			qq_service.delete(qna_board_no);
			qq_service.status(vo);
		} else if (mem_no == 1 || mem_no == 2) {
			vo.setQna_group_no(groupNo);
			vo.setQna_status(0); // 답변 삭제하면 답변상태는 다시 답변대기로 바꾸기

			qq_service.delete(qna_board_no);
			qq_service.status(vo);
		} else {
			qq_service.showDeletePost(qna_board_no);
		}

		return "redirect:/admin/community/board_list";
	}

	// 문의게시판 수정
	@RequestMapping(value = "/admin/community/qnaboard_update", method = RequestMethod.POST)
	public String qnaboardUpdate(QnABoardVo vo) {
		System.out.println(vo);
		qq_service.update(vo);

		return "redirect:/admin/community/board_list";
	}
	// -------------------------------- 문의게시판 끝 --------------------------------

	// -------------------------------- 자유게시판 ----------------------------------
	// 자유게시판 상세보기 페이지 이동
	@RequestMapping(value = "/admin/community/freeboard_detail", method = RequestMethod.GET)
	public String freeboardDetail(Model model, int free_board_no) {
		HashMap<String, Object> map = ff_service.detail(free_board_no);
		qq_service.cntHit(free_board_no);
		model.addAttribute("map", map);

		return "/admin/menu/community/freeboard_detail";
	}

	// 자유게시판 답글 페이지 이동
	@RequestMapping(value = "/admin/community/freeboard_reply", method = RequestMethod.GET)
	public String freeboardReply(Model model, int free_board_no) {
		HashMap<String, Object> map = ff_service.detail(free_board_no);
		model.addAttribute("map", map);

		return "/admin/menu/community/freeboard_reply";
	}

	// 자유게시판 답변 작성
	@RequestMapping(value = "/admin/community/freeboard_reply", method = RequestMethod.POST)
	public String freeboardReplyOk(Model model, FreeBoardVo vo, Authentication auth, int free_board_no) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);
		String Nickname = mvo.getNickname();
		vo.setNickname(Nickname);

		HashMap<String, Object> map = ff_service.detail(free_board_no);
		// System.out.println("맵:" + map);
		int groupNo = Integer.parseInt(map.get("free_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("free_group_order").toString());
		int groupDepth = Integer.parseInt(map.get("free_group_depth").toString());

		vo.setFree_group_no(groupNo);
		vo.setFree_group_order(groupOrder);
		vo.setFree_group_depth(groupDepth);

		ff_service.ReRe(vo);
		ff_service.insertReply(vo);

		return "redirect:/admin/community/board_list";
	}

	// 자유게시판 글 삭제
	@RequestMapping(value = "/admin/community/freeboard_delete", method = RequestMethod.GET)
	public String freeboardDelete(int free_board_no, FreeBoardVo vo, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();

		HashMap<String, Object> map = ff_service.detail(free_board_no);
		int groupNo = Integer.parseInt(map.get("free_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("free_group_order").toString());

		int countReply = ff_service.countReply(groupNo);

		if (countReply == (groupOrder + 1)) { // 답글이 없거나, 맨 마지막 group_no 일 경우 바로 삭제
			ff_service.delete(free_board_no);
		} else if (mem_no == 1 || mem_no == 2) { // 관리자일 경우 바로 삭제
			ff_service.delete(free_board_no);
		} else { // 답글 있을 경우 삭제글로 표시
			ff_service.showDeletePost(free_board_no);
		}
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇ" + countReply + "," + groupOrder + "ㅇㅇㅇㅇㅇㅇㅇㅇㅇ");

		return "redirect:/admin/community/board_list";
	}

	// 자유게시판 블라인드 처리
	@RequestMapping(value = "/admin/community/freeboard_blind", method = RequestMethod.GET)
	public String freeboardBlind(int free_board_no) {
		ff_service.blindPost(free_board_no);
		return "redirect:/admin/community/board_list";
	}

	// 자유게시판 블라인드 해제
	@RequestMapping(value = "/admin/community/freeboard_showpost", method = RequestMethod.GET)
	public String freeboardShowPost(int free_board_no) {
		ff_service.showPost(free_board_no);
		return "redirect:/admin/community/board_list";
	}

	// 자유게시판 수정
	@RequestMapping(value = "/admin/community/freeboard_update", method = RequestMethod.POST)
	public String freeboardUpdate(FreeBoardVo vo) {
		System.out.println(vo);
		ff_service.update(vo);

		return "redirect:/admin/community/board_list";
	}
	// -------------------------------- 자유게시판 끝 --------------------------------

	// -------------------------------- 견적문의게시판 ----------------------------------
	// 견적문의게시판 상세보기 페이지 이동
	@RequestMapping(value = "/admin/community/advboard_detail", method = RequestMethod.GET)
	public String advboardDetail(Model model, int adv_board_no) {
		HashMap<String, Object> map = aa_service.detail(adv_board_no);
		aa_service.cntHit(adv_board_no);
		model.addAttribute("map", map);

		return "/admin/menu/community/advboard_detail";
	}

	// 견적문의게시판 답변 페이지 이동
	@RequestMapping(value = "/admin/community/advboard_reply", method = RequestMethod.GET)
	public String advboardReply(Model model, int adv_board_no) {
		HashMap<String, Object> map = aa_service.detail(adv_board_no);
		model.addAttribute("map", map);

		return "/admin/menu/community/advboard_reply";
	}

	// 견적문의게시판 답변 작성
	@RequestMapping(value = "/admin/community/advboard_reply", method = RequestMethod.POST)
	public String advboardReplyOk(Model model, AdvBoardVo vo, Authentication auth, int adv_board_no) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);
		String Nickname = mvo.getNickname();
		vo.setNickname(Nickname);

		HashMap<String, Object> map = aa_service.detail(adv_board_no);
		// System.out.println("맵:" + map);
		int groupNo = Integer.parseInt(map.get("adv_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("adv_group_order").toString());
		int groupDepth = Integer.parseInt(map.get("adv_group_depth").toString());
		String adv_secret_chk = map.get("adv_secret_chk").toString();

		if (!adv_secret_chk.equals(null)) { // 문의글이 비밀글인지 아닌지에 따라 등록됨
			if (adv_secret_chk.equals("true")) {
				String adv_password = map.get("adv_password").toString();
				vo.setAdv_secret_chk(1);
				vo.setAdv_password(adv_password); // 비밀글일 경우 문의작성자가 등록한 비밀번호로 등록
			} else {
				vo.setAdv_secret_chk(0);
				vo.setAdv_password(null);
			}
		}

		vo.setAdv_group_no(groupNo);
		vo.setAdv_group_order(groupOrder);
		vo.setAdv_group_depth(groupDepth);
		vo.setAdv_status(1);

		aa_service.ReRe(vo);
		aa_service.insertReply(vo);
		aa_service.status(vo); // 답변상태 변경

		return "redirect:/admin/community/board_list";
	}

	// 문의게시판 답변 삭제
	@RequestMapping(value = "/admin/community/advboard_delete", method = RequestMethod.GET)
	public String advboardDelete(int adv_board_no, AdvBoardVo vo) {
		HashMap<String, Object> map = aa_service.detail(adv_board_no);
		int groupNo = Integer.parseInt(map.get("adv_group_no").toString());
		int mem_no = Integer.parseInt(map.get("mem_no").toString());
		int groupOrder = Integer.parseInt(map.get("adv_group_order").toString());

		int countReply = qq_service.countReply(groupNo);

		if (countReply == (groupOrder + 1)) {
			vo.setAdv_group_no(groupNo);
			vo.setAdv_status(0); // 답변 삭제하면 답변상태는 다시 답변대기로 바꾸기

			aa_service.delete(adv_board_no);
			aa_service.status(vo);
		} else if (mem_no == 1 || mem_no == 2) {
			vo.setAdv_group_no(groupNo);
			vo.setAdv_status(0); // 답변 삭제하면 답변상태는 다시 답변대기로 바꾸기

			aa_service.delete(adv_board_no);
			aa_service.status(vo);
		} else {
			aa_service.showDeletePost(adv_board_no);
		}

		return "redirect:/admin/community/board_list";
	}

	// 견적문의게시판 수정
	@RequestMapping(value = "/admin/community/advboard_update", method = RequestMethod.POST)
	public String advboardUpdate(AdvBoardVo vo) {
		System.out.println(vo);
		aa_service.update(vo);

		return "redirect:/admin/community/board_list";
	}
	// -------------------------------- 견적문의게시판 끝 --------------------------------
}