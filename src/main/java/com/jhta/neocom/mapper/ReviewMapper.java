package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jhta.neocom.model.ReviewVo;


public interface ReviewMapper {
	int insert(ReviewVo vo);

	int delete(int board_num);
	int update(ReviewVo vo);
	int getCount(HashMap<String,Object> map);
	List<HashMap<String,Object>> list(HashMap<String,Object> map); //전체 리스트
	List<HashMap<String,Object>> ajaxlist(HashMap<String,Object> map); //ajax용 리스트
	ReviewVo detail(int board_num);
	double getAvgStar(int product_id);
	int getCountStar(HashMap<String,Integer> map);
	List<HashMap<String,Integer>> getStar(int product_id);

}
