package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.OrderMainMapper;
import com.jhta.neocom.model.OrderMainVo;

@Service
public class OrderMainService {
	@Autowired
	private OrderMainMapper mapper;

	public int insert(OrderMainVo vo) {
		return mapper.insert(vo);
	}

	public int delete(int order_no) {
		return mapper.delete(order_no);
	}

	public int searchno(HashMap<String, Object> map) {
		return mapper.searchno(map);
	}
	
	public OrderMainVo searchOrderMain(int order_no) {
		return mapper.searchOrderMain(order_no);
	}

	public OrderMainVo searchRndNo(HashMap<String, Object> map) {
		return mapper.searchRndNo(map);
	}

	public int update(HashMap<String, Object> map) {
		return mapper.update(map);
	}
	
	public int updateDelivery(HashMap<String, Object> map) {
		return mapper.updateDelivery(map);
	}
	
	public int updateMidNum(HashMap<String, Object> map) {
		return mapper.updateMidNum(map);
	}
	
	public int updateno(HashMap<String, Object> map) {
		return mapper.updateno(map);
	}
	
	public int updateCC(HashMap<String, Object> map) {
		return mapper.updateCC(map);
	}
	
	public int getCount(int mem_no) {
		return mapper.getCount(mem_no);
	}

	public List<OrderMainVo> myOrderList(HashMap<String, Object> map) {
		return mapper.myOrderList(map);
	}
	
	public List<OrderMainVo> searchOrder(int order_no) {
		return mapper.searchOrder(order_no);
	}

	public List<OrderMainVo> list() {
		return mapper.list();
	}

}
