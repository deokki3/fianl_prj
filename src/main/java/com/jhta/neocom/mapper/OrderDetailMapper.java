package com.jhta.neocom.mapper;


import com.jhta.neocom.model.OrderDetailVo;


public interface OrderDetailMapper {
	int insert(OrderDetailVo vo);
	int delete(int order_detail_no);
	
}
