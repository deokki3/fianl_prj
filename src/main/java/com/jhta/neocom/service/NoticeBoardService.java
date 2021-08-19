package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.NoticeBoardMapper;
import com.jhta.neocom.model.NoticeBoardVo;

@Service
public class NoticeBoardService {
	@Autowired private NoticeBoardMapper mapper;
	
	public int insert(NoticeBoardVo vo) {
		return mapper.insert(vo);
	}
	
	public int delete(int n_board_no) {
		return mapper.delete(n_board_no);
	}
	
	public int update(NoticeBoardVo vo) {
		return mapper.update(vo);
	}
	
	public List<HashMap<String,Object>> list(HashMap<String,Object> map) {
		return mapper.list(map);
	}
	
	public NoticeBoardVo detail(int n_board_no) {
		return mapper.detail(n_board_no);
	}
	
	public NoticeBoardVo prev(int n_board_no) {
		return mapper.prev(n_board_no);
	}
	
	public NoticeBoardVo next(int n_board_no) {
		return mapper.next(n_board_no);
	}
}
