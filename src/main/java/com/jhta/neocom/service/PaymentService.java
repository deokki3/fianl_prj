package com.jhta.neocom.service;

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


}
