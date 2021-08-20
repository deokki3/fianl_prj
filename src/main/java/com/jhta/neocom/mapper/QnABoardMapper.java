package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.QnABoardVo;

public interface QnABoardMapper {
	int insert(QnABoardVo vo);
	int insertReply(QnABoardVo vo);
	int delete(int qna_board_no);
	int update(QnABoardVo vo);
	int getCount(HashMap<String,Object> map);
	List<HashMap<String,Object>> list(HashMap<String,Object> map);
	HashMap<String,Object> detail(int qna_board_no);
	int cntHit(int qna_board_no);
}
