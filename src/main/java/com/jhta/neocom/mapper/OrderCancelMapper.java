package com.jhta.neocom.mapper;


import java.util.HashMap;

import com.jhta.neocom.model.OrderCancelVo;


public interface OrderCancelMapper {
	int insert(OrderCancelVo vo);
	int delete(int order_detail_no);
	int updateODCC(HashMap<String, Object> map);
}
