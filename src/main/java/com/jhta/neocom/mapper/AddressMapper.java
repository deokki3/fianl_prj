package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.AddressVo;



public interface AddressMapper {
	
	int addrTest(AddressVo vo);
	
	List<AddressVo> addrList(String id);
	
	List<AddressVo> myAddrList(int mem_no);
	
	AddressVo searchAddr(HashMap<String, Object> map);
	
	int addrModify(AddressVo vo);
	
	AddressVo zipSelect(int addr_no);

}
