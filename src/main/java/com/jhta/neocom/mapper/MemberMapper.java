package com.jhta.neocom.mapper;

import java.util.HashMap;

import com.jhta.neocom.model.MemberVo;

public interface MemberMapper {
	int insert(MemberVo vo);

	
	int select(String id);
	
	MemberVo isMember(HashMap<String, String> map);
	
	int searchNo(String id);

}
