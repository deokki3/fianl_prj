package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.MemberVo;

public interface MemberMapper {
	int insert(MemberVo vo);

	int insert_role(int mem_no);

	MemberVo select(String id);

	MemberVo isMember(HashMap<String, String> map);

	int searchNo(String id);

	List<MemberVo> list();
}
