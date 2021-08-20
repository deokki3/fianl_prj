package com.jhta.neocom.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberMapper;
import com.jhta.neocom.model.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public void setMapper(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public int insert(MemberVo vo) {
		return mapper.insert(vo);
	}

	public int select(String id) {
		return mapper.select(id);
	}

	public MemberVo isMember(HashMap<String, String> map) {
		return mapper.isMember(map);
	}

	public int searchNo(String id) {
		return mapper.searchNo(id);
	}
}