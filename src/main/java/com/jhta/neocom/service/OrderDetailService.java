package com.jhta.neocom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.OrderDetailMapper;
import com.jhta.neocom.model.OrderDetailVo;




@Service
public class OrderDetailService {
	@Autowired private OrderDetailMapper mapper;
	
	public int insert(OrderDetailVo vo) {
		return mapper.insert(vo);
	}

	public int delete(int order_detail_no) {
		return mapper.delete(order_detail_no);
	}
	

}
