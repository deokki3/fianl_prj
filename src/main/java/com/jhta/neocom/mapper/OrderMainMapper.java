package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.OrderMainVo;

public interface OrderMainMapper {
	int insert(OrderMainVo vo);

	int delete(int order_no);

	int searchno(HashMap<String, Object> map);

	OrderMainVo searchOrderMain(int order_no);
	
	OrderMainVo searchRndNo(HashMap<String, Object> map);

	int update(HashMap<String, Object> map);
	
	int updateDelivery(HashMap<String, Object> map);
	
	int updateMidNum(HashMap<String, Object> map);
	
	int updateno(HashMap<String, Object> map);
	
	int updateCC(HashMap<String, Object> map);
	
	int getCount(int mem_no);
	
	List<OrderMainVo> list();

	List<OrderMainVo> myOrderList(HashMap<String, Object> map);

	List<OrderMainVo> searchOrder(int order_no);
}
