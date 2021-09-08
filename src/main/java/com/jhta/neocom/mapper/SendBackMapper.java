package com.jhta.neocom.mapper;


import java.util.HashMap;
import com.jhta.neocom.model.SendBackVo;


public interface SendBackMapper {
	int insert(SendBackVo vo);
	int delete(int order_no);
	int updateSendBack(HashMap<String, Object> map);
}
