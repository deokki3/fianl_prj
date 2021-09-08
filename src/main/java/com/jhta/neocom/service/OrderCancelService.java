package com.jhta.neocom.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.OrderCancelMapper;
import com.jhta.neocom.model.OrderCancelVo;




@Service
public class OrderCancelService {
	@Autowired private OrderCancelMapper mapper;
	
	public int insert(OrderCancelVo vo) {
		return mapper.insert(vo);
	}

	public int delete(int order_detail_no) {
		return mapper.delete(order_detail_no);
	}
	
	public int updateODCC(HashMap<String, Object> map) {
		return mapper.updateODCC(map);
	}
	

}
