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

	int updateNickname(MemberVo vo);

	int updateName(MemberVo vo);

	int updatePhone(MemberVo vo);

	MemberVo selectid(String id);

	int memberDel(MemberVo vo);
	
	int delete_role(int mem_no);
	
	MemberVo login(MemberVo vo);

	int update(MemberVo vo);

	int delete(int mem_no);
}
