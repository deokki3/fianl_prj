package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberInfoMapper;
import com.jhta.neocom.model.MemberInfoVo;


@Service
public class MemberInfoService {
	@Autowired private MemberInfoMapper mapper;
	
	public int insert(MemberInfoVo vo) {
		return mapper.insert(vo);
	}
	public List<MemberInfoVo> list(){
		return mapper.list();
	}
	public MemberInfoVo isMember(HashMap<String, String> map) {
		return mapper.isMember(map);
	}
	public int searchNo(String id) {
		return mapper.searchNo(id);
	}
	public String searchNickname(String id) {
		return mapper.searchNickname(id);
	}
}
