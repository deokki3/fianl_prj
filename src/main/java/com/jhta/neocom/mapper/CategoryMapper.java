package com.jhta.neocom.mapper;

import java.util.List;

import com.jhta.neocom.model.CategoryVo;

public interface CategoryMapper {
	int insert(CategoryVo vo);

	int delete(int category_id);

	CategoryVo find(int category_id);

	int update(CategoryVo vo);

	List<CategoryVo> list();
}
