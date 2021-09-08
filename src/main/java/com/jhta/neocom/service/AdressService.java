package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.AdressMapper;
import com.jhta.neocom.model.AdressVo;

@Service
public class AdressService {
	@Autowired private AdressMapper mapper;
	
	public int addrTest(AdressVo vo) {
		return mapper.addrTest(vo);
	}
	
	public List<AdressVo> addrList(String id){
		return mapper.addrList(id);
	}
	
	public int addrModify(AdressVo vo) {
		return mapper.addrModify(vo);
	}
	public AdressVo zipSelect(int addr_no) {
		return mapper.zipSelect(addr_no);
	}
}
