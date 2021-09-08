package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.WishlistVo;

public interface WishlistMapper {
	int insert(HashMap<String, Object> map);
	int delete(HashMap<String, Object> map);
	int getCount(WishlistVo vo);
	List<HashMap<String,Object>> list(HashMap<String, Object> map);
	int myCount(int mem_no);
}
