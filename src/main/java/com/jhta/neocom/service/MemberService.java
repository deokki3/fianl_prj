package com.jhta.neocom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberMapper;
import com.jhta.neocom.model.MemberVo;

@Service
public class MemberService {
	@Autowired private MemberMapper mapper;
	
	public int insert(MemberVo vo) {
		return mapper.insert(vo);
	}
}
