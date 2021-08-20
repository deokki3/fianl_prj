package com.jhta.neocom.mapper;




import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.AdvBoardVo;




public interface AdvBoardMapper {
int create (AdvBoardVo vo);
int delete (int adv_board_no);
int update (AdvBoardVo vo);
AdvBoardVo find (int adv_board_no);
List<HashMap<String, Object>> selectBoardList(HashMap<String,Object> map);
int count (HashMap<String,Object> map);
}
