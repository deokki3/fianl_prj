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

import com.jhta.neocom.model.AdvBoardVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.AdvBoardService;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class AdvBoardController {

	@Autowired
	AdvBoardService service;
	@Autowired
	MemberService m_service;

	// 견적문의게시판 문의하기 클릭
	@RequestMapping(value = "/service/advboard_insert", method = RequestMethod.GET)
	public String getWrite() throws Exception {
		return "frontend/service/advboard_insert";
	}

	// 견적문의게시판 글 작성 post
	@RequestMapping(value = "/service/advboard_insert", method = RequestMethod.POST)
	public String advboard_insertOk(Model model, AdvBoardVo vo, Authentication auth) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);

		service.create(vo);

		return "redirect:/service/advboard_list";
	}

	// 견적문의게시판 답변하기 클릭
	@RequestMapping(value = "/service/advboard_reply", method = RequestMethod.GET)
	public String advboard_insertReply(Model model, int adv_board_no) {
		HashMap<String, Object> map = service.detail(adv_board_no);
		model.addAttribute("map", map);

		return "frontend/service/advboard_reply";
	}

	// 견적문의게시판 답변 작성
	@RequestMapping(value = "/service/advboard_reply", method = RequestMethod.POST)
	public String qnaboard_replyOk(Model model, AdvBoardVo vo, Authentication auth, int adv_board_no) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);

		HashMap<String, Object> map = service.detail(adv_board_no);
		// System.out.println(map);
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

		System.out.println();
		System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + vo);
		System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + groupNo + "ㅇㅇㅇ" + groupOrder + "ㅇㅇㅇ" + groupDepth);
		System.out.println();

		service.ReRe(vo);
		service.insertReply(vo);
		service.status(vo); // 답변상태 변경

		return "redirect:/service/advboard_list";
	}

	// 문의게시판 리스트 페이지 이동
	@RequestMapping(value = "/service/advboard_list")
	public String advboard_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, Model model, HashMap<String, Object> map, Authentication auth, HttpSession session) {

		// String id = (String) session.getAttribute("id"); // 로그인 되있는 상태에서만 문의하기 버튼 사용
		// 가능
		// CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		// MemberVo mvo = cud.getMemberVo();
		// int mem_no = mvo.getMem_no();
		// String id = mvo.getId();

		map.put("field", field);
		map.put("keyword", keyword);

		int totalRowCount = service.count(map); // 전체 글 개수
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow() - 1;
		int endRow = pu.getEndRow();

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		model.addAttribute("advboardlist", service.list(map));
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		// model.addAttribute("id", id); // 세션에 있는 로그인 정보 가져오기
		// System.out.println(map);

		return "frontend/service/advboard_list";
	}

	// 문의게시판 글 삭제
	@RequestMapping(value = "/service/advboard_delete", method = RequestMethod.GET)
	public String advboard_delete(Model model, int adv_board_no, AdvBoardVo vo) {
		HashMap<String, Object> map = service.detail(adv_board_no);
		int groupNo = Integer.parseInt(map.get("adv_group_no").toString());
		int mem_no = Integer.parseInt(map.get("mem_no").toString());

		int countReply = service.countReply(adv_board_no);
		if (countReply == 1) { // 동일 group_no 조회시 개수가 1개일 때 = 답글이 없는 경우
			service.delete(adv_board_no);
		} else if (mem_no == 1 || mem_no == 2) { // 답글이 있어도 관리자일 경우 바로 삭제 + 원글은 답변대기 상태로 변경됨
			vo.setAdv_group_no(groupNo);
			vo.setAdv_status(0);

			service.delete(adv_board_no);
			service.status(vo);
		} else { // 답글이 있을 경우 제목과 내용 수정해서 삭제글 표시
			service.showDeletePost(adv_board_no);
		}

		return "redirect:/service/advboard_list";
	}

	// 견적문의 게시판 수정 등록
	@RequestMapping(value = "/service/advboard_update", method = RequestMethod.POST)
	public String advboard_updateOk(AdvBoardVo vo) {
		System.out.println(vo);
		service.update(vo);

		return "redirect:/service/advboard_list";
	}

	// 견적문의 게시판 수정 페이지 이동
	@RequestMapping(value = "/service/advboard_update", method = RequestMethod.GET)
	public String qnaboard_update(Model model, int adv_board_no) {
		HashMap<String, Object> map = service.detail(adv_board_no);
		model.addAttribute("map", map);
		return "frontend/service/advboard_update";
	}

	// 견적문의게시판 상세 페이지 이동
	@RequestMapping(value = "/service/advboard_detail", method = RequestMethod.GET)
	public String advboard_detail(int adv_board_no, boolean adv_secret_chk, Model model, Authentication auth) { // auth
																												// =
																												// 로그인을
																												// 하면 그
																												// 정보가
																												// 들어올거고
																												// 로그인을
																												// 안하면
																												// null로
																												// 들어와진다!

		HashMap<String, Object> map = service.detail(adv_board_no);
		model.addAttribute("map", map);

		if (auth != null) { // if를 not null을 줘야한다고 생각한 이유 - 로그인 하면 되고 로그인 안하면 null 포인트가 떠서
							// 근데 로그인하고 안하고는 나눠야겠고 그럼 if밖에 없는거여서 if(auth!=null)을 준거다.
			CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal(); // CustomUserDetails클래스에 auth.get~~를 쓰면 로그인
																				// 정보를 가져오는구나~
			MemberVo mvo = cud.getMemberVo();
			int mem_no = mvo.getMem_no();
			model.addAttribute("mvo", mvo);
			if (mem_no == 1 || mem_no == 2) { // 관리자일 경우 바로 읽기
				service.cntHit(adv_board_no); // 조회수 증가 쿼리
				return "frontend/service/advboard_detail";
			}

		}
		if (adv_secret_chk == false) {
			service.cntHit(adv_board_no); // 조회수 증가 쿼리
			return "frontend/service/advboard_detail";

		} else { // 비밀글일 경우 비밀번호 확인 페이지로 이동

			return "frontend/service/advboard_detailLock";
		}
	}

	// 문의게시판 비밀글 확인
	@RequestMapping(value = "/service/advboard_detailLock")
	public String qnaboard_detailLock(int adv_board_no, Model model, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();

		HashMap<String, Object> map = service.detail(adv_board_no);
		model.addAttribute("map", map);
		model.addAttribute("mvo", mvo);
		service.cntHit(adv_board_no); // 조회수 증가 쿼리

		return "frontend/service/advboard_detail";
	}

}