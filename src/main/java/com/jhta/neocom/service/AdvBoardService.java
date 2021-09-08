
package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.AdvBoardMapper;
import com.jhta.neocom.model.AdvBoardVo;

@Service
public class AdvBoardService {

@Autowired
private AdvBoardMapper mapper;

public int create(AdvBoardVo vo) {
	return mapper.create(vo);
}
public int insertReply(AdvBoardVo vo) {
	return mapper.insertReply(vo);
}
public int ReRe(AdvBoardVo vo) {
	return mapper.ReRe(vo);
}
public int status(AdvBoardVo vo) {
	return mapper.status(vo);
}
public int delete(int adv_board_no) {
     return mapper.delete(adv_board_no);
}
public int countReply(int adv_board_no) { //답글 존재 여부
	return mapper.countReply(adv_board_no);
} 
public int showDeletePost(int adv_board_no) {
	return mapper.showDeletePost(adv_board_no);
}
public int update(AdvBoardVo vo) {
	return mapper.update(vo);
}
public AdvBoardVo find(int adv_board_no) {
	return mapper.find(adv_board_no);
}
public List<HashMap<String, Object>> selectBoardList(HashMap<String,Object> map){
	return mapper.selectBoardList(map);
}
public int count(HashMap<String,Object> map) {
	return mapper.count(map);
}
public HashMap<String, Object> detail(int adv_board_no) {
	return mapper.detail(adv_board_no);
}
public int cntHit(int adv_board_no) {
	return mapper.cntHit(adv_board_no);
}
public List<HashMap<String,Object>> list(HashMap<String,Object> map) {
	return mapper.list(map);
}

public List<HashMap<String,Object>> aa_list(HashMap<String,Object> aa_map) {
	return mapper.aa_list(aa_map);
}
}

