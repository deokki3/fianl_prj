package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.OrderMainVo;

public interface OrderMainMapper {
	int insert(OrderMainVo vo);
	int delete(int order_no);
	int searchno(HashMap<String, Object> map);
	OrderMainVo searchRndNo(HashMap<String, Object> map);
	int updateno(HashMap<String, Object> map);
	List<OrderMainVo> myOrderList(int mem_no);
}