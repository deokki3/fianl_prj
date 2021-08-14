package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.CartVo;


public interface CartMapper {
	int insert(HashMap<String, Object> map);
	List<CartVo> cartList(int mem_no);
	int delete(int cart_no);
}
