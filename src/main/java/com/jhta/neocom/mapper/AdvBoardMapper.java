package com.jhta.neocom.mapper;
import java.util.HashMap;
import java.util.List;
import com.jhta.neocom.model.AdvBoardVo;




public interface AdvBoardMapper {
int create (AdvBoardVo vo);
int insertReply(AdvBoardVo vo);
int ReRe(AdvBoardVo vo);
int status(AdvBoardVo vo); //답변 상태 변경
int delete (int adv_board_no);
int countReply(int adv_board_no); // 답글 존재 여부
int showDeletePost(int adv_board_no); //원글 삭제시 답글 있는 경우 update
int update (AdvBoardVo vo);
AdvBoardVo find (int adv_board_no);
List<HashMap<String, Object>> selectBoardList(HashMap<String,Object> map);
int count (HashMap<String,Object> map);
HashMap<String, Object> detail (int adv_board_no);
int cntHit(int adv_board_no);
List<HashMap<String,Object>> list(HashMap<String,Object> map);

List<HashMap<String,Object>> aa_list(HashMap<String,Object> aa_map);
}
 