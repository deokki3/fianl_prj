package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.CategoryVo;

public interface CategoryMapper {
	int insert(CategoryVo vo);

	int delete(int category_id);

	CategoryVo find(int category_id);

	List<CategoryVo> findChild(int category_parent);

	int update(CategoryVo vo);

	List<CategoryVo> list();

	String selectone(HashMap<String, Integer> map);

	List<HashMap<String, Integer>> selectjoin(int product_id); // 카테고리 디테일 order&order name뽑기
	
	
	List<CategoryVo> classification(int category_id); //카테고리별 분류
}
