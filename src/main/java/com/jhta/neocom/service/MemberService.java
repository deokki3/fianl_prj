package com.jhta.neocom.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberMapper;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.repository.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private MemberRepository memberRepository;

	public int insert(MemberVo vo) {
		return mapper.insert(vo);
	}

	public int insert_role(int mem_no) {
		return mapper.insert_role(mem_no);
	}

	public MemberVo select(String id) {
		return mapper.select(id);
	}

	public String selectpwd(String id) {
		return mapper.selectpwd(id);
	}

	public MemberVo isMember(String id) {
		return mapper.isMember(id);
	}

	public int searchNo(String id) {
		return mapper.searchNo(id);
	}

	public List<MemberVo> list() {
		return mapper.list();
	}

	public int updateNickname(MemberVo vo) {
		return mapper.updateNickname(vo);
	}

	public int updateName(MemberVo vo) {
		return mapper.updateName(vo);
	}

	public int updatePhone(MemberVo vo) {
		return mapper.updatePhone(vo);
	}

	public int updateEmail(MemberVo vo) {
		return mapper.updateEmail(vo);
	}

	public MemberVo selectid(String id) {
		return mapper.selectid(id);
	}

	public MemberVo findPwd(String id) {
		return mapper.findPwd(id);
	}

	public int memberDel(MemberVo vo) {
		return mapper.memberDel(vo);
	}

	public int delete_role(int mem_no) {
		return mapper.delete_role(mem_no);
	}

	public MemberVo login(MemberVo vo) {
		return mapper.login(vo);
	}

	public int update(MemberVo vo) {
		return mapper.update(vo);
	}

	public int updatePwd(MemberVo vo) {
		return mapper.updatePwd(vo);
	}

	public int delete(int mem_no) {
		return mapper.delete(mem_no);
	}

	public int idcheck(String id) {
		return mapper.idcheck(id);
	}

	public int emailcheck(String email) {
		return mapper.emailcheck(email);
	}

	public boolean checkIdDuplicate(String id) {
		return memberRepository.existsById(id);
	}

	// 아이디찾기
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mapper.findId(email);

		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	// 아이디찾기
	public String find_pwd(HttpServletResponse response, String id) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pwd = mapper.find_Pwd(id);

		if (pwd == null) {
			out.println("<script>");
			out.println("alert('가입된 비밀번호가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return pwd;
		}
	}

}