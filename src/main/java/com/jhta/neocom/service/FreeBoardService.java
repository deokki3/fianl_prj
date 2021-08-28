package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.FreeBoardMapper;
import com.jhta.neocom.model.FreeBoardVo;

@Service
public class FreeBoardService {
	@Autowired private FreeBoardMapper mapper;
	
	public int insert(FreeBoardVo vo) {
		return mapper.insert(vo);
	}
	
	public int insertReply(FreeBoardVo vo) {
		return mapper.insertReply(vo);
	}
	
	public int ReRe(FreeBoardVo vo) {
		return mapper.ReRe(vo);
	}
	
	public int delete(int free_board_no) {
		return mapper.delete(free_board_no);
	}
	
	public int countReply(int free_board_no) {
		return mapper.countReply(free_board_no);
	}
	
	public int showDeletePost(int free_board_no) {
		return mapper.showDeletePost(free_board_no);
	}
	
	public int update(FreeBoardVo vo) {
		return mapper.update(vo);
	}
	
	public int getCount(HashMap<String,Object> map) {
		return mapper.getCount(map);
	}
	
	public List<HashMap<String,Object>> list(HashMap<String,Object> map) {
		return mapper.list(map);
	}
	
	public HashMap<String,Object> detail(int free_board_no) {
		return mapper.detail(free_board_no);
	}
	
	public int cntHit(int free_board_no) {
		return mapper.cntHit(free_board_no);
	}
	
	public FreeBoardVo prev(int free_board_no) {
		return mapper.prev(free_board_no);
	}
	
	public FreeBoardVo next(int free_board_no) {
		return mapper.next(free_board_no);
	}
}
