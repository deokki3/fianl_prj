package com.jhta.neocom.mapper;


import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.OrderDetailVo;
import com.jhta.neocom.model.OrderMainVo;


public interface OrderDetailMapper {
	int insert(OrderDetailVo vo);
	int delete(int order_detail_no);
	
}
