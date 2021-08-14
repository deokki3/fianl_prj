package com.jhta.neocom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.OrderMainMapper;
import com.jhta.neocom.model.OrderMainVo;



@Service
public class OrderMainService {
	@Autowired private OrderMainMapper mapper;
	
	public int insert(OrderMainVo vo) {
		return mapper.insert(vo);
	}

	public int delete(int order_no) {
		return mapper.delete(order_no);
	}


}
