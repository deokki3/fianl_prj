package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.CartMapper;
import com.jhta.neocom.model.CartVo;


@Service
public class CartService {
	@Autowired private CartMapper mapper;
	
	public int insert(HashMap<String, Object> map) {
		return mapper.insert(map);
	}

	public int delete(int cart_no) {
		return mapper.delete(cart_no);
	}
	
	public List<CartVo> cartList(int mem_no){
		return mapper.cartList(mem_no);
	}
	
	public int update(HashMap<String, Object> map) {
		return mapper.update(map);
	}

}