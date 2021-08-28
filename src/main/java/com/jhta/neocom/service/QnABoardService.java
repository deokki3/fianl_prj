package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.QnABoardMapper;
import com.jhta.neocom.model.QnABoardVo;

@Service
public class QnABoardService {
	@Autowired private QnABoardMapper mapper;
	
	public int insert(QnABoardVo vo) {
		return mapper.insert(vo);
	}
	
	public int insertReply(QnABoardVo vo) {
		return mapper.insertReply(vo);
	}
	
	public int ReRe(QnABoardVo vo) {
		return mapper.ReRe(vo);
	}
	
	public int status(QnABoardVo vo) {
		return mapper.status(vo);
	}
	
	public int delete(int qna_board_no) {
		return mapper.delete(qna_board_no);
	}
	
	public int countReply(int qna_board_no) {
		return mapper.countReply(qna_board_no);
	}
	
	public int showDeletePost(int qna_board_no) {
		return mapper.showDeletePost(qna_board_no);
	}
	
	public int update(QnABoardVo vo) {
		return mapper.update(vo);
	}
	
	public int getCount(HashMap<String,Object> map) {
		return mapper.getCount(map);
	}
	
	public List<HashMap<String,Object>> list(HashMap<String,Object> map) {
		return mapper.list(map);
	}
	
	public HashMap<String,Object> detail(int qna_board_no) {
		return mapper.detail(qna_board_no);
	}
	
	public int cntHit(int qna_board_no) {
		return mapper.cntHit(qna_board_no);
	}
	
	
	public List<HashMap<String,Object>> myqna(int mem_no) {
		return mapper.myqna(mem_no);
	}
	
	
	public List<HashMap<String,Object>> qq_list(HashMap<String,Object> qq_map) {
		return mapper.qq_list(qq_map);
	}
}
