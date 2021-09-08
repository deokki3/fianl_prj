package com.jhta.neocom.service;


import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.AddressMapper;
import com.jhta.neocom.model.AddressVo;

@Service
public class AddressService {
	@Autowired private AddressMapper mapper;
	
	public int addrTest(AddressVo vo) {
		return mapper.addrTest(vo);
	}
	
	public List<AddressVo> addrList(String id){
		return mapper.addrList(id);
	}
	
	public List<AddressVo> myAddrList(int mem_no){
		return mapper.myAddrList(mem_no);
	}
	
	public AddressVo searchAddr(HashMap<String, Object> map){
		return mapper.searchAddr(map);
	}
	
	public int addrModify(AddressVo vo) {
		return mapper.addrModify(vo);
	}
	public AddressVo zipSelect(int addr_no) {
		return mapper.zipSelect(addr_no);
	}
}
