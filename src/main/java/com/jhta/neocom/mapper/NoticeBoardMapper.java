package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.NoticeBoardVo;

public interface NoticeBoardMapper {
	int insert(NoticeBoardVo vo);
	int delete(int n_board_no);
	int update(NoticeBoardVo vo);
	int getCount(HashMap<String,Object> map);
	List<HashMap<String,Object>> list(HashMap<String,Object> map);
	HashMap<String,Object> detail(int n_board_no);
	int cntHit(int n_board_no);
	NoticeBoardVo prev(int n_board_no);
	NoticeBoardVo next(int n_board_no);
	
	List<HashMap<String,Object>> nn_list(HashMap<String,Object> nn_map);
}
