package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.MemberInfoVo;



public interface MemberInfoMapper {
	int insert(MemberInfoVo vo);
	List<MemberInfoVo> list();
	MemberInfoVo isMember(HashMap<String, String> map);
	int searchNo(String id);
}
