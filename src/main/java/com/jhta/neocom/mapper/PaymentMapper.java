package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;
import com.jhta.neocom.model.PaymentVo;


public interface PaymentMapper {
	int insert(PaymentVo vo);
	
	int delete(int payment_num);
	
	int update(HashMap<String, Object> map);
	
	int searchnum(int order_no);
	
	List<PaymentVo> list();
}
