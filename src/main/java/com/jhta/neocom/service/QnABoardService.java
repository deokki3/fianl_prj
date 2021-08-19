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
	
	public int delete(int qna_board_no) {
		return mapper.delete(qna_board_no);
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
	
	public QnABoardVo detail(int qna_board_no) {
		return mapper.detail(qna_board_no);
	}
}
