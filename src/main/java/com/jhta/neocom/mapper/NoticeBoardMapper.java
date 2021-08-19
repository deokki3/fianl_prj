package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.NoticeBoardVo;

public interface NoticeBoardMapper {
	int insert(NoticeBoardVo vo);
	int delete(int n_board_no);
	int update(NoticeBoardVo vo);
	List<HashMap<String,Object>> list(HashMap<String,Object> map);
	NoticeBoardVo detail(int n_board_no);
	NoticeBoardVo prev(int n_board_no);
	NoticeBoardVo next(int n_board_no);
}
