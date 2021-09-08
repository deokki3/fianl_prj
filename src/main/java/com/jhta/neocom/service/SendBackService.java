package com.jhta.neocom.service;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jhta.neocom.mapper.SendBackMapper;
import com.jhta.neocom.model.SendBackVo;

@Service
public class SendBackService {
	@Autowired private SendBackMapper mapper;
	
	public int insert(SendBackVo vo) {
		return mapper.insert(vo);
	}

	public int delete(int order_no) {
		return mapper.delete(order_no);
	}
	
	public int updateSendBack(HashMap<String, Object> map) {
		return mapper.updateSendBack(map);
	}
	

}
