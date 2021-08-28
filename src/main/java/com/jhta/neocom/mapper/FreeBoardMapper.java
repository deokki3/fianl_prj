package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.FreeBoardVo;

public interface FreeBoardMapper {
	int insert(FreeBoardVo vo);
	int insertReply(FreeBoardVo vo);
	int ReRe(FreeBoardVo vo);
	int delete(int free_board_no);
	int countReply(int free_board_no);  //답글 존재여부
	int showDeletePost(int free_board_no);  //원글 삭제시 답글 있는 경우 update
	int update(FreeBoardVo vo);
	int getCount(HashMap<String,Object> map);
	List<HashMap<String,Object>> list(HashMap<String,Object> map);
	HashMap<String,Object> detail(int free_board_no);
	int cntHit(int free_board_no);
	FreeBoardVo prev(int free_board_no);
	FreeBoardVo next(int free_board_no);
}
