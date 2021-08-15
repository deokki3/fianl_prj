package com.jhta.neocom.mapper;


import java.util.List;


import com.jhta.neocom.model.OrderMainVo;


public interface OrderMainMapper {
	int insert(OrderMainVo vo);
	int delete(int order_no);
	
}
