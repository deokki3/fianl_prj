package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.ReviewMapper;
import com.jhta.neocom.model.ReviewVo;

@Service
public class ReviewService {
	@Autowired private ReviewMapper mapper;
	
	public int insert(ReviewVo vo) {
		return mapper.insert(vo);
	}
	

	
	public int delete(int board_num) {
		return mapper.delete(board_num);
	}
	
	public int update(ReviewVo vo) {
		return mapper.update(vo);
	}
	
	public int getCount(HashMap<String,Object> map) {
		return mapper.getCount(map);
	}
	
	public List<HashMap<String,Object>> list(HashMap<String,Object> map) {
		return mapper.list(map); //전체 리스트용
	}
	public List<HashMap<String,Object>> ajaxlist(HashMap<String,Object> map) {
		return mapper.ajaxlist(map); //ajax 리스트용
	}
	public ReviewVo detail(int board_num) {
		return mapper.detail(board_num);
	}
	

}
