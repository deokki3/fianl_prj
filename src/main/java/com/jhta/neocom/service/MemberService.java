package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberMapper;
import com.jhta.neocom.model.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public int insert(MemberVo vo) {
		return mapper.insert(vo);
	}

	public int insert_role(int mem_no) {
		return mapper.insert_role(mem_no);
	}

	public MemberVo select(String id) {
		return mapper.select(id);
	}

	public MemberVo isMember(HashMap<String, String> map) {
		return mapper.isMember(map);
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

	public MemberVo selectid(String id) {
		return mapper.selectid(id);
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

	public int delete(int mem_no) {
		return mapper.delete(mem_no);
	}
}