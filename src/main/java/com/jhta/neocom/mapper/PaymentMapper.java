package com.jhta.neocom.mapper;

import com.jhta.neocom.model.PaymentVo;


public interface PaymentMapper {
	int insert(PaymentVo vo);
	int delete(int payment_num);
	
}
