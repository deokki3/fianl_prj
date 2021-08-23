package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.MemberVo;

public interface MemberMapper {
	int insert(MemberVo vo);

	MemberVo select(String id);

	MemberVo isMember(HashMap<String, String> map);

	int searchNo(String id);

	List<MemberVo> list();
}
