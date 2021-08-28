package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.QnABoardVo;

public interface QnABoardMapper {
	int insert(QnABoardVo vo);
	int insertReply(QnABoardVo vo);
	int ReRe(QnABoardVo vo);
	int status(QnABoardVo vo);  //답변상태 변경
	int delete(int qna_board_no);
	int countReply(int qna_board_no);  //답글 존재여부
	int showDeletePost(int qna_board_no);  //원글 삭제시 답글 있는 경우 update
	int update(QnABoardVo vo);
	int getCount(HashMap<String,Object> map);
	List<HashMap<String,Object>> list(HashMap<String,Object> map);
	HashMap<String,Object> detail(int qna_board_no);
	int cntHit(int qna_board_no);
	
	List<HashMap<String,Object>> myqna(int mem_no);
	
	List<HashMap<String,Object>> qq_list(HashMap<String,Object> qq_map);
}
