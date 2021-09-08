package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.WishlistMapper;
import com.jhta.neocom.model.WishlistVo;

@Service
public class WishlistService {
	@Autowired private WishlistMapper mapper;
	
	public int insert(HashMap<String, Object> map) {
		return mapper.insert(map);
	}
	
	public int delete(HashMap<String, Object> map) {
		return mapper.delete(map);
	}
	
	public int getCount(WishlistVo vo) {
		return mapper.getCount(vo);
	}
	
	public List<HashMap<String,Object>> list(HashMap<String, Object> map) {
		return mapper.list(map);
	}
	
	public int myCount(int mem_no) {
		return mapper.myCount(mem_no);
	}
}
