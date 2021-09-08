package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.AdressVo;



public interface AdressMapper {
	
	int addrTest(AdressVo vo);
	
	List<AdressVo> addrList(String id);
	
	int addrModify(AdressVo vo);
	
	AdressVo zipSelect(int addr_no);
}
