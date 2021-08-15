package com.jhta.neocom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.CategoryMapper;
import com.jhta.neocom.model.CategoryVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryMapper mapper;

	public int insert(CategoryVo vo) {
		return mapper.insert(vo);
	}

	public CategoryVo find(int category_id) {
		return mapper.find(category_id);
	}

	public int delete(int category_id) {
		return mapper.delete(category_id);
	}

	public int update(CategoryVo vo) {
		return mapper.update(vo);
	}

	public List<CategoryVo> list() {
		return mapper.list();
	}

}
