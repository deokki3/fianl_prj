package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jhta.neocom.mapper.PaymentMapper;
import com.jhta.neocom.model.PaymentVo;



@Service
public class PaymentService {
	@Autowired private PaymentMapper mapper;
	
	public int insert(PaymentVo vo) {
		return mapper.insert(vo);
	}

	public int delete(int payment_no) {
		return mapper.delete(payment_no);
	}

	public int update(HashMap<String, Object> map) {
		return mapper.update(map);
	}
	
	public List<PaymentVo> list() {
		return mapper.list();
	}

}
