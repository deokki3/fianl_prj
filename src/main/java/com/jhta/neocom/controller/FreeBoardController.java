package com.jhta.neocom.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.FileVo;
import com.jhta.neocom.model.FreeBoardVo;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.FileService;
import com.jhta.neocom.service.FreeBoardService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class FreeBoardController {
	@Value("${spring.servlet.multipart.location}")
	private String uploadFilePath;
	@Autowired
	private FreeBoardService service;
	@Autowired
	private FileService f_service;

	// 자유게시판 등록 페이지 이동
	@RequestMapping(value = "/community/freeboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/freeboard_insert";
	}

	// 자유게시판 글 작성
	@RequestMapping(value = "/community/freeboard_insert", method = RequestMethod.POST)
	public String freeboard_insertOk(Model model, FreeBoardVo vo, Authentication auth,
			MultipartHttpServletRequest req) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);

		String path = uploadFilePath + "\\" + "board_file"; // 업로드 파일 절대경로 구하기
		System.out.println("경로 : " + path);
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		Iterator<String> files = req.getFileNames();
		MultipartFile mpf = req.getFile(files.next());

		if (mpf == null || mpf.getSize() <= 0) { // 첨부파일 없을 경우 글만 insert
			service.insert(vo);
		} else {

			service.insert(vo); // 보드테이블 인서트
			List<MultipartFile> fileList = req.getFiles("file_0");
			for (MultipartFile mf : fileList) { // 파일 개수만큼 for문 실행
				String file_name_org = mf.getOriginalFilename(); // 원본파일명
				long file_size = mf.getSize(); // 파일사이즈
				System.out.println("원본파일명 : " + file_name_org + ", 파일사이즈:" + file_size);

				String file_name_save = System.currentTimeMillis() + file_name_org;

				if (!file_name_org.equals("")) {
					try {
						InputStream is = mf.getInputStream();
						FileOutputStream fs = new FileOutputStream(path + "\\" + file_name_save);
						FileCopyUtils.copy(is, fs);
						is.close();
						fs.close();

						FileVo fvo = new FileVo(0, vo.getFree_board_no(), file_name_org, file_name_save, 0, file_size);
						f_service.fileInsert(fvo); // 파일테이블 인서트

					} catch (IllegalStateException ie) {
						ie.printStackTrace();
					} catch (IOException ioe) {
						ioe.printStackTrace();
					}
				}
			}

		}

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
	public String freeboard_replyOk(Model model, FreeBoardVo vo, Authentication auth, int free_board_no,
			MultipartHttpServletRequest req) throws Exception {

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

		// System.out.println();
		// System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + vo);
		// System.out.println("콘솔ㅇㅇㅇㅇㅇㅇㅇㅇ" + groupNo + "ㅇㅇㅇ" + groupOrder + "ㅇㅇㅇ" +
		// groupDepth);
		// System.out.println();

		String path = uploadFilePath + "\\" + "board_file"; // 업로드 파일 절대경로 구하기
		System.out.println("경로 : " + path);
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		Iterator<String> files = req.getFileNames();
		MultipartFile mpf = req.getFile(files.next());

		if (mpf == null || mpf.getSize() <= 0) { // 첨부파일 없을 경우 글만 insert
			service.ReRe(vo);
			service.insertReply(vo);
		} else {

			service.ReRe(vo);
			service.insertReply(vo);
			List<MultipartFile> fileList = req.getFiles("file_0");
			for (MultipartFile mf : fileList) { // 파일 개수만큼 for문 실행
				String file_name_org = mf.getOriginalFilename(); // 원본파일명
				long file_size = mf.getSize(); // 파일사이즈
				System.out.println("원본파일명 : " + file_name_org + ", 파일사이즈:" + file_size);

				String file_name_save = System.currentTimeMillis() + file_name_org;

				if (!file_name_org.equals("")) {
					try {
						InputStream is = mf.getInputStream();
						FileOutputStream fs = new FileOutputStream(path + "\\" + file_name_save);
						FileCopyUtils.copy(is, fs);
						is.close();
						fs.close();

						FileVo fvo = new FileVo(0, vo.getFree_board_no(), file_name_org, file_name_save, 0, file_size);
						f_service.fileInsert(fvo); // 파일테이블 인서트

					} catch (IllegalStateException ie) {
						ie.printStackTrace();
					} catch (IOException ioe) {
						ioe.printStackTrace();
					}
				}
			}

		}

		return "redirect:/community/freeboard_list";
	}

	// 자유게시판 글 삭제
	@RequestMapping(value = "/community/freeboard_delete", method = RequestMethod.GET)
	public String freeboard_delete(Model model, int free_board_no, FreeBoardVo vo) {
		String path = uploadFilePath + "\\" + "board_file"; // 업로드 파일 절대경로 구하기
		List<FileVo> flist = f_service.findFileNum(free_board_no);
		if (!(flist.size() == 0)) {
			try {
				for (FileVo fvo : flist) {

					File file = new File(URLDecoder.decode(path + "\\" + fvo.getFile_name_save(), "UTF-8"));
					file.delete();
					f_service.fileDelete(fvo.getFile_num());

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		HashMap<String, Object> map = service.detail(free_board_no);
		int groupNo = Integer.parseInt(map.get("free_group_no").toString());
		int mem_no = Integer.parseInt(map.get("mem_no").toString());
		int groupOrder = Integer.parseInt(map.get("free_group_order").toString());

		int countReply = service.countReply(groupNo);

		if (countReply == (groupOrder + 1)) { // 답글이 없거나, 맨 마지막 group_no 일 경우 바로 삭제
			service.delete(free_board_no);
		} else if (mem_no == 1 || mem_no == 2) { // 관리자일 경우 바로 삭제 - show 2번 부여
			vo.setFree_show(2);
			service.delete(free_board_no);
		} else { // 답글 있을 경우 삭제글로 표시 - show 1번 부여
			vo.setFree_show(1);
			service.showDeletePost(free_board_no);
		}
		// System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇ" + countReply + "," + groupOrder +
		// "ㅇㅇㅇㅇㅇㅇㅇㅇㅇ");

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
	public String freeboard_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, Model model, HashMap<String, Object> map, Authentication auth) {

		// CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		// MemberVo mvo = cud.getMemberVo();
		// int mem_no = mvo.getMem_no();
		// String id = mvo.getId();

		map.put("field", field);
		map.put("keyword", keyword);

		int totalRowCount = service.getCount(map);
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow = pu.getStartRow() - 1;
		int endRow = pu.getEndRow();

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		model.addAttribute("list", service.list(map));
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		// model.addAttribute("id", id);

		return "frontend/community/freeboard_list";
	}

	// 자유게시판 상세 페이지 이동
	@RequestMapping(value = "/community/freeboard_detail", method = RequestMethod.GET)
	public String freeboard_detail(int free_board_no, Model model, Authentication auth) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();

		HashMap<String, Object> map = service.detail(free_board_no);
		service.cntHit(free_board_no); // 조회수 증가 쿼리
		model.addAttribute("map", map);
		model.addAttribute("mvo", mvo);

		FreeBoardVo prev = service.prev(free_board_no);
		FreeBoardVo next = service.next(free_board_no);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		List<HashMap<String, Object>> filemap = f_service.fileList(free_board_no); // 첨부파일 리스트 출력
		model.addAttribute("filemap", filemap);
		// System.out.println(filemap);

		return "frontend/community/freeboard_detail";
	}

	// 첨부파일 다운로드
	@RequestMapping(value = "/community/freeboard_filedownload")
	public String fileInfo(int file_num, Model model, HttpServletResponse resp) throws Exception {
		// 다운로드할 파일 db에서 정보 가져오기
		FileVo vo = f_service.fileInfo(file_num);
		String path = uploadFilePath + "\\board_file";
		String file_name_org = vo.getFile_name_org(); // 다운로드 할 때 보여질 파일명
		String file_name_save = vo.getFile_name_save();
		long file_size = vo.getFile_size();

		// 다운로드 창 띄우기
		resp.setContentLengthLong(file_size);
		file_name_org = URLEncoder.encode(file_name_org, "utf-8");
		file_name_org.replaceAll("\\\\", "%20");
		resp.setHeader("Content-Disposition", "attachment;filename=" + file_name_org);

		// 사용자의 컴퓨터로 다운로드
		String dir = path + "\\" + file_name_save;
		FileInputStream fis = new FileInputStream(dir);
		OutputStream os = resp.getOutputStream();
		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		byte[] b = new byte[1024];

		int n = 0;
		while ((n = bis.read(b)) != -1) {
			bos.write(b, 0, n);
		}
		bos.close();
		bis.close();

		return "frontend/community/freeboard_detail";
	}

	/*
	 * 첨부파일 다운로드
	 * 
	 * @RequestMapping(value = "/community/freeboard_filedownload") public void
	 * fileInfo(@RequestParam Map<String, Object> map, HttpServletResponse resp) {
	 * Map<String, Object> resultMap = f_service.fileInfo(map); String
	 * file_name_save = (String) resultMap.get("file_name_save"); String
	 * file_name_org = (String) resultMap.get("file_name_org");
	 * 
	 * // 첨부파일을 읽어 byte[] 형식으로 변환 byte fileByte[] =
	 * org.apache.commons.io.FileUtils.readFileToByteArray(new File(uploadFilePath +
	 * "\\" + "board_file"));
	 * 
	 * resp.setContentType("application/octet-stream");
	 * resp.setContentLength(fileByte.length); resp.setHeader("Content-Disposition",
	 * "attachment; fileName=\"" + URLEncoder.encode(file_name_org));
	 * resp.getOutputStream().write(fileByte); resp.getOutputStream().flush();
	 * resp.getOutputStream().close(); }
	 */
}
