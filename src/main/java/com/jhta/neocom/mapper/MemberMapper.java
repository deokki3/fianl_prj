package com.jhta.neocom.mapper;

import java.util.List;

import com.jhta.neocom.model.MemberVo;

public interface MemberMapper {
	int insert(MemberVo vo);

	int insert_role(int mem_no);

	MemberVo select(String id);

	MemberVo isMember(String id);

	int searchNo(String id);

	List<MemberVo> list();

	int updateNickname(MemberVo vo);

	int updateName(MemberVo vo);

	int updatePhone(MemberVo vo);
	
	int updateEmail(MemberVo vo);

	MemberVo selectid(String id);
	
	String selectpwd(String id);

	int memberDel(MemberVo vo);
	
	int delete_role(int mem_no);
	
	MemberVo login(MemberVo vo);

	int update(MemberVo vo);
	
	int updatePwd(MemberVo vo);

	int delete(int mem_no);
	
	String findId(String email);
	
	String find_Pwd(String email);
	
	MemberVo findPwd(String id);
	
	int idcheck(String id);
	
	int emailcheck(String email);
	
	MemberVo logina(String id);
}
